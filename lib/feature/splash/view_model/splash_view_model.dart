import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/feature/splash/view_model/cubit/splash_cubit.dart';
import 'package:flutter_modular_mvvm/feature/splash/view_model/mixin/splash_view_model_mixin.dart';
import 'package:flutter_modular_mvvm/feature/splash/view_model/state/splash_state.dart';
import 'package:flutter_modular_mvvm/product/service/interface/splash_operation.dart';
import 'package:flutter_modular_mvvm/product/utility/process/parallel_task_processor.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:utility/utility.dart';

/// The view model for the splash screen.
/// Handles the loading state and initialization logic.
class SplashViewModel extends SplashCubit with SplashViewModelMixin {
  /// Constructs a [SplashViewModel] with the required dependencies.
  SplashViewModel({
    required SplashOperation splashOperation,
  })  : _splashOperation = splashOperation,
        super(const SplashState(isLoading: true));

  final SplashOperation _splashOperation;

  /// Initializes the splash screen.
  /// Delays the execution for 2 seconds.
  @override
  void initialEvent({BuildContext? context}) {
    log('[SplashViewModel] ------------------ START');
    log('[SplashViewModel] init');

    checkVersion(context!);

    log('[SplashViewModel] ------------------ END');
  }

  /// Checks the version of the app.
  /// Returns a [Future] that completes with a [bool] value indicating whether
  /// the version is valid or not.
  /// If an exception occurs during the version check, it logs the error and
  /// returns false.
  Future<void> checkVersion(BuildContext context) async {
    final appVersion = await _splashOperation.getVersion();

    final packageInfo = await PackageInfo.fromPlatform();
    final upgradeRequirementType = Upgrader().checkUpgradeRequirement(
      minVersion: appVersion.minVersion ?? '0.0.0',
      maxVersion: appVersion.maxVersion ?? '0.0.0',
      currentVersion: packageInfo.version,
    );

    switch (upgradeRequirementType) {
      case UpgradeRequirementType.none:
        navigateToApp(context: context, userStatus: userAuthStatus);
      case UpgradeRequirementType.canUpgrade:
        await showUpgradeDialog(context: context, isForceUpgrade: false);
      case UpgradeRequirementType.mustUpgrade:
        await showUpgradeDialog(context: context, isForceUpgrade: true);
    }
  }
}
