class Validation{
  Validation();
  bool isValidEmail(String email){
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    bool emailValid = regExp.hasMatch(email);
    return emailValid;
  }

  bool isValidPassword(String password){
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = RegExp(pattern);
    bool passwordValid = regExp.hasMatch(password);
    return passwordValid;
  }
}