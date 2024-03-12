import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_mvvm/product/state/container/index.dart';
import 'package:flutter_modular_mvvm/product/state/view_model/product_view_model.dart';

/// Initializer wrapper widget for the application state.
final class StateInitialize extends StatelessWidget {
  /// Initializer wrapper widget for the application state.
  const StateInitialize({required this.child, super.key});

  /// Wrapped widget.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(
          value: ProductStateItems.productViewModel,
        ),
      ],
      child: child,
    );
  }
}
