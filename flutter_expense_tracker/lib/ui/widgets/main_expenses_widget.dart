import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'squircle_widget.dart';

class MainExpensesWidget extends StatefulWidget {
  // const MainExpensesWidget({ Key? key }) : super(key: key);

  @override
  _MainExpensesWidgetState createState() => _MainExpensesWidgetState();
}

class _MainExpensesWidgetState extends State<MainExpensesWidget> {
// Class variables
  double totalExpenses = 10000.0;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double screenWidth = window.physicalSize.width;

    return Container(
      width: screenWidth,
      child: SquircleWidget(
        colors: MAIN_EXPENSES_WIDGET_COLOURS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Total Expenses",
              style: themeData.textTheme.headline4,
            ),
            addVerticleSpace(PADDING_VALUE),
            Text(
              getCurrency() + " " + totalExpenses.toString(),
              style: themeData.textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
