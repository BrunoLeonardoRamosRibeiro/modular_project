import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:login/presentation/login_screen.dart';
import 'package:main/home_screen.dart';
import 'package:modular_project/di/injection.dart';
import 'package:navigator/navigation_bloc.dart';
import 'package:navigator/navigation_routes.dart';
import 'package:navigator/navigation_state.dart';
import 'package:navigator/navigation_types.dart';

class NavigationModule extends StatelessWidget {
  const NavigationModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationBloc()),
        BlocProvider(create: (_) => LoginBloc(getIt<LoginUseCase>())),

        // BlocProvider(create: (_) => HomeBloc()),
      ],
      child: MaterialApp(
        routes: {
          NavigationRoutes.home: (context) => HomeScreen(),
          NavigationRoutes.login: (context) => LoginScreen(),
        },
        home: BlocListener<NavigationBloc, NavigationState>(
          child: LoginScreen(),
          listener: (context, state) {
            if (state.route.isNotEmpty) {
              if (state.navigationType == NavigationType.replace) {
                Navigator.of(context).pushReplacementNamed(state.route);
              } else if (state.navigationType == NavigationType.push) {
                Navigator.of(context).pushNamed(state.route);
              } else if (state.navigationType == NavigationType.pop) {
                Navigator.of(context, rootNavigator: true).pop(true);
              }
            }
          },
        ),
      ),
    );
  }
}
