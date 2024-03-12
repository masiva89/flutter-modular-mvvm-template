import 'dart:developer';

import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'dev_env.g.dart';

@Envied(path: 'assets/env/.dev.env', obfuscate: true)

/// Production environment variables
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  final String _baseUrl = _DevEnv._baseUrl;

  @override
  String get baseUrl => _getBaseUrl();

  String _getBaseUrl() {
    log(' TRYING TO GET BASE URL', name: 'DevEnv._getBaseUrl');
    try {
      return _baseUrl;
    } on Exception catch (e) {
      log('DevEnv._getBaseUrl: $e', name: 'DevEnv._getBaseUrl', error: e);
    } finally {
      return 'deneme';
    }
  }
}
