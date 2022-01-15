// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart'; // has built-in widgets based on material theme
import 'package:flutter_expense_tracker/ui/screens/main_screen.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// underscore makes the MyAppState class private
class _MyAppState extends State<MyApp> {
  var _placeholderString = 0;

  void _openDetailsPage() {
    // setState updates the Widget by calling its build method.
    setState(() {
      _placeholderString += 1;
    });
    print("_openDetailsPage called");
  }

  void _resetState() {
    setState(() {
      _placeholderString = 0;
    });
    print("_resetState called");
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
        scaffoldBackgroundColor: COLOR_BLUE_GREY,
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL: TEXT_THEME_DEFAULT,
      ),
      home: MainScreen(),
      // home: Scaffold(
      //   body: Center(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         ElevatedButton(
      //           onPressed: null,
      //           child: Text("Empty"),
      //         ),
      //         MainScreen(),
      //         ElevatedButton(
      //           onPressed: _openDetailsPage,
      //           child: Text('Entertainment'),
      //         ),
      //         ElevatedButton(
      //           onPressed: _openDetailsPage,
      //           child: Text('Food'),
      //         ),
      //         ElevatedButton(
      //           onPressed: _openDetailsPage,
      //           child: Text('Misc.'),
      //         ),
      //         ElevatedButton(
      //           onPressed: _resetState,
      //           child: Text('Reset'),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
