/* import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/feature/home/view/home_nav_view.dart';

/// Enum representing the inner navigation paths in the Movitty app.
enum InnerPath {
  /// Home navigation path.
  homeNavigation,

  /// Explore navigation path.
  exploreNavigation,

  /// Lists navigation path.
  listsNavigation,

  /// Profile navigation path.
  profileNavigation,

  /// Unknown navigation path.
  unknown,
}

/// Extension on [InnerPath] enum.
/// Used to get the string value of the enum or to convert a string to the enum.
extension InnerPathExtension on InnerPath {
  /// Returns the string value of the enum.
  String get value {
    switch (this) {
      case InnerPath.homeNavigation:
        return 'home_navigation';
      case InnerPath.exploreNavigation:
        return 'explore_navigation';
      case InnerPath.listsNavigation:
        return 'lists_navigation';
      case InnerPath.profileNavigation:
        return 'profile_navigation';
      case InnerPath.unknown:
        return 'unknown';
    }
  }

  /// Returns the global key for the navigator.
  ///
  /// The global key is used to access the navigator state.
  /// It can be used to perform navigation actions such as pushing and popping routes.
  GlobalKey<NavigatorState> get navigatorKey {
    switch (this) {
      case InnerPath.homeNavigation:
        return homeNavigatorKey;
      case InnerPath.unknown:
        return GlobalKey<NavigatorState>();

      //TODO: Add other navigator keys here and remove 'default' case.

      default:
        return GlobalKey<NavigatorState>();
    }
  }
}

/// Extension on [String] class.
/// Used to convert a string to the [InnerPath] enum.
extension StringExtension on String {
  /// Returns the InnerPaths enum value of the string.
  InnerPath get toInnerPath {
    switch (this) {
      case 'home_navigation':
        return InnerPath.homeNavigation;
      case 'explore_navigation':
        return InnerPath.exploreNavigation;
      case 'lists_navigation':
        return InnerPath.listsNavigation;
      case 'profile_navigation':
        return InnerPath.profileNavigation;
      case 'unknown':
        return InnerPath.unknown;
      default:
        return InnerPath.unknown;
    }
  }
}
 */