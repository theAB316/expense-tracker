import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/border_box_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/main_categories_list_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/main_expenses_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double screenWidth = window.physicalSize.width;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              addVerticleSpace(PADDING_VALUE),
              Padding(
                padding: SYMMETRIC_PADDING_HORIZONTAL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // to move both borderboxes to opposite ends
                  children: [
                    BorderBoxWidget(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.menu, color: COLOR_GREY)),
                    BorderBoxWidget(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.settings, color: COLOR_GREY))
                  ],
                ),
              ),
              addVerticleSpace(PADDING_VALUE),
              Padding(
                  padding: SYMMETRIC_PADDING_HORIZONTAL,
                  child: MainExpensesWidget()),
              addVerticleSpace(PADDING_VALUE + 10),
              Padding(
                padding: SYMMETRIC_PADDING_HORIZONTAL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // to move both borderboxes to opposite ends
                  children: [
                    Text(
                      "Transactions",
                      style: themeData.textTheme.headline5,
                    ),
                    Text(
                      "View All",
                      style: themeData.textTheme.headline5,
                    ),
                  ],
                ),
              ),
              addVerticleSpace(10),
              Expanded(child: MainCategoriesListWidget())
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(child: BottomNavBarWidget()),
      ),
    );
  }
}
