class Validators {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty";
    } else if (value.length < 3) {
      return "Username must be at least 3 characters";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, String countryCode) {
    if (value == null || value.isEmpty) {
      return "Phone number cannot be empty";
    } else if (!value.startsWith(countryCode)) {
      return "Phone number must start with $countryCode";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    final passwordRegex =
    RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return "Password must have at least 8 characters, 1 uppercase letter, 1 number, and 1 special character";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm Password cannot be empty";
    } else if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}
