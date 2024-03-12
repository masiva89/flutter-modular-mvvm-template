import 'package:flutter/material.dart';
import 'package:widget/src/core/bottomsheet_base.dart';

/// Show a bottomsheet for operation
class OperationBottomsheet extends StatelessWidget {
  /// Constructor for bottomsheet
  const OperationBottomsheet({
    required this.title,
    required this.titleStyle,
    required this.body,
    super.key,
    this.onConfirm,
    this.onCancel,
  });

  /// Title for the bottomsheet
  final String title;

  /// Title style for the bottomsheet
  final TextStyle titleStyle;

  /// Show the bottomsheet for operation
  final Widget body;

  /// Show the bottomsheet for operation
  final Function? onConfirm;

  /// Show the bottomsheet for operation
  final Function? onCancel;

  /// Show the bottomsheet for operation
  Future<bool> show({
    required BuildContext context,
    bool isFixed = true,
  }) async {
    if (isFixed) {
      await BottomsheetBase.showFixed<bool>(
        context: context,
        builder: (context) => OperationBottomsheet(
          title: title,
          body: body,
          onConfirm: onConfirm,
          onCancel: onCancel,
          titleStyle: titleStyle,
        ),
      );
    } else {
      await BottomsheetBase.show<bool>(
        context: context,
        builder: (context) => OperationBottomsheet(
          title: title,
          body: body,
          onConfirm: onConfirm,
          onCancel: onCancel,
          titleStyle: titleStyle,
        ),
      );
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: titleStyle.fontSize ?? 0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 10,
                  child: Text(title, style: titleStyle),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onCancel?.call();
                    },
                    icon: Icon(
                      Icons.cancel_rounded,
                      size: titleStyle.fontSize! * 1.5,
                      color: titleStyle.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body,
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: const Text('data'),
          ),
        ],
      ),
    );
  }
}
