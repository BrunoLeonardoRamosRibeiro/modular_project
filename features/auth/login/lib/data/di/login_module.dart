import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/service/login_service.dart';

@module
abstract class LoginModule {

  @lazySingleton
  LoginService provideLoginService(Dio dio) {
    return LoginService(dio);
  }
}
