// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/squircle_widget.dart';

class MainExpensesWidget extends StatefulWidget {
  // const MainExpensesWidget({ Key? key }) : super(key: key);

  @override
  _MainExpensesWidgetState createState() => _MainExpensesWidgetState();
}

class _MainExpensesWidgetState extends State<MainExpensesWidget> {
// Class variables
  double totalExpenses = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: SquircleWidget(
        colors: [
          Colors.blue,
          Colors.purpleAccent.shade100,
          Colors.redAccent.shade100
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Total Expenses",
              style: TextStyle(color: Colors.white),
            ),
            // Spacer(flex: 1),
            Text(
              "Rs. " + totalExpenses.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
