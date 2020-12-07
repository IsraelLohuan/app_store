import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/repositories/person_repository.dart';
import 'package:appstore/app/shared/controllers/loading_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/cupertino.dart';

class UserController extends LoadingController {

  final Person person;

  bool get isEditing => person != null;

  PersonRepository _personRepository = PersonRepository();

  List<TextEditingController> controllersText = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  UserController({this.person}) {
    if(isEditing) {
      controllersText[0].text = person.nome;
      controllersText[1].text = person.documento;
      controllersText[2].text = person.telefone;
      controllersText[3].text = person.email;
      controllersText[4].text = person.senha;
    }
  }

  Future<bool> register() async {

    Person person = Person(
      nome: controllersText[0].text,
      documento: controllersText[1].text,
      telefone: controllersText[2].text,
      email: controllersText[3].text,
      senha: controllersText[4].text,
      fileName: "default.png",
      admin: "0",
      deleted: "0",
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