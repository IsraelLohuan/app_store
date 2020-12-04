import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';

class RegisterController {

  String validatorName(String value) {
    if(value.isEmpty) {
      return "Necessário preencher seu nome!";
    }

    return null;
  }

  String validatorDocument(String value) {
    if(value.length < Constants.CPF_LENGTH && value.length < Constants.CNPJ_LENGTH) {
      return "Necessário informar um CNPJ OU CPF!";
    }

    return null;
  }

  String validatorPhone(String value) {
    if(value.isEmpty) {
      return "Necessário preencher com seu número!";
    }

    return null;
  }

  String validatorEmail(String value) {
    if(value.isEmpty) {
      return "Necessário preencher com seu e-mail!";
    }

    if(!isValidEmail(value)) {
      return "Formato de e-mail inválido!";
    }

    return null;
  }

  String validatorPassword(String value) {
    if(value.isEmpty) {
      return "Insira uma senha!";
    }

    if(value.length < Constants.MIN_PASSWORD_LENGTH) {
      return "Necessário no minímo ${Constants.MIN_PASSWORD_LENGTH} caracteres!";
    }

    return null;
  }
}