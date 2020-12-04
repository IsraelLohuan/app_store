import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/repositories/person_repository.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';

class RegisterController {

  PersonRepository _personRepository = PersonRepository();

  Future<bool> register() async {

    Person person = Person(

    );

    return await _personRepository.register(person);
  }

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

    if(value.length < Constants.PHONE_LENGTH) {
      return "Número de caracteres inválidos!";
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