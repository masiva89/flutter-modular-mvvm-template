// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class CustomSnackbarDecoration extends StatelessWidget {
  const CustomSnackbarDecoration({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.titleTextStyle,
    this.messageTextStyle,
    this.radius,
  });

  final String? title;
  final String? message;
  final Widget? icon;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kRadialReactionRadius),
        ),
        border: Border.all(
          color: primaryColor ?? Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: titleTextStyle ??
                          TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  if (title != null) const SizedBox(height: 4),
                  Text(
                    message!,
                    style: messageTextStyle ??
                        TextStyle(
                          color: secondaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
