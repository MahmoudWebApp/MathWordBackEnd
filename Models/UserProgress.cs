namespace MathWorldAPI.Models
{
    public class UserProgress
    {
        public int Id { get; set; }
        public bool IsSolved { get; set; } = false;
        public bool IsCorrect { get; set; } = false;
        public int SelectedOptionId { get; set; } = 0;
        public bool IsFavorite { get; set; } = false;
        public int Attempts { get; set; } = 0;
        public int TimeSpentSeconds { get; set; } = 0;
        public DateTime? SolvedAt { get; set; }
        public DateTime LastAttemptAt { get; set; } = DateTime.UtcNow;

        /// <summary>
        /// Stores whether the official first attempt was correct.
        /// يخزن ما إذا كانت المحاولة الرسمية الأولى صحيحة.
        /// </summary>
        public bool? FirstAttemptCorrect { get; set; }

        /// <summary>
        /// Stores the option selected in the official first attempt.
        /// يخزن الخيار المحدد في المحاولة الرسمية الأولى.
        /// </summary>
        public int? FirstSelectedOptionId { get; set; }

        /// <summary>
        /// Stores when the official first attempt was submitted.
        /// يخزن وقت إرسال المحاولة الرسمية الأولى.
        /// </summary>
        public DateTime? FirstAttemptAt { get; set; }

        /// <summary>
        /// Stores the student's best correct solving time in seconds.
        /// يخزن أفضل وقت حل صحيح للطالب بالثواني.
        /// </summary>
        public int? BestTimeSeconds { get; set; }

        /// <summary>
        /// Stores the accumulated solving time for all attempts.
        /// يخزن مجموع وقت الحل لجميع المحاولات.
        /// </summary>
        public long TotalTimeSpentSeconds { get; set; }

        /// <summary>
        /// Stores the number of correct answer attempts.
        /// يخزن عدد محاولات الإجابة الصحيحة.
        /// </summary>
        public int CorrectAttempts { get; set; }

        /// <summary>
        /// Stores the number of incorrect answer attempts.
        /// يخزن عدد محاولات الإجابة الخاطئة.
        /// </summary>
        public int IncorrectAttempts { get; set; }

        /// <summary>
        /// Stores the current mastery state for this problem.
        /// يخزن حالة الإتقان الحالية لهذه المسألة.
        /// </summary>
        public string MasteryStatus { get; set; } = MasteryStatuses.New;

        /// <summary>
        /// Stores whether the problem currently appears in the error notebook.
        /// يخزن ما إذا كانت المسألة تظهر حاليًا في دفتر الأخطاء.
        /// </summary>
        public bool IsInErrorNotebook { get; set; }

        /// <summary>
        /// Stores whether the student archived the problem from the error notebook.
        /// يخزن ما إذا قام الطالب بأرشفة المسألة من دفتر الأخطاء.
        /// </summary>
        public bool IsErrorNotebookArchived { get; set; }

        /// <summary>
        /// Stores the next recommended review date.
        /// يخزن تاريخ المراجعة التالية المقترحة.
        /// </summary>
        public DateTime? NextReviewAt { get; set; }

        /// <summary>
        /// Stores consecutive correct spaced-review completions.
        /// يخزن عدد المراجعات المتباعدة الصحيحة المتتالية.
        /// </summary>
        public int ConsecutiveCorrectReviews { get; set; }

        public int UserId { get; set; }
        public int ProblemId { get; set; }

        public AppUser User { get; set; } = null!;
        public MathProblem Problem { get; set; } = null!;
    }
}
