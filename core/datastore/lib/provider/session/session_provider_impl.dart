import 'package:datastore/provider/session/session_provider.dart';
import 'package:datastore/provider/session/session_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: SessionProvider, env: [Environment.prod])
class ProdSessionProviderImpl implements SessionProvider {
  final SharedPreferences _sharedPreferences;

  ProdSessionProviderImpl(this._sharedPreferences);

  @override
  String getAccessToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey) ?? "";
  }

  @override
  String getClientId() {
    return Uuid().v4();
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(SessionStrings.refreshTokenKey) ?? "";
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(SessionStrings.userIdKey) ?? "";
  }

  @override
  void setAccessToken(String accessToken) {
    _sharedPreferences.setString(SessionStrings.accessTokenKey, accessToken);
  }

  @override
  void setRefreshToken(String refreshToken) {
    _sharedPreferences.setString(SessionStrings.refreshTokenKey, refreshToken);
  }

  @override
  void setUserId(String userId) {
    _sharedPreferences.setString(SessionStrings.userIdKey, userId);
  }
}

@Injectable(as: SessionProvider, env: [Environment.dev])
class DevSessionProviderImpl implements SessionProvider {
  final SharedPreferences _sharedPreferences;

  DevSessionProviderImpl(this._sharedPreferences);

  @override
  String getAccessToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey) ?? "";
  }

  @override
  String getClientId() {
    return Uuid().v4();
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(SessionStrings.refreshTokenKey) ?? "";
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(SessionStrings.userIdKey) ?? "";
  }

  @override
  void setAccessToken(String accessToken) {
    _sharedPreferences.setString(SessionStrings.accessTokenKey, accessToken);
  }

  @override
  void setRefreshToken(String refreshToken) {
    _sharedPreferences.setString(SessionStrings.refreshTokenKey, refreshToken);
  }

  @override
  void setUserId(String userId) {
    _sharedPreferences.setString(SessionStrings.userIdKey, userId);
  }
}
