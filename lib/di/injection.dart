import 'package:app_settings/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import './injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(String? environment) {
  getIt.init(environment: environment);
  debugPrint('**** CONFIGURANDO configureAppSettingsDependencies *****');
  configureAppSettingsDependencies(getIt, environment);
}

