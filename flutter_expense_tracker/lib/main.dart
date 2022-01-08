import 'package:flutter/material.dart'; // has built-in widgets based on material theme

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Special method required to be implemented (Flutter calls this method)
  // context: holds some info about our app
  @override
  Widget build (BuildContext context) {

    // home is the core widget that flutter brings onto the screen.
    return MaterialApp(home: Text('Hello!'),);
  }
}