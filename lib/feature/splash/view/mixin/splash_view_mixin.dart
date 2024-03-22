import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/feature/splash/view_model/splash_view_model.dart';
import 'package:flutter_modular_mvvm/product/service/features/splash/splash_service.dart';
import 'package:flutter_modular_mvvm/product/service/index.dart';
import 'package:flutter_modular_mvvm/product/state/index.dart';

/// A mixin that provides functionality for the splash view in the Movitty app.
/// This mixin is intended to be used with the `BaseState` class.
mixin SplashViewMixin on StatelessWidget {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final SplashViewModel _splashViewModel;

  /// Gets the instance of the [SplashViewModel] associated with this mixin.
  SplashViewModel get splashViewModel => _splashViewModel;

  SplashViewModel splashViewModelBuilder(BuildContext context) {
    _productNetworkErrorManager = ProductNetworkErrorManager(
      context: context,
      productCache: ProductStateItems.productCache,
    );
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _splashViewModel = SplashViewModel.initial(
      splashOperation: SplashService(
        ProductStateItems.productNetworkManager,
      ),
    );
    return _splashViewModel;
  }

  /* @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(
      context: context,
      productCache: ProductStateItems.productCache,
    );
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _splashViewModel = SplashViewModel(
      splashOperation: SplashService(
        ProductStateItems.productNetworkManager,
      ),
    );
    _splashViewModel.initialEvent(context: context);
  } */
}
