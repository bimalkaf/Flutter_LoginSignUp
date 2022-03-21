class MyFormValidator {
  static String? textValidator(
      {required String? value, required int minLength}) {
    if (value == null || value.isEmpty) {
      return "Full name can't be empty.";
    } else if (value.length < minLength) {
      return "Full name should be at least 3 characters.";
    }
    return null;
  }

  static String? emailValidator({required String? emailId}) {
    if (emailId == null || emailId.isEmpty) {
      return "Email can't be empty.";
    } else {
      bool validEmail =
          RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
              .hasMatch(emailId);
      if (!validEmail) return "Please enter valid email.";
    }
    return null;
  }

  static String? passwordValidator(
      {required String? password, required int minLength}) {
    if (password == null || password.isEmpty) {
      return "Password can't be empty.";
    } else if (password.length < 6) {
      return "Password should be more than 6 characters.";
    }
    return null;
  }

  static String? passwordMatchValidator(
      {required String? password, required matchTo, required int minLength}) {
    if (password == null || password.isEmpty) {
      return "Confirm Password can't be empty.";
    } else if (password.length < minLength) {
      return "Confirm Password should be more than $minLength characters";
    } else if (password != matchTo) {
      return "Password should match.";
    }
    return null;
  }
}
