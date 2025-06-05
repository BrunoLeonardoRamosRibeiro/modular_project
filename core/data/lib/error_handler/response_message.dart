import 'package:data/error_handler/app_strings.dart';

class ResponseMessage {
  static const String success = AppStrings.success;
  static const String noContent = AppStrings.noContent;
  static const String badRequest =AppStrings.badRequest;
  static const String forbidden = AppStrings.forbidden;
  static const String unauthorized = AppStrings.unauthorized;
  static const String internalServerError = AppStrings.internalServerError;

  /// LOCAL ERROR FROM APP
  static const String connectTimeout = AppStrings.connectTimeout;
  static const String cancelled = AppStrings.cancelled;
  static const String receiveTimeout = AppStrings.receiveTimeout;
  static const String sendTimeout = AppStrings.sendTimeout;
  static const String cacheError = AppStrings.cacheError;
  static const String noInternetConnection = AppStrings.noInternetConnection;
  static const String defaultError = AppStrings.defaultError;
}