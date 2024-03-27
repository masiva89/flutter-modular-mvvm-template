import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseCubit] is a base cubit for the project.
/// It is used to prevent the state from being emitted after the widget is disposed.
abstract class BaseCubit<T extends Object> extends Cubit<T> {
  /// [BaseCubit] constructor.
  BaseCubit(super.initialState);

  void initialEvent({BuildContext? context});

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
