import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/di/injection.config.dart';

@InjectableInit()
Future<void> configureMoviesFeatureDependencies(
    GetIt getIt,
    String? environment,
    ) async => getIt.init(environment: environment);
