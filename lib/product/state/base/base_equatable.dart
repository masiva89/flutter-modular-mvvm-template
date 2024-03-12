/* mixin EquatablePropMixin on Equatable {
  bool isLoading = false;
}
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable

/// Represents the base class for states that are equatable.
abstract class StateEquatable extends Equatable {
  /// Creates a new [StateEquatable] instance.
  StateEquatable({this.status = StateType.LOADING, this.isLoading = false});

  /// The status of the state.
  StateType status = StateType.LOADING;

  bool isLoading = false;
}

/// Represents the type of state.
enum StateType { LOADING, SUCCESS, ERROR }

extension StateTypeExtension on StateType {
  StateType get opposite {
    switch (this) {
      case StateType.LOADING:
        return StateType.SUCCESS;
      case StateType.SUCCESS:
        return StateType.LOADING;
      case StateType.ERROR:
        return StateType.LOADING;
    }
  }
}
