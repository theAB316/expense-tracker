import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/border_box_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Row(
                children: [
                  BorderBoxWidget(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.menu,
                        color: COLOR_BLACK
                      ),),
                  BorderBoxWidget(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.settings,
                        color: COLOR_BLACK
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
