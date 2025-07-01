import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';
import 'package:modular_project/di/injection.dart';
import 'package:presentation/state_renderer/state_renderer.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginUsecase = getIt<LoginUseCase>();
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BlocProvider(
        create: (context) => LoginBloc(loginUsecase),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Stack(
              children: [
                _buildMainScreenContent(context, state),
                _buildStateRenderer(context, state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMainScreenContent(BuildContext context, LoginState state) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            onChanged: (value) {
              context.read<LoginBloc>().add(UsernameChanged(value));
            },
            decoration: InputDecoration(
              labelText: "Username",
              errorText: state is LoginInvalid ? state.usernameError : null,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: passwordController,
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChanged(value));
            },
            decoration: InputDecoration(
              labelText: "Password",
              errorText: state is LoginInvalid ? state.passwordError : null,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(
                LoginButtonPressed(
                  usernameController.text,
                  passwordController.text,
                ),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }

  Widget _buildStateRenderer(BuildContext context, LoginState state) {
    if (state.stateRendererType == StateRendererType.contentState) {
      // display any overlay
      return SizedBox.shrink();
    }

    return StateRenderer(
      stateRendererType: state.stateRendererType,
      message: (state is LoginError) ? state.errorMessage ?? "" : "",
      retryActionFunction: () {
        context.read<LoginBloc>().add(
          LoginButtonPressed(usernameController.text, passwordController.text),
        );
      },
    );
  }
}
