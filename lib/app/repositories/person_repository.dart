import 'dart:convert';
import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:http/http.dart' as http;

class PersonRepository {

  Future<bool> register(Person person) async {

    final response = await http.post(
        getEndpointApi("/person"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(person)
    );

    if(response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }

    throw Exception(response.body);
  }
}