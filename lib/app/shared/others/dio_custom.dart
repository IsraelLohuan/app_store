import 'package:dio/dio.dart';

class DioCustom {

  Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2/api-store",
      receiveTimeout: 9000,
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'Accept': "application/json",
      }
    )
  );

  Dio get dio => _dio;
}