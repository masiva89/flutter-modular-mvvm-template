import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:flutter_modular_mvvm/product/init/config/app_environment.dart';
import 'package:flutter_modular_mvvm/product/state/container/index.dart';

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    Logger().i('ApplicationInitialize');
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error, stackTrace: stack);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // TODO: Splash
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// Todo: add custom logger
      //Logger().e(details.exceptionAsString());
    };

    _productEnvironmentWithContainer();

    await ProductStateItems.productCache.init();
  }

  /// DO NOT CHANGE THIS METHOD
  void _productEnvironmentWithContainer() {
    AppEnvironment.general();
    Logger().i('Environment: ${AppEnvironment.config.runtimeType}');

    /// It must be call after [AppEnvironment.general()]
    try {
      ProductContainer.setup(AppEnvironment.config);
    } catch (e) {
      CustomLogger.showError<Exception>(e);
      ProductContainer.setup(DevEnv());
    }
  }
}
