import 'package:app_settings/provider/AppSettingsProvider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppSettingsProvider, env: [Environment.prod])
class ProdAppSettingsProviderImpl extends AppSettingsProvider {
  @override
  String getAppLanguage() {
    return "English";
  }

  @override
  String getThemeType() {
    return "dark";
  }
}

@Injectable(as: AppSettingsProvider, env: [Environment.dev])
class DevAppSettingsProviderImpl extends AppSettingsProvider {
  @override
  String getAppLanguage() {
    return "Arabic";
  }

  @override
  String getThemeType() {
    return "light";
  }
}