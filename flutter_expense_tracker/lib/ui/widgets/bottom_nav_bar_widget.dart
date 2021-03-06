import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBarWidget extends StatefulWidget {
  final PageController pageController;

  const BottomNavBarWidget({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 60,
            color: Colors.black.withOpacity(.4),
            offset: Offset(0, 25),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
        child: GNav(
          selectedIndex: SELECTED_INDEX,
          onTabChange: (index) {
            SELECTED_INDEX = index;
            widget.pageController.jumpToPage(index);
          },
          tabs: [
            createGButtonWithGradient(LineIcons.home, "Home"),
            // createGButtonWithGradient(LineIcons.infoCircle, "Info"),
            createGButtonWithGradient(LineIcons.search, "Search"),
            createGButtonWithGradient(LineIcons.plus, "Add")
          ],
        ),
      ),
    );
  }
}

GButton createGButtonWithGradient(IconData icon, String text) {
  TextStyle headline4 = TextStyle(
    color: COLOR_WHITE,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  return GButton(
    gap: 10,
    iconActiveColor: COLOR_WHITE,
    iconColor: Colors.black,
    textColor: COLOR_WHITE,
    textStyle: headline4,
    backgroundGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: MAIN_EXPENSES_WIDGET_COLOURS.reversed
            .toList()
            .map((entry) => entry.withOpacity(0.8))
            .toList()),
    iconSize: 24,
    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
    icon: icon,
    text: text,
  );
}
