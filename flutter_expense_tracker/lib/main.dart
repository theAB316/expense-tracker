// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart'; // has built-in widgets based on material theme
import 'package:flutter_expense_tracker/data/database.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/scroll_to_hide_widget.dart';

void main() {
  // We need to create/open a Hive box (aka database) before launching the app
  initiateHiveDatabase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

// underscore makes the MyAppState class private
class _MyAppState extends State<MyApp> {
  // Used in navigation of PageView, detects swipes
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SCROLL_CONTROLLER.dispose();

    // We should close the Hive box when app is closed
    closeHiveDatabase();

    super.dispose();
  }

  // Special method required to be implemented (Flutter calls this method)
  // context: holds some info about our app
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    // home is the core widget that flutter brings onto the screen.
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: COLOR_WHITE,
          scaffoldBackgroundColor: COLOR_LIGHT_BLUE_GREY,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
        ),
        home: SafeArea(
          child: Scaffold(
            body: PageView(
              controller: pageController,
              children: SCREENS,
              onPageChanged: (page) {
                setState(() {
                  SELECTED_INDEX = page;
                });
              },
              // physics: NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar: ScrollToHideWidget(
              child: BottomNavBarWidget(
                pageController: pageController,
              ),
            ),
            extendBody: true,
          ),
        ));
  }
}
