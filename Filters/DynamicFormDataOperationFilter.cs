// File: MathWorldAPI/Filters/DynamicFormDataOperationFilter.cs

using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Reflection;

namespace MathWorldAPI.Filters
{
    /// <summary>
    /// Dynamic Swagger operation filter that automatically documents 
    /// multipart/form-data endpoints by reflecting over DTO properties.
    /// Supports IFormFile, arrays, primitives, enums, and [Description] attributes.
    /// No manual updates needed when adding new form-based endpoints.
    /// </summary>
    public class DynamicFormDataOperationFilter : IOperationFilter
    {
        /// <summary>
        /// Applies the filter to add dynamic FormData documentation to Swagger operations.
        /// </summary>
        /// <param name="operation">The OpenAPI operation to modify</param>
        /// <param name="context">Context containing method and parameter information</param>
        public void Apply(OpenApiOperation operation, OperationFilterContext context)
        {
            // Find all action parameters marked with [FromForm] attribute
            var formParameters = context.MethodInfo.GetParameters()
                .Where(p => p.GetCustomAttributes(true)
                    .OfType<FromFormAttribute>().Any());

            // If no FromForm parameters found, skip this operation
            if (!formParameters.Any())
                return;

            foreach (var param in formParameters)
            {
                var parameterType = param.ParameterType;

                // Skip primitive types or string (handled differently)
                if (parameterType.IsPrimitive || parameterType == typeof(string))
                    continue;

                // Get all public instance properties from the DTO class
                var properties = parameterType.GetProperties(
                    BindingFlags.Public | BindingFlags.Instance);

                if (!properties.Any())
                    continue;

                // Build the OpenAPI schema object for multipart/form-data
                var schema = new OpenApiSchema
                {
                    Type = "object",
                    Properties = new Dictionary<string, OpenApiSchema>(),
                    Required = new HashSet<string>()
                };

                foreach (var prop in properties)
                {
                    // ========== Handle File Uploads (IFormFile) ==========

                    // Single file upload
                    if (prop.PropertyType == typeof(IFormFile))
                    {
                        schema.Properties[prop.Name] = new OpenApiSchema
                        {
                            Type = "string",
                            Format = "binary",
                            Description = GetPropertyDescription(prop) ?? $"File upload: {prop.Name}",
                            Nullable = IsPropertyNullable(prop)
                        };
                    }
                    // Multiple files upload (array)
                    else if (prop.PropertyType == typeof(IFormFile[]) ||
                             prop.PropertyType == typeof(List<IFormFile>) ||
                             prop.PropertyType == typeof(IEnumerable<IFormFile>))
                    {
                        schema.Properties[prop.Name] = new OpenApiSchema
                        {
                            Type = "array",
                            Items = new OpenApiSchema
                            {
                                Type = "string",
                                Format = "binary"
                            },
                            Description = GetPropertyDescription(prop) ?? $"Multiple files: {prop.Name}",
                            Nullable = IsPropertyNullable(prop)
                        };
                    }
                    // ========== Handle Regular Properties ==========
                    else
                    {
                        var propSchema = new OpenApiSchema
                        {
                            Type = GetSwaggerType(prop.PropertyType),
                            Format = GetSwaggerFormat(prop.PropertyType),
                            Description = GetPropertyDescription(prop),
                            Nullable = IsPropertyNullable(prop)
                        };

                        // Handle enum types - add enum values to schema
                        if (prop.PropertyType.IsEnum ||
                            (Nullable.GetUnderlyingType(prop.PropertyType)?.IsEnum == true))
                        {
                            var enumType = Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType;
                            var enumNames = Enum.GetNames(enumType);
                            var enumValues = Enum.GetValues(enumType);

                            propSchema.Enum = enumValues.Cast<object>()
                                .Select(e => new OpenApiString(e.ToString()))
                                .ToList<IOpenApiAny>();

                            propSchema.Description = $"{GetPropertyDescription(prop) ?? prop.Name} (enum: {string.Join(", ", enumNames)})";
                        }

                        schema.Properties[prop.Name] = propSchema;
                    }

                    // ========== Determine if Property is Required ==========

                    // Check for [Required] attribute
                    var isRequired = prop.GetCustomAttribute<RequiredAttribute>() != null;

                    // Or check for non-nullable value types (C# 8+ nullable reference types)
                    if (!isRequired &&
                        prop.PropertyType.IsValueType &&
                        Nullable.GetUnderlyingType(prop.PropertyType) == null)
                    {
                        isRequired = true;
                    }

                    if (isRequired)
                    {
                        schema.Required.Add(prop.Name);
                    }
                }

                // Set the request body with the dynamically generated schema
                operation.RequestBody = new OpenApiRequestBody
                {
                    Content = new Dictionary<string, OpenApiMediaType>
                    {
                        ["multipart/form-data"] = new OpenApiMediaType
                        {
                            Schema = schema
                        }
                    },
                    Required = true,
                    Description = "Form data request body with file uploads and fields"
                };
            }
        }

        /// <summary>
        /// Maps C# property types to Swagger/OpenAPI type strings.
        /// </summary>
        /// <param name="type">The C# property type</param>
        /// <returns>OpenAPI type string: "string", "integer", "number", "boolean"</returns>
        private static string GetSwaggerType(Type type)
        {
            // Handle nullable types by getting underlying type
            var underlyingType = Nullable.GetUnderlyingType(type) ?? type;

            if (underlyingType == typeof(string)) return "string";
            if (underlyingType == typeof(int) || underlyingType == typeof(long) ||
                underlyingType == typeof(short) || underlyingType == typeof(byte)) return "integer";
            if (underlyingType == typeof(float) || underlyingType == typeof(double) ||
                underlyingType == typeof(decimal)) return "number";
            if (underlyingType == typeof(bool)) return "boolean";
            if (underlyingType == typeof(DateTime) || underlyingType == typeof(DateTimeOffset)) return "string";
            if (underlyingType == typeof(Guid)) return "string";
            if (underlyingType.IsEnum) return "string";

            // Default fallback for unknown types
            return "string";
        }

        /// <summary>
        /// Maps C# property types to Swagger format strings for better UI representation.
        /// </summary>
        /// <param name="type">The C# property type</param>
        /// <returns>OpenAPI format string or null if not applicable</returns>
        private static string? GetSwaggerFormat(Type type)
        {
            var underlyingType = Nullable.GetUnderlyingType(type) ?? type;

            if (underlyingType == typeof(int)) return "int32";
            if (underlyingType == typeof(long)) return "int64";
            if (underlyingType == typeof(float)) return "float";
            if (underlyingType == typeof(double)) return "double";
            if (underlyingType == typeof(DateTime) || underlyingType == typeof(DateTimeOffset)) return "date-time";
            if (underlyingType == typeof(Guid)) return "uuid";

            return null;
        }

        /// <summary>
        /// Extracts property description from [Description] attribute or XML comments.
        /// Falls back to property name if no description is found.
        /// </summary>
        /// <param name="prop">The property info to extract description from</param>
        /// <returns>Description string or null if not found</returns>
        private static string? GetPropertyDescription(PropertyInfo prop)
        {
            // Try to get [Description] attribute first
            var descriptionAttr = prop.GetCustomAttribute<DescriptionAttribute>();
            if (!string.IsNullOrWhiteSpace(descriptionAttr?.Description))
                return descriptionAttr.Description;

            // Try to get from XML documentation comments (if generated)
            var xmlComments = GetXmlDocumentation(prop);
            if (!string.IsNullOrWhiteSpace(xmlComments))
                return xmlComments;

            return null;
        }

        /// <summary>
        /// Attempts to extract XML documentation for a property.
        /// Note: Requires XML documentation file to be generated in project settings.
        /// </summary>
        private static string? GetXmlDocumentation(PropertyInfo prop)
        {
            // This is a simplified version - full implementation requires 
            // loading the XML comments file from the output directory
            // For now, we rely on [Description] attribute which is more reliable
            return null;
        }

        /// <summary>
        /// Determines if a property should be marked as nullable in Swagger schema.
        /// </summary>
        /// <param name="prop">The property info to check</param>
        /// <returns>True if the property accepts null values</returns>
        private static bool IsPropertyNullable(PropertyInfo prop)
        {
            // Reference types are nullable by default (unless using nullable reference types)
            if (!prop.PropertyType.IsValueType)
                return true;

            // Value types are nullable only if they're Nullable<T>
            return Nullable.GetUnderlyingType(prop.PropertyType) != null;
        }
    }
}