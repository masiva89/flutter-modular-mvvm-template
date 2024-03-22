// ignore_for_file: inference_failure_on_function_return_type, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/state/base/base_equatable.dart';
import 'package:flutter_modular_mvvm/product/state/index.dart';
import 'package:flutter_modular_mvvm/product/widget/loading/custom_loading.dart';
import 'package:flutter_modular_mvvm/product/widget/loading/product_loading_overlay.dart';
import 'package:flutter_modular_mvvm/product/widget/state/project_error_state_view.dart';
import 'package:flutter_modular_mvvm/product/widget/state/unauthorized_state_info_view.dart';

/// Base class for views that are connected to a [BaseCubit] and use
/// [StateEquatable] as the state.
///
///
class BaseView<T extends BaseCubit<R>, R extends StateEquatable>
    extends StatefulWidget {
  /// Creates a new [BaseView] instance.
  ///
  /// The [vmBuilder] and [builder] parameters are required. The [vmBuilder]
  /// parameter is a function that creates an instance of [BaseCubit]. The
  /// [builder] parameter is a function that builds the UI based on the
  /// [BuildContext] and the [BaseCubit] and [StateEquatable] instances.
  ///
  /// The [onInitialize] parameter is optional. If provided, it will be called
  /// when the view before initialized.
  ///
  /// The [useDefaultLoading] parameter is optional. If set to `true`, the
  /// default loading widget will be used.
  const BaseView({
    this.onInitialize,
    this.vmBuilder,
    this.builder,
    this.useDefaultLoading = true,
    this.authGuardEnabled = false,
    super.key,
  }) : assert(
          vmBuilder != null || builder != null,
          'vmBuilder or builder must not be null',
        );

  /// The function that creates an instance of [BaseCubit].
  final T Function(BuildContext context)? vmBuilder;

  /// The function that builds the UI based on the [BuildContext] and the
  final Widget Function(BuildContext, T, R)? builder;

  /// The function that will be called when the view before initialized.
  final Function(BuildContext)? onInitialize;

  /// A boolean value that indicates whether the default loading widget should
  /// be used.
  final bool useDefaultLoading;

  /// A boolean value that indicates whether the auth guard is enabled.
  final bool authGuardEnabled;

  @override
  _BaseViewState createState() => _BaseViewState<T, R>();
}

class _BaseViewState<T extends BaseCubit<R>, R extends StateEquatable>
    extends BaseState<BaseView<T, R>> {
  @override
  void initState() {
    super.initState();
    widget.onInitialize?.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.authGuardEnabled) {
      true => switch (productViewModel.userAuthStatus == UserStatus.loggedIn) {
          false => _unauthorizedInfoView,
          true => _defaultView,
        },
      false => _defaultView,
    };
  }

  Widget get _defaultView {
    return BlocProvider<T>(
      create: (context) => widget.vmBuilder!(context),
      child: BlocBuilder<T, R>(
        builder: _buildAuthenticatedContent,
      ),
    );
  }

  Widget get _unauthorizedInfoView => const UnauthorizedInfoView();

  Widget get _buildFadeLoading => const ProductLoadingOverlay();

  Widget _buildAuthenticatedContent(BuildContext context, R state) {
    if (state.status == StateType.LOADING && widget.useDefaultLoading) {
      return const CustomLoading();
    }
    if (state.status == StateType.ERROR) {
      return ProjectErrorStateView(onRetry: context.read<T>().initialEvent);
    }
    return IgnorePointer(
      ignoring: state.isLoading,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            reverseDuration: const Duration(milliseconds: 300),
            child:
                state.isLoading ? _buildFadeLoading : const SizedBox.shrink(),
          ),
          widget.builder!(context, context.watch<T>(), state),
        ],
      ),
    );
  }
}