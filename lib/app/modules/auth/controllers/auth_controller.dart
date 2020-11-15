import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/repositories/auth_repository.dart';

class AuthController {

  AuthRepository _authRepository = AuthRepository();

  Person person;

  Future login(String email, String password) async {
    person = await _authRepository.login(email, password);
  }
}