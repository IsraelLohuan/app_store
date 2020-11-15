
String messageError(Exception messageException) {
  return messageException.toString().replaceAll("Exception:", "");
}

bool isValidEmail(String email) {
  bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  return isValid;
}