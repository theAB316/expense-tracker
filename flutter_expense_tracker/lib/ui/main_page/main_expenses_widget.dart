// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../common/squircle_widget.dart';

class MainExpensesWidget extends StatefulWidget {
  // const MainExpensesWidget({ Key? key }) : super(key: key);

  @override
  _MainExpensesWidgetState createState() => _MainExpensesWidgetState();
}

class _MainExpensesWidgetState extends State<MainExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    return SquircleWidget(
      colors: [Colors.blue, Colors.purple, Colors.redAccent.shade100],
      child: Text(
        "This number will keep getting incremented: ",
      ),
    );
  }
}
