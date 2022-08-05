class UserValidation {
  static bool validateEmail(String email) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(email) || email.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePasswordLength(String password) {
    if (password.length < 3) {
      return false;
    } else {
      return true;
    }
  }

  static bool emptyFiledValidation(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
