import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/base_equatable.dart';
import '../viewmodel/base_cubit.dart';

class ObservableWidget<T extends BaseCubit<R>, R extends StateEquatable>
    extends StatelessWidget {
  const ObservableWidget({
    super.key,
    required this.vm,
    required this.builder,
    this.onInitialize,
    required this.state,
  });

  final T vm;
  final R state;
  final Widget Function(BuildContext, T, R) builder;
  final Function(BuildContext)? onInitialize;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, R>(
      listener: (context, state) {},
      builder: (context, state) {
        if (onInitialize != null) onInitialize!(context);
        return builder(context, vm, state);
      },
    );
  }
}
