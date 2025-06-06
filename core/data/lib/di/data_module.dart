import 'package:data/factory/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  /// Provide base url
  @Named("BaseUrl") // a tag for this string
  String get baseUrl => "base_url";

  @Named("AccessToken")
  Future<String> get accessToken async {}

  @Named("Language")
  Future<String> get language async {}

  @lazySingleton
  Future<Dio> dio(
    @Named("BaseUrl") String baseurl,
    @Named("AccessToken") Future<String> accessToken,
    @Named("Language") Future<String> language,
  ) async {
    final dioFactory = DioFactory(
      baseUrl: baseUrl,
      accessToken: await accessToken,
      language: await language,
    );

    return dioFactory.getDio();
  }
}
