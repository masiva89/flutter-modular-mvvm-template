import 'package:flutter/material.dart';

class ProductionActionButton extends StatelessWidget {
  const ProductionActionButton({
    required this.onActionPressed,
    required this.icon,
    required this.label,
    super.key,
  });

  final Function() onActionPressed;
  final AssetImage icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    //TODO: Fix ui.
    return GestureDetector(
      onTap: onActionPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          children: [
            Image(
              image: icon,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
