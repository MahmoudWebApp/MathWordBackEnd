namespace MathWorldAPI.Services;

/// <summary>
/// Canonical role values. Legacy Admin remains the super administrator.
/// Supervisor has explicit bounded draft permissions and an independent
/// deny-by-default endpoint boundary.
/// </summary>
public static class AccountRolePolicy
{
    public const string LegacyAdmin = "Admin";
    public const string Student = "Student";
    public const string Supervisor = "Supervisor";
    public const int EditDrafts = 1;
    public const int SubmitDrafts = 2;
    public const int ViewStudents = 4;
    public const int ViewStudentActivity = 8;
    public const int ViewReports = 16;
    public const int DefaultSupervisorPermissions = EditDrafts | SubmitDrafts;
    public const int AllSupervisorPermissions = DefaultSupervisorPermissions | ViewStudents | ViewStudentActivity | ViewReports;
    public static bool HasStaffPermission(int permissions,int required) =>
        ValidStaffPermissions(permissions) && required != 0 && (permissions & required) == required;
    public static bool ValidStaffPermissions(int permissions) =>
        permissions >= 0 && (permissions & ~AllSupervisorPermissions) == 0 &&
        ((permissions & SubmitDrafts) == 0 || (permissions & EditDrafts) != 0) &&
        ((permissions & ViewStudentActivity) == 0 || (permissions & ViewStudents) != 0);

    public static bool IsSupportedSessionRole(string? role) =>
        role is LegacyAdmin or Student or Supervisor;

    // Preserve the existing trusted service's role normalization. Public
    // registration must continue to supply Student rather than a client role.
    public static string NormalizeExistingRegistrationRole(string? role) =>
        string.Equals(role, LegacyAdmin, StringComparison.OrdinalIgnoreCase)
            ? LegacyAdmin
            : Student;
}
