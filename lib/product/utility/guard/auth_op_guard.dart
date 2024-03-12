import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/navigation/app_router.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/auth_guard.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/utility/guard/i_operation_guard.dart';
import 'package:flutter_modular_mvvm/product/widget/dialog/project_dialog.dart';

/// A guard that ensures the user is authenticated before performing an
/// operation. Extends the [OperationGuard] class.
final class AuthOpGuard extends OperationGuard {
  AuthOpGuard._init();
  static final AuthOpGuard _instance = AuthOpGuard._init();

  /// [AuthGuard] is a getter for [AuthGuard] instance.
  static AuthOpGuard get instance => _instance;

  @override
  Future<void> callGuarded(BuildContext context, AsyncCallback callback) async {
    print('[AuthOpGuard] is running...');
    final authCacheModel = authCacheOps.get(CachePath.auth.value);
    if (authCacheModel?.userStatus != UserStatus.loggedIn) {
      final result = await ProjectDialog.showOptionDialog(
        context: context,
        title: 'Giriş Yap',
        content: 'Bu özellikten faydalanmak için giriş yapmalısınız.',
        checkButtonText: 'Giriş Yap',
      );
      if (result) {
        // TODO: Complete the function.
        //await context.router.replaceAll([const AuthNavRoute()]);
      }
      return;
    }
    return callback();
  }
}
