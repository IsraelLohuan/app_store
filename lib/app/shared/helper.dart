String messageError(Exception messageException) {
  return messageException.toString().replaceAll("Exception:", "");
}