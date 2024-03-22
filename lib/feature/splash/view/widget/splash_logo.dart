import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/state/base/base_equatable.dart';
import 'package:flutter_modular_mvvm/product/state/base/observable_widget.dart';

import '../../../../product/state/index.dart';

class SplashLogo<T extends BaseCubit<R>, R extends StateEquatable>
    extends StatelessWidget {
  const SplashLogo({
    super.key,
    required this.vm,
    required this.state,
    required this.child,
    required this.useShimmer,
  });

  final T vm;
  final R state;
  final Widget child;
  final bool useShimmer;

  @override
  Widget build(BuildContext context) {
    return ObservableWidget<T, R>(
      vm: vm,
      state: state,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, T vm, R state) {
    return switch (state.status) {
      StateType.ERROR => Center(child: Text('Error')),
      StateType.LOADING => switch (useShimmer) {
          true => Text('Shimmer Loading'),
          false => Text('Loading'),
        },
      StateType.SUCCESS => child,
    };
  }
}
