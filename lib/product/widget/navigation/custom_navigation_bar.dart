import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/text_styles.dart';

/// Custom navigation bar widget for the Movitty app.
///
/// This widget is responsible for displaying a custom navigation bar
/// based on the provided [TabsRouter]. It allows the user to navigate
/// between different tabs in the app.
///
/// Example usage:
/// ```dart
/// final tabsRouter = TabsRouter();
/// final customNavigationBar = CustomNavigationBar(tabsRouter: tabsRouter);
/// ```
///
/// See also:
/// - [TabsRouter], the router used to manage the app's tabs.
class CustomNavigationBar extends StatefulWidget {
  /// This widget represents a custom navigation bar that is used for navigating
  /// between different tabs.
  /// It takes a [tabsRouter] parameter which is responsible for
  /// managing the routing between tabs.
  /// The [tabsRouter] parameter is required.
  const CustomNavigationBar({required this.tabsRouter, super.key});

  /// The router used to manage the app's tabs.
  final TabsRouter tabsRouter;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late TabsRouter tabsRouter;

  @override
  void initState() {
    super.initState();
    tabsRouter = widget.tabsRouter;
  }

  @override
  void didUpdateWidget(covariant CustomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    tabsRouter = widget.tabsRouter;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyles.body(context),
      unselectedLabelStyle: TextStyles.body(context),
      selectedItemColor: ColorName.primary,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      enableFeedback: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Ana Sayfa',
          tooltip: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_rounded),
          label: 'Keşfet',
          tooltip: 'Keşfet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted_rounded),
          label: 'Listelerim',
          tooltip: 'Listelerim',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: 'Profil',
          tooltip: 'Profil',
        ),
      ],
    );
  }
}
