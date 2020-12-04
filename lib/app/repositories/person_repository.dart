import 'dart:convert';

import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/shared/others/dio_custom.dart';
import 'package:dio/dio.dart';

class PersonRepository extends DioCustom {

  PersonRepository() : super();

  Future<bool> register(Person person) async {

    Response value = await dio.post("/person", data: json.encode(person));

    if(value.statusCode == 200 || value.statusCode == 201) {
      return true;
    }

    throw Exception(value.data);
  }
}