import 'package:equatable/equatable.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class LoginState extends Equatable {
  final String? usernameError;
  final String? passwordError;
  final String? errorMessage;
  final StateRendererType? stateRendererType;

  const LoginState({
    this.usernameError,
    this.passwordError,
    this.errorMessage,
    this.stateRendererType = StateRendererType.contentState,
  });

  LoginState copyWith({
    String? usernameError,
    String? passwordError,
    String? errorMessage,
    StateRendererType? stateRendererType,
  }) {
    return LoginState(
      usernameError: usernameError,
      passwordError: passwordError,
      errorMessage: errorMessage,
      stateRendererType: stateRendererType,
    );
  }

  @override
  List<Object?> get props => [usernameError, passwordError, errorMessage, stateRendererType];
}

// initial state
class LoginInitial extends LoginState {}

// loading state
class LoginLoading extends LoginState {}

// invalid state
class LoginInvalid extends LoginState {
  final String? usernameError;
  final String? passwordError;

  const LoginInvalid({this.usernameError, this.passwordError})
    : super(usernameError: usernameError, passwordError: passwordError);
}

// success
class LoginSuccess extends LoginState {}

// error
class LoginError extends LoginState {
  final String? errorMessage;

  const LoginError({this.errorMessage}) : super(errorMessage: errorMessage);
}
