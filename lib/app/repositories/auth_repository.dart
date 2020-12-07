import 'dart:convert';
import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:http/http.dart' as http;

class AuthRepository {

  Future<Person> login(String email, String password) async {

     final response = await http.get(
       getEndpointApi("/auth/${email}/${password}")
     );

     if(response.statusCode == 200) {
       final data = json.decode(response.body);
       return Person.fromJson(data[0]);
     }

     if(response.statusCode == 204) {
       throw Exception("Email ou senha incorreto(s) :(");
     }

     throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
  }
}