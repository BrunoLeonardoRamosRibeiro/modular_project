import 'package:datastore/provider/SessionProvider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SessionProvider, env: [Environment.prod])
class ProdSessionProviderImpl implements SessionProvider {
  @override
  String getAccessToken() {
    return "access token from user session API";
  }

  @override
  String getClientId() {
    return "11111111";
  }

  @override
  String getRefreshToken() {
    return "refresh token from user session API";
  }

  @override
  String getUserId() {
    return "123456789";
  }
}

@Injectable(as: SessionProvider, env: [Environment.dev])
class DevSessionProviderImpl implements SessionProvider {
  @override
  String getAccessToken() {
    return "access token from user session API dev ";
  }

  @override
  String getClientId() {
    return "222222222";
  }

  @override
  String getRefreshToken() {
    return "refresh token from user session API dev";
  }

  @override
  String getUserId() {
    return "123456789";
  }
}
