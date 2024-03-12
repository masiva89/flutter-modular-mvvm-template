/* import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ObservedWidget<T extends StateStreamable<R>, R extends Equatable, X>
    extends StatelessWidget {
  const ObservedWidget({super.key, required this.builder});

  final Widget Function(BuildContext context, R state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, R>(
      listener: (context, state) {},
      child: BlocSelector<T, R, X>(
        selector: (state) {
          return state as X;
        },
        builder: builder,
      ),
    );
  }
}
 */