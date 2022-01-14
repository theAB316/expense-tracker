import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';

class BorderBoxWidget extends StatelessWidget {
  Widget child;
  EdgeInsets padding;
  double width, height;

  BorderBoxWidget({
    Key? key,
    this.padding = const EdgeInsets.all(8.0),
    this.width = 0,
    this.height = 0,
    this.child = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: COLOR_BLACK,
          width: 2,
        ),
      ),
      padding: padding,
      child: Center(
        child: child,
      ),
    );
  }
}
