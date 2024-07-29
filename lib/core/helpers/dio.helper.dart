import 'package:dio/dio.dart';

final _options = BaseOptions(
  baseUrl: 'http://10.0.2.2:3000',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
);

class DioHelper {
  Dio dio() {
    return Dio(_options);
  }
}