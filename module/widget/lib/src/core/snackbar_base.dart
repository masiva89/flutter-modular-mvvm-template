import 'package:flutter/material.dart';

mixin SnackbarBase {
  /// Show a general information snackbar with
  Future<void> showSnackbar<T>({
    required ScaffoldMessengerState scaffoldMessengerState,
    required SnackBar snackBar,
    required Duration duration,
  }) async {
    scaffoldMessengerState.showSnackBar(snackBar);
    await Future.delayed(duration);
  }
}
