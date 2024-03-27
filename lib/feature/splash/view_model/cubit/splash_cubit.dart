import 'package:flutter_modular_mvvm/feature/splash/view_model/state/splash_state.dart';

import '../../../../product/base/index.dart';

/// A cubit that handles the state management for the splash screen.
///
/// This cubit extends the [BaseCubit] class and provides methods to initialize
/// the splash screen.
abstract class SplashCubit extends BaseCubit<SplashState> {
  /// Constructs a [SplashCubit] with the required dependencies.
  ///
  /// The constructor takes a [SplashState] as a parameter and passes it to the
  /// super class.
  SplashCubit(super.initialState);

  /// Initializes the splash screen.
  ///
  /// This method takes a [BuildContext] as a parameter and performs necessary
  /// initialization tasks.
  //Future<void> init(BuildContext context);
}
