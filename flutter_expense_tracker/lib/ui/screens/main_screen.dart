import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/border_box_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/main_categories_list_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/main_expenses_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/main_screen_button_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/main_transactions_list_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/scroll_to_hide_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
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
                MainScreenButton(displayText: "Categories", whichButton: 0),
                MainScreenButton(
                    displayText: "All Transactions", whichButton: 1),
              ],
            ),
          ),
          addVerticleSpace(10),
          Expanded(
              child: (MAIN_SCREEN_SELECTED_INDEX == 0)
                  ? MainCategoriesListWidget()
                  : MainTransactionsList())
        ],
      ),
    );
  }
}
