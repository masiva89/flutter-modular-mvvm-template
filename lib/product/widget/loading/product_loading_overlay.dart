import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/widget/loading/product_loading_animation.dart';

class ProductLoadingOverlay extends StatelessWidget {
  const ProductLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.1),
          ],
        ),
      ),
      child: const Center(
        child: ProductLoadingAnimation(),
      ),
    );
  }
}
