import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/feature/splash/view_model/state/splash_state.dart';
import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/navigation/app_router.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/state/index.dart';
import 'package:flutter_modular_mvvm/product/widget/dialog/project_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// A mixin that provides common functionality for the SplashViewModel.
/// It is used in conjunction with the BaseCubit<SplashState> class.
mixin SplashViewModelMixin on BaseCubit<SplashState> {
  ProductCache get _productCache => ProductStateItems.productCache;

  /// [userAuthStatus] is a getter for user auth status.
  ///
  /// It returns [UserStatus] enum to use in guards.
  UserStatus get userAuthStatus {
    log('[userAuthStatus]');
    final authCacheModel =
        _productCache.authCacheOperation.get(CachePath.auth.value);
    //log('[userAuthStatus] ${authCacheModel.userStatus}');
    return authCacheModel?.userStatus ?? UserStatus.notLoggedIn;
  }

  /// [navigateToApp] is a method to navigate to app.
  void navigateToApp({
    required BuildContext context,
    required UserStatus userStatus,
  }) {
    log('[navigateToApp]');
    if (userAuthStatus == UserStatus.loggedIn) {
      log('[navigateToApp] userAuthStatus: $userAuthStatus');
      // TODO: Replace with the actual route.
      //context.router.replace(const DashboardRoute());
    } else {
      log('[navigateToApp] userAuthStatus: $userAuthStatus');
      // TODO: Replace with the actual route.
      //context.router.replace(const AuthNavRoute());
    }
  }

  /// Checks if the current version is valid based on the minimum required
  /// version.
  ///
  /// Returns true if the current version is greater than or equal to the
  /// minimum required version, otherwise returns false.
  Future<bool> isValidVersion(String minVersion) async {
    log('[isValidVersion] is running...');
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    log('[isValidVersion] minVersion: $minVersion');
    log('[isValidVersion] currentVersion: $currentVersion');
    final minVersionList = minVersion.split('.');
    final currentVersionList = currentVersion.split('.');
    for (var i = 0; i < minVersionList.length; i++) {
      if (int.parse(minVersionList[i]) > int.parse(currentVersionList[i])) {
        log('[isValidVersion] FALSE');
        return false;
      }
    }
    log('[isValidVersion] TRUE');
    return true;
  }

  Future<void> showUpgradeDialog({
    required BuildContext context,
    required bool isForceUpgrade,
  }) async {
    final title = isForceUpgrade ? 'Güncelleme Gerekli' : 'Yeni Sürüm Mevcut!';
    final message = isForceUpgrade
        ? 'Sizlere daha iyi hizmet verebilmek için uygulamamızı güncelledik.\n\nMovitty deneyimini yaşamaya devam etmek için lütfen uygulamayı güncelleyin.'
        : 'Sizlere daha iyi hizmet verebilmek için uygulamamızı güncelledik.\n\nGüncellemek ister misiniz?';
    final result = await ProjectDialog.showOptionDialog(
      context: context,
      title: title,
      content: message,
      checkButtonText: 'Güncelle',
      closeButtonText: isForceUpgrade ? 'Uygulamadan Çık' : 'Sonra',
    );
    if (result == true) {
      EasyLogger().info('Uygulama güncellenecek. Markete yönlendiriliyor...');
    } else {
      EasyLogger().info('Uygulama güncellenmedi. Uygulamadan çıkılıyor...');
    }
  }

  /// Changes the loading state of the splash screen.
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
