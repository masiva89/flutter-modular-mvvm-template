// ignore_for_file: inference_failure_on_function_return_type, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_mvvm/product/utility/listener/manager/state_listener_manager.dart';
import 'package:flutter_modular_mvvm/product/base/listener/state_error_lsitener.dart';
import 'package:flutter_modular_mvvm/product/navigation/guard/enum/user_status.dart';
import 'package:flutter_modular_mvvm/product/base/state/base_equatable.dart';
import 'package:flutter_modular_mvvm/product/widget/loading/custom_loading.dart';
import 'package:flutter_modular_mvvm/product/widget/loading/product_loading_overlay.dart';
import 'package:flutter_modular_mvvm/product/widget/state/project_error_state_view.dart';
import 'package:flutter_modular_mvvm/product/widget/state/unauthorized_state_info_view.dart';

import '../state/base_state.dart';
import '../viewmodel/base_cubit.dart';

typedef WidgetBuilder<T, R> = Widget Function(BuildContext, T, R);
typedef ViewModelBuilder<T> = T Function(BuildContext);
typedef InitializeCallback = void Function(BuildContext);
typedef DisposeCallback = void Function(BuildContext);
typedef PostFrameCallback = void Function(BuildContext);

/// Base class for views that are connected to a [BaseCubit] and use
/// [StateEquatable] as the state.
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
    this.onDispose,
    this.onPostFrame,
    this.vmBuilder,
    this.builder,
    this.isAppWrapper = false,
    this.useDefaultLoading = true,
    this.authGuardEnabled = false,
    super.key,
  }) : assert(
          vmBuilder != null || builder != null,
          'vmBuilder or builder must not be null',
        );

  /// The function that creates an instance of [BaseCubit].
  final ViewModelBuilder<T>? vmBuilder;

  /// The function that builds the UI based on the [BuildContext] and the
  final WidgetBuilder<T, R>? builder;

  /// The function that will be called when the view before initialized.
  final InitializeCallback? onInitialize;

  /// The function that will be called when the view is disposed.
  final DisposeCallback? onDispose;

  /// The function that will be called after the view is initialized.
  final PostFrameCallback? onPostFrame;

  /// A boolean value that indicates whether the default loading widget should
  /// be used.
  final bool useDefaultLoading;

  /// A boolean value that indicates whether the auth guard is enabled.
  final bool authGuardEnabled;

  /// A boolean value that indicates whether the view is an app wrapper.
  final bool isAppWrapper;

  @override
  _BaseViewState createState() => _BaseViewState<T, R>();
}

class _BaseViewState<T extends BaseCubit<R>, R extends StateEquatable>
    extends BaseState<BaseView<T, R>> {
  @override
  void initState() {
    super.initState();
    widget.onInitialize?.call(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onPostFrame?.call(context);
    });
  }

  @override
  void dispose() {
    widget.onDispose?.call(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.authGuardEnabled) {
      true => switch (productViewModel.userAuthStatus == UserStatus.loggedIn) {
          false => _unauthorizedInfoView,
          true => switch (widget.isAppWrapper) {
              false => _defaultView,
              true => _appWrapperView,
            },
        },
      false => switch (widget.isAppWrapper) {
          false => _defaultView,
          true => _appWrapperView,
        }
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

  Widget get _appWrapperView {
    return BlocConsumer<T, R>(
      listener: BlocListenerManager.getListener<R>(StateErrorListener()),
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              widget.builder!(context, context.watch<T>(), state),
              if (state.isLoading) const ProductLoadingOverlay(),
              if (state.status == StateType.ERROR)
                const ProjectErrorStateView(),
            ],
          ),
        );
      },
    );
  }

  /* Widget get _appWrapperView {
    return BlocBuilder<T, R>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              widget.builder!(context, context.watch<T>(), state),
              if (state.isLoading) const ProductLoadingOverlay(),
              if (state.status == StateType.ERROR)
                const ProjectErrorStateView(),
            ],
          ),
        );
      },
    );
  } */

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
