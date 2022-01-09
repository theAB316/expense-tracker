// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart'; // has built-in widgets based on material theme

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
    // home is the core widget that flutter brings onto the screen.
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(
              "This number will keep getting incremented: " +
                  _placeholderString.toString(),
            ),
            ElevatedButton(
              onPressed: _openDetailsPage,
              child: Text('Entertainment'),
            ),
            ElevatedButton(
              onPressed: _openDetailsPage,
              child: Text('Food'),
            ),
            ElevatedButton(
              onPressed: _openDetailsPage,
              child: Text('Misc.'),
            ),
            ElevatedButton(
              onPressed: _resetState,
              child: Text('Reset'),
            )
          ],
        ),
      ),
    );
  }
}
