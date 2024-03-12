import 'package:flutter/material.dart';

///
final class BottomsheetBase {
  BottomsheetBase._();

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isDismissible = true,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      isDismissible: isDismissible,
      showDragHandle: true,
    );
  }

  static Future<T?> showFixed<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isDismissible = false,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      enableDrag: false,
      isDismissible: isDismissible,
    );
  }
}
