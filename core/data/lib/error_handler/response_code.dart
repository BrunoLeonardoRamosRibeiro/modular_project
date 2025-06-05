class ResponseCode {
  static int success = 200;
  static int noContent = 204;
  static int badRequest = 400;
  static int unauthorized = 401;
  static int forbidden = 403;
  static int internalServerError = 500;
  static int notFound = 404;

  /// LOCAL STATUS CODE
  static int connectTimeout = -1;
  static int cancelled = -2;
  static int receiveTimeout = -3;
  static int sendTimeout = -4;
  static int cacheError = -5;
  static int noInternetConnection = -6;
  static int defaultError = -7;
}
