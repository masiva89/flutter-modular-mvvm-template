import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';

/// Product Loading Animation
class ProductLoadingAnimation extends StatefulWidget {
  /// Product Loading Animation Constructor
  const ProductLoadingAnimation({this.enableLabel = true, super.key});

  /// A boolean value that indicates whether the label should be displayed.
  final bool enableLabel;

  @override
  State<ProductLoadingAnimation> createState() =>
      _ProductLoadingAnimationState();
}

class _ProductLoadingAnimationState extends State<ProductLoadingAnimation>
    with TickerProviderStateMixin {
  late bool _enableLabel;

  double _turn = 0;
  final double _maxTurn = 1;

  double _scale = 0.3;
  final double _maxScale = 0.3;
  final double _minScale = 0.2;

  final _loadingWidget = Assets.images.mainLogoSvg.svg(
    package: 'gen',
  );

  @override
  void initState() {
    super.initState();
    _enableLabel = widget.enableLabel;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _scaleOnEnd();
    });
  }

  Future<void> _scaleOnEnd() async {
    if (_scale == _maxScale) {
      log('Animation reversing');
      setState(() {
        _scale = _minScale;
      });
      await Future<void>.delayed(const Duration(milliseconds: 800));
    } else {
      log('Animation ended');
      setState(() {
        _turn += _maxTurn;
      });
      await Future<void>.delayed(const Duration(milliseconds: 1100));
      setState(() {
        _scale = _maxScale;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedScale(
          duration: const Duration(milliseconds: 700),
          scale: _scale,
          curve: Curves.easeInOutBack,
          onEnd: _scaleOnEnd,
          child: AnimatedRotation(
            turns: _turn,
            curve: Curves.elasticInOut,
            duration: const Duration(seconds: 1),
            child: _loadingWidget,
          ),
        ),
        if (_enableLabel) ...{
          Text(
            'Lütfen bekleyin...',
            style: TextStyles.body(context),
          ),
        },
      ],
    );
  }
}
