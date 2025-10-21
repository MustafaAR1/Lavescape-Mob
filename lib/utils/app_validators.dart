class AppValidators {
  static String? validateEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Basic email regex validation
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validateLegalName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Legal Name cannot be empty';
    }
    // Add more specific legal name validation if needed (e.g., no special characters, min/max length)
    return null;
  }
}
