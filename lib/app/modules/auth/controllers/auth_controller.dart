import 'dart:async';
import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/repositories/auth_repository.dart';
import 'package:appstore/app/shared/helper.dart';

class AuthController {

  StreamController _streamLoading = StreamController<bool>();

  Stream get loading => _streamLoading.stream;

  AuthRepository _authRepository = AuthRepository();

  Person person;

  void setLoading(bool value) {
    _streamLoading.add(value);
  }

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

  void dispose() {
    _streamLoading.close();
  }
}