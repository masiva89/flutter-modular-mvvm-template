import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget/src/core/bottomsheet_base.dart';
import 'package:widget/src/core/production_action.dart';

class ProductionActionsBottomsheet extends StatelessWidget {
  /// Constructor for bottomsheet
  const ProductionActionsBottomsheet({
    required this.title,
    required this.titleStyle,
    required this.actions,
    required this.bodyStyle,
    super.key,
    this.onCancel,
  });

  /// Title for the bottomsheet
  final String title;

  /// Title style for the bottomsheet
  final TextStyle titleStyle;

  /// Body text style for the bottomsheet
  final TextStyle bodyStyle;

  /// Show the bottomsheet for operation
  final List<ProductionAction> actions;

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
        builder: (context) => ProductionActionsBottomsheet(
          title: title,
          actions: actions,
          onCancel: onCancel,
          titleStyle: titleStyle,
          bodyStyle: bodyStyle,
        ),
      );
    } else {
      await BottomsheetBase.show<bool>(
        context: context,
        builder: (context) => ProductionActionsBottomsheet(
          title: title,
          actions: actions,
          onCancel: onCancel,
          titleStyle: titleStyle,
          bodyStyle: bodyStyle,
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
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: actions.length,
              itemBuilder: (context, index) {
                final action = actions[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    action.onAction?.call();
                  },
                  leading: action.icon,
                  title: Text(action.title, style: bodyStyle),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
