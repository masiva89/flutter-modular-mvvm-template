/* import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/feature/auth/auth/view/auth_nav_view.dart';
import 'package:flutter_modular_mvvm/feature/auth/login/view/login_view.dart';
import 'package:flutter_modular_mvvm/feature/auth/signup/view/signup_view.dart';
import 'package:flutter_modular_mvvm/feature/dashboard/view/dashboard_view.dart';
import 'package:flutter_modular_mvvm/feature/discover/view/discover_view.dart';
import 'package:flutter_modular_mvvm/feature/home/view/home_detail_view.dart';
import 'package:flutter_modular_mvvm/feature/home/view/home_nav_view.dart';
import 'package:flutter_modular_mvvm/feature/home/view/home_second_view.dart';
import 'package:flutter_modular_mvvm/feature/home/view/home_view.dart';
import 'package:flutter_modular_mvvm/feature/splash/view/splash_view.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/already_on_page_guard.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/auth_guard.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/auth_restricted_page_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// Project router information class
final class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
        ),
        AdaptiveRoute(
          page: AuthNavRoute.page,
          path: '/auth_navigation',
          children: [
            AutoRoute(
              page: LoginRoute.page,
              initial: true,
              path: 'login',
            ),
            AutoRoute(
              page: SignupRoute.page,
              path: 'signup',
            ),
          ],
        ),
        AdaptiveRoute(
          page: DashboardRoute.page,
          path: '/dashboard',
          children: [
            AdaptiveRoute(
              page: HomeNavigationRoute.page,
              path: 'home_navigation',
              guards: [
                AuthGuard(),
              ],
              children: [
                AdaptiveRoute(
                  page: HomeRoute.page,
                  path: '',
                  initial: true,
                ),
                AdaptiveRoute(
                  page: HomeSecondRoute.page,
                  path: 'second',
                  guards: [
                    //AuthGuard(),
                    AuthRestrictedPageGuard(),
                    AlreadyOnPageGuard(),
                  ],
                ),
              ],
            ),
            AdaptiveRoute(
              page: DiscoverRoute.page,
              path: 'discover',
              guards: [
                AuthRestrictedPageGuard(),
              ],
            ),
            AdaptiveRoute(
              page: HomeDetailRoute.page,
              path: 'detail',
              guards: [
                AuthRestrictedPageGuard(),
              ],
            ),
          ],
        ),
      ];
}
 */