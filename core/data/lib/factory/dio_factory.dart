import 'package:data/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final String baseUrl;
  final String accessToken;
  final String language;

  DioFactory({
    required this.baseUrl,
    required this.accessToken,
    required this.language,
  });

  Dio getDio() {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: accessToken, // TODO: get access token here
      defaultLanguage: language, // TODO: get app lang here
      clientId: "app_client", // TODO: get app client  id here
    };

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    );

    // add logger in debug mode only NOT release
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }
}
