import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';
import 'package:modular_project/di/injection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginUsecase = getIt<LoginUseCase>();
  final TextEditingController usernameController = TextEditingController();

  // final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BlocProvider(
        create: (context) => LoginBloc(loginUsecase),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  TextField(
                    controller: usernameController,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(UsernameChanged(value));
                    },
                    decoration: InputDecoration(
                      labelText: "Username",
                      errorText: state is LoginInvalid
                          ? state.usernameError
                          : null,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
