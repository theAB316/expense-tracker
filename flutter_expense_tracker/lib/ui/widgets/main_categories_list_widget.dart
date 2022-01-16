import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/border_box_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/squircle_widget.dart';

class MainCategoriesListWidget extends StatefulWidget {
  const MainCategoriesListWidget({Key? key}) : super(key: key);

  @override
  _MainCategoriesListWidgetState createState() =>
      _MainCategoriesListWidgetState();
}

class _MainCategoriesListWidgetState extends State<MainCategoriesListWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double screenWidth = window.physicalSize.width;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,

      /*
        * The map() does the following:
        * 1. Looping through each entry in CATEGORIES_MAP
        * 2. Passing that category to SquircleWidget (and creating it)
        * 3. Creating a List of these SquircelWidgets
        * 4. Passing this list to children of Column
        *  
        */
      child: Column(
        children: CATEGORIES_MAP.entries
            .map((entry) => Padding(
                  padding: SYMMETRIC_PADDING_ALL,
                  child: Container(
                    width: screenWidth,
                    child: SquircleWidget(
                      child: Row(
                        children: [
                          Container(
                            child: entry.value.icon,
                            height: CIRCLE_LENGTH,
                            width: CIRCLE_LENGTH,
                            decoration: BoxDecoration(
                                color: entry.value.iconCircleColor,
                                shape: BoxShape.circle),
                          ),
                          addHorizontalSpace(PADDING_VALUE),
                          Text(entry.value.name,
                              style: themeData.textTheme.headline5)
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );

    // lol: CATEGORIES_MAP.entries.map((entry) => Padding(
    //           padding: SYMMETRIC_PADDING_ALL,
    //           child: Container(width: screenWidth, child: SquircleWidget(child: Text(category))
  }
}
