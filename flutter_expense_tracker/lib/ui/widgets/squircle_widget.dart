import 'package:flutter/material.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart'; // For SquircleBorder

class SquircleWidget extends StatelessWidget {
  List<Color> colors;
  EdgeInsets margin;
  double shadowElevation;
  Widget child;
  EdgeInsets childPadding;

  SquircleWidget({
    Key? key,
    this.colors = const [Colors.blue, Colors.purpleAccent, Colors.deepOrangeAccent],
    this.margin = const EdgeInsets.all(10.0),
    this.shadowElevation = 8.0,
    this.child = const SizedBox.shrink(),
    this.childPadding = const EdgeInsets.all(30.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        color: Colors.transparent,
        shape: const SquircleBorder(
          radius: BorderRadius.all(
            Radius.elliptical(40.0, 40.0),
          ),
        ),
        clipBehavior: Clip.antiAlias, // so that gradient is contained to rounded border
        elevation: shadowElevation,
        child: Container(
          padding: childPadding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}