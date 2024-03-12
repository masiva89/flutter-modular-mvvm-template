import 'dart:developer';

import 'package:auto_route/auto_route.dart';

/// A guard that prevents navigation if the user is already on the same page.
class AlreadyOnPageGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final currentPath = router.current.path;
    final currentRouteName = currentPath.split('/').lastOrNull ?? '';
    log('--- AlreadyOnPageGuard ---');
    log('currentRouteName: $currentRouteName');
    final nextRouteName = resolver.route.path.split('/').lastOrNull ?? '';
    log('nextRouteName: $nextRouteName');
    log('--------------------------');
    resolver.next(!(currentRouteName == nextRouteName));
    /* if (currentRouteName == nextRouteName) {
      resolver.next(false);
    } else {
      resolver.next();
    } */
  }
}
