import 'dart:async';
import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/repositories/auth_repository.dart';
import 'package:appstore/app/shared/controllers/loading_controller.dart';
import 'package:appstore/app/shared/others/helper.dart';

class LoginController extends LoadingController {

  AuthRepository _authRepository = AuthRepository();

  Person person;

  Future login(String email, String password) async {
    validateFields(email, password);
    person = await _authRepository.login(email, password);
  }

  void validateFields(String email, String password) {
    if(email.isEmpty || password.isEmpty) {
      throw Exception("Necessário preencher todos os campos!");
    }

    if(!isValidEmail(email)) {
      throw Exception("E-mail em formato inválido!");
    }
  }
}