import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/base/listener/base_state_listener.dart';
import 'package:flutter_modular_mvvm/product/base/state/base_equatable.dart';

class StateErrorListener extends BaseStateListener {
  StateErrorListener();

  @override
  void onListen<T extends StateEquatable>(BuildContext context, T state) {
    if (state.status == StateType.ERROR) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred'),
        ),
      );
    }
  }
}
