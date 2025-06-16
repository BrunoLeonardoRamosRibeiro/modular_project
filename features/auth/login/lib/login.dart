import 'package:login/data/request/login_request.dart';
import 'package:modular_project/di/injection.dart';
import 'package:datastore/provider/session/session_provider_impl.dart';
import 'package:dio/dio.dart';
import 'package:login/domain/usecase/login_usecase.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  Dio dio = Dio();
}

void doLogin() async {
  final loginUsecase = getIt<LoginUseCase>();
  final loginRequest = LoginRequest("mina@gmail.com", "123456");
}
