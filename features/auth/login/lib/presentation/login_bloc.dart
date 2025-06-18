import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    //  handle  UsernameChanged
    on<UsernameChanged>((event, emit) {
      final usernameError = validateUsername(event.username);
      emit(
        LoginInvalid(
          usernameError: usernameError,
          passwordError: (state is LoginInvalid) ? state.passwordError : null,
        ),
      );
    });

    //  handle  PasswordChanged
    on<PasswordChanged>((event, emit) {
      final passwordError = validatePassword(event.password);
      emit(
        LoginInvalid(
          passwordError: passwordError,
          usernameError: (state is LoginInvalid) ? state.usernameError : null,
        ),
      );
    });

    //  handle  LoginButtonPressed
    on<LoginButtonPressed>((event, emit) async {
      final usernameError = validateUsername(event.username);
      final passwordError = validatePassword(event.password);

      if (usernameError == null && passwordError == null) {
        emit(LoginLoading());

        final loginRequest = LoginRequest("mina@gmail.com", "123456");
        final result = await loginUseCase.execute(loginRequest);

        print('RODANDO O RESULT');
        result.fold(
          (failure) {
            // emit error
            emit(LoginError(errorMessage: failure.message));
          },
          (loginModel) {
            emit(LoginSuccess());
          },
        );
      } else {
        // show invalid state
        emit(
          LoginInvalid(
            passwordError: passwordError,
            usernameError: usernameError,
          ),
        );
      }
    });
  }

  String? validateUsername(String username) {
    if (username.isEmpty) {
      return "Username cannot be empty";
    } else if (username.length < 3) {
      return "Username must be at least 3 chars";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < 6) {
      return "Password must be at least 6 chars";
    }
    return null;
  }
}
