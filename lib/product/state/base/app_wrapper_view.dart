import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/state/base/base_view.dart';
import 'package:flutter_modular_mvvm/product/state/index.dart';

class AppWrapperView extends StatelessWidget {
  const AppWrapperView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel, ProductState>(
      vmBuilder: (context) => ProductStateItems.productViewModel,
      builder: (context, viewModel, state) {
        return child;
      },
    );
  }
}
