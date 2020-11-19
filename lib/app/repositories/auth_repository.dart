import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/shared/others/dio_custom.dart';
import 'package:dio/dio.dart';

class AuthRepository extends DioCustom {

  AuthRepository() : super();

  Future<Person> login(String email, String password) async {

     Response value = await dio.get("/auth/${email}/${password}");

     if(value.statusCode == 200) {
       return Person.fromJson(value.data.first);
     }

     if(value.statusCode == 204) {
       throw Exception("Email ou senha incorreto(s) :(");
     }

     throw Exception("OPA! Algo de inesperado ocorreu! Code: ${value.statusCode}");
  }
}