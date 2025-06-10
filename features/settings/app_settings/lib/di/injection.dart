import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:app_settings/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureAppSettingsDependencies(GetIt getIt, String? environment) async  =>
    getIt.init(environment: environment);