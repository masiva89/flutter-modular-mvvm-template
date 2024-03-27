import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/base/listener/base_state_listener.dart';
import 'package:flutter_modular_mvvm/product/base/state/base_equatable.dart';

class BlocListenerManager {
  static final BlocListenerManager instance = BlocListenerManager._internal();

  BlocListenerManager._internal();

  /// Get listener function based on the state type.
  ///
  /// [E] is the state type that extends [StateEquatable].
  /// [listener] is the listener that extends [BaseStateListener].
  ///
  /// Return a function that takes [BuildContext] and [E] state.
  ///
  /// Example:
  /// ```dart
  /// return BlocConsumer<T, R>(
  ///   listener: ListenerManager.getListener<R>(StateErrorListener()),
  ///   builder: (context, state) {
  ///     return child;
  ///   },
  /// );
  /// ```
  static Function(
    BuildContext context,
    E state,
  ) getListener<E extends StateEquatable>(
    BaseStateListener listener,
  ) =>
      listener.onListen<E>;
}
