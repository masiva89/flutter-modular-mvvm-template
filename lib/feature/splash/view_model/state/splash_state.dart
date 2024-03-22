import 'package:equatable/equatable.dart';
import 'package:flutter_modular_mvvm/product/state/base/base_equatable.dart';

/// Represents the state of the splash screen.
class SplashState extends StateEquatable {
  /// Constructs a [SplashState] with the given [isLoading] value.
  SplashState({required this.isLoading});

  /// Indicates whether the splash screen is currently loading.
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  SplashState.createState({this.isLoading = true})
      : super(isLoading: isLoading, status: StateType.LOADING);

  /// Creates a new [SplashState] instance with the provided [isLoading] value.
  SplashState copyWith({bool? isLoading}) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
//TODO: Add other splash state props to the [SplashState] class.