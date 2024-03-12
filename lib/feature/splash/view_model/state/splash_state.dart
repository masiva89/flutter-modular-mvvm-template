import 'package:equatable/equatable.dart';

/// Represents the state of the splash screen.
class SplashState extends Equatable {
  /// Constructs a [SplashState] with the given [isLoading] value.
  const SplashState({required this.isLoading});

  /// Indicates whether the splash screen is currently loading.
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  /// Creates a new [SplashState] instance with the provided [isLoading] value.
  SplashState copyWith({bool? isLoading}) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
//TODO: Add other splash state props to the [SplashState] class.