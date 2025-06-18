import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    //  handle  UsernameChanged
    on<UsernameChanged>((event, emit) {
      // do the logic here
    });

    //  handle  PasswordChanged
    on<PasswordChanged>((event, emit) {
      // do the logic here
    });

    //  handle  LoginButtonPressed
    on<LoginButtonPressed>((event, emit) {
      // do the logic here
    });

  }
}
