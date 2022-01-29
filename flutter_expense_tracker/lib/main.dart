// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart'; // has built-in widgets based on material theme
import 'package:flutter_expense_tracker/ui/screens/main_screen.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter_expense_tracker/ui/widgets/scroll_to_hide_widget.dart';

import 'ui/screens/add_screen.dart';
import 'ui/screens/more_info_screen.dart';
import 'ui/screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

// underscore makes the MyAppState class private
class _MyAppState extends State<MyApp> {
  // For screen change on tap of bottom navbar  items
  int selected_index = 0;

  // Will be initialized inside initState()
  late List screens;

  // Controller is used to hide/show the bottom navbar, based on scroll direction
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();

    // Init the screens here (since controller is not accessible outside)
    screens = [
      MainScreen(
        controller: controller,
      ),
      MoreInfoScreen(),
      SearchScreen(),
      AddScreen(),
    ];
  }

  @override
  void dispose() {
    controller.dispose();
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
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return screens[0];
                case '/more-info':
                  return screens[1];
                case '/search':
                  return screens[2];
                case '/add':
                  return screens[3];
                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
            },
          );
        },
        // home: MainScreen(),
        home: SafeArea(
          child: Scaffold(
            bottomNavigationBar: ScrollToHideWidget(
              controller: controller,
              child: BottomNavBarWidget(),
            ),
            extendBody: true,
          ),
        ));
  }
}
