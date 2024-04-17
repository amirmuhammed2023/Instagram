class AppValidator {
  static String kEmailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String kPasswordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static emailValidator(String email) {
    if (email.isEmpty) {
      return "E-mail is empty";
    } else if (!RegExp(kEmailPattern).hasMatch(email)) {
      return "Enter valid E-mail";
    }
    return null;
  }

  static passwordValidator(String password) {
    if (password.isEmpty) {
      return "Password is empty";
    } else if (!RegExp(kPasswordPattern).hasMatch(password)) {
      return "Enter valid password : [A - a - @ - 1 - 2 - 3 - 4 - 8]";
    }
    return null;
  }

  static usernameValidator(String username) {
    if (username.isEmpty) {
      return "Username is empty";
    }
    return null;
  }

  static fullnameValidator(String fullname) {
    if (fullname.isEmpty) {
      return "fullname is empty";
    }
    return null;
  }
}
