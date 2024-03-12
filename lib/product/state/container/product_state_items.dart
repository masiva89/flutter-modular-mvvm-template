import 'package:flutter_modular_mvvm/product/cache/index.dart';
import 'package:flutter_modular_mvvm/product/service/manager/index.dart';
import 'package:flutter_modular_mvvm/product/state/container/product_state_container.dart';
import 'package:flutter_modular_mvvm/product/state/view_model/product_view_model.dart';

/// [ProductStateItems] is a container for state items.
final class ProductStateItems {
  const ProductStateItems._();

  /// [productNetworkManager] is a network manager for the product module.
  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  /// [productViewModel] is a view model for the product module.
  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  /// [productCache] is a cache manager for the product module.
  static ProductCache get productCache => ProductContainer.read<ProductCache>();
}
