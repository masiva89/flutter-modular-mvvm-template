import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/base/state/base_equatable.dart';

abstract class BaseStateListener {
  void onListen<T extends StateEquatable>(
    BuildContext context,
    T state,
  );
}
