import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/feature/splash/view/widget/splash_logo.dart';
import 'package:flutter_modular_mvvm/feature/splash/view_model/splash_view_model.dart';
import 'package:flutter_modular_mvvm/feature/splash/view_model/state/splash_state.dart';
import 'package:flutter_modular_mvvm/product/state/base/base_view.dart';
import 'package:flutter_modular_mvvm/product/state/base/observable_widget.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_modular_mvvm/feature/splash/view/mixin/splash_view_mixin.dart';

@RoutePage()
class SplashView extends StatelessWidget with SplashViewMixin {
  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel, SplashState>(
      onInitialize: (ctx) {},
      vmBuilder: splashViewModelBuilder,
      builder: (ctx, vm, state) => Scaffold(
        body: Center(
          child: SplashLogo(
            vm: vm,
            state: state,
            useShimmer: false,
          ),
        ),
      ),
    );
  }
}
/* class SplashView extends StatefulWidget {
  /// Constructs a [SplashView] with the required dependencies.
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashViewModel,
      child: Scaffold(
        body: Center(
          //TODO: The lottie is broken. Fix it later.
          child: Assets.lottie.animSplashLogo.lottie(
            package: 'gen',
            fit: BoxFit.cover,
            repeat: false,
            width: context.general.mediaSize.width,
          ),
        ),
      ),
    );
  }
} */
