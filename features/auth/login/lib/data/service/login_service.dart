import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../response/login_response.dart';

part 'login_service.g.dart';

const String baseUrl = "https://api.mockfly.dev/mocks/6a300495-3739-436b-9331-d4e0e241388e";

@RestApi(baseUrl: baseUrl)
abstract class LoginService {
  factory LoginService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger errorLogger,
  }) = _LoginService;

  @POST("/customers/login")
  Future<HttpResponse<LoginResponse>> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
