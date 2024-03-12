/* import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/index.dart';
import 'package:widgets/src/core/bottomsheet_base.dart';
import 'package:widgets/src/core/production_action.dart';

class TestProductionActionsBottomsheet extends StatelessWidget {
  /// Constructor for bottomsheet
  const TestProductionActionsBottomsheet({
    required this.title,
    required this.titleStyle,
    required this.actions,
    required this.bodyStyle,
    this.production,
    this.onCancel,
    super.key,
  });

  /// Title for the bottomsheet
  final String title;

  /// Production of the bottomsheet
  final Production? production;

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
        builder: (context) => TestProductionActionsBottomsheet(
          title: title,
          actions: actions,
          onCancel: onCancel,
          titleStyle: titleStyle,
          bodyStyle: bodyStyle,
          production: production,
        ),
      );
    } else {
      await BottomsheetBase.show<bool>(
        context: context,
        builder: (context) => TestProductionActionsBottomsheet(
          title: title,
          actions: actions,
          onCancel: onCancel,
          titleStyle: titleStyle,
          bodyStyle: bodyStyle,
          production: production,
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
            padding: ProjectPadding.horizontalMedium(context),
            child: Row(
              children: [
                Container(
                  width: 60.responsive(context),
                  decoration: BoxDecoration(
                    borderRadius: ProjectRadius.small.radius(context),
                    color: ColorName.backgroundPrimary,
                    boxShadow: [
                      BoxShadow(
                        color: ColorName.primary.withOpacity(0.2),
                        spreadRadius: 6,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: ProjectRadius.small.radius(context),
                    child: CustomNetworkImage(
                      imageUrl: production?.image ?? '',
                      size: Size(
                        60.responsive(context),
                        60.responsive(context) * 1.5,
                      ),
                      memCache: CustomMemCache(
                        height: (100.responsive(context) * 1.5).toInt(),
                        width: 100.responsive(context).toInt(),
                      ),
                    ),
                  ),
                ),
                ProjectSpacer.xLargeWidth(context),
                Flexible(
                  child: Text(
                    production?.title ?? '',
                    style: titleStyle,
                  ),
                ),
              ],
            ),
          ),
          ProjectSpacer.mediumHeight(context),
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
                    action.onAction.call();
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
 */