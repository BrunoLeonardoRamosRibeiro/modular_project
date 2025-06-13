import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureLoginFeatureDependencies(
  GetIt getIt,
  String? environment,
) async => getIt.init(environment: environment);
