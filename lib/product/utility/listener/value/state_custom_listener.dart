import 'package:flutter/widgets.dart';
import 'package:flutter_modular_mvvm/product/base/listener/base_state_listener.dart';
import 'package:flutter_modular_mvvm/product/base/state/base_equatable.dart';

class StateCustomListener extends BaseStateListener {
  static final StateCustomListener instance = StateCustomListener._internal();

  StateCustomListener._internal();

  @override
  void onListen<R extends StateEquatable>(
    BuildContext context,
    StateEquatable state,
  ) {}
}
