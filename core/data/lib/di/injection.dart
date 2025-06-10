import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:data/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureCoreDataDependencies(
  GetIt getIt,
  String? environment,
) async => getIt.init(environment: environment);
