import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:login/presentation/login_screen.dart';
import 'package:main/main_bloc.dart';
import 'package:main/main_screen.dart';
import 'package:modular_project/di/injection.dart';
import 'package:movies/domain/usecase/movies_usecase.dart';
import 'package:movies/presentation/bloc/movies_bloc.dart';
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
        BlocProvider(create: (_) => MainScreenBloc()),
        BlocProvider(create: (_) => MoviesBloc(getIt<MoviesUseCase>())),
      ],
      child: MaterialApp(
        routes: {
          NavigationRoutes.main: (context) => MainScreen(),
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
