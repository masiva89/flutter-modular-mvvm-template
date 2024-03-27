import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/service/manager/index.dart';
import 'package:flutter_modular_mvvm/product/state/container/product_state_items.dart';
import 'package:flutter_modular_mvvm/product/state/view_model/product_view_model.dart';

/// [BaseState] is a base state for the product module.
/// It is used to prevent the state from being emitted after the
/// widget is disposed.
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  /// [productNetworkManager] is a network manager for the product module.
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  /// [productViewModel] is a view model for the product module.
  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}

abstract class BaseStateStateless<T extends StatelessWidget> {
  /// [productNetworkManager] is a network manager for the product module.
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  /// [productViewModel] is a view model for the product module.
  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}
