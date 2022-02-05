import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/data/dummy_data.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/squircle_widget.dart';

class MainTransactionsList extends StatefulWidget {
  const MainTransactionsList({Key? key}) : super(key: key);

  @override
  _MainTransactionsListState createState() => _MainTransactionsListState();
}

class _MainTransactionsListState extends State<MainTransactionsList> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double screenWidth = window.physicalSize.width;
    return SingleChildScrollView(
      controller: SCROLL_CONTROLLER,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: dummyAllTransactionsList
            .map((entry) => Padding(
                  padding: SYMMETRIC_PADDING_ALL,
                  child: Container(
                    width: screenWidth,
                    child: SquircleWidget(
                      child: Row(
                        children: [
                          addHorizontalSpace(PADDING_VALUE),
                          Text(entry, style: TEXT_MEDIUM_BLACK)
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
