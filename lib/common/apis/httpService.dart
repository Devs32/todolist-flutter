import 'dart:io';

import 'package:dio/dio.dart';

class HttpService {
  late Dio dio;

  HttpService() {
    String emulatorIp = '10.0.2.2:3000';
    String simulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    dio = Dio(BaseOptions(
      baseUrl: 'http://$ip/',
    ));
  }

  Future<Response> sendRequest(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response;
      switch (method.toLowerCase()) {
        case 'get':
          response = await dio.get(url,
              options: Options(
                headers: headers,
              ));
          break;
        case 'post':
          response = await dio.post(url,
              data: data,
              options: Options(
                headers: headers,
              ));
          break;
        case 'put':
          response = await dio.put(url,
              data: data,
              options: Options(
                headers: headers,
              ));
          break;
        case 'delete':
          response = await dio.delete(url,
              options: Options(
                headers: headers,
              ));
          break;
        default:
          throw Exception('Invalid HTTP method');
      }

      return response;
    } catch (e) {
      throw Exception('Failed to send request');
    }
  }
}
