//using System.ComponentModel.DataAnnotations;
//using System.Web;

//public class MaxFileSizeAttribute : ValidationAttribute
//{
//    private readonly int _maxFileSize;
//    public MaxFileSizeAttribute(int maxFileSize)
//    {
//        _maxFileSize = maxFileSize;
//    }

//    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
//    {
//        var file = value as HttpPostedFileBase;

//        if (file != null && file.ContentLength > _maxFileSize)
//        {
//            return new ValidationResult($"File size must be less than {_maxFileSize / (1024 * 1024)} MB.");
//        }

//        return ValidationResult.Success;
//    }
//}
using System.ComponentModel.DataAnnotations;
using System.Web;

public class MaxFileSizeAttribute : ValidationAttribute
{
    private readonly int _maxFileSize;

    public MaxFileSizeAttribute(int maxFileSize)
    {
        _maxFileSize = maxFileSize;
    }

    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        var file = value as HttpPostedFileBase;

        if (file != null && file.ContentLength > _maxFileSize)
        {
            var displayName = validationContext.DisplayName;
            var errorMessage = $"size must be less than {_maxFileSize / (1024 * 1024)} MB.";

            var errorData = new ValidationErrorData
            {
                FieldName = validationContext.MemberName,
                DisplayName = displayName,
                ErrorMessage = errorMessage
            };

            // Use the constructor to pass the member names
            return new ValidationResult(errorMessage, new[] { validationContext.MemberName });
        }

        return ValidationResult.Success;
    }

    public class ValidationErrorData
    {
        public string FieldName { get; set; }
        public string DisplayName { get; set; }
        public string ErrorMessage { get; set; }
    }
}
