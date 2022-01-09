// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart'; // For SquircleBorder

class SquircleWidget extends StatelessWidget {
  Color color;
  EdgeInsets margin;
  double shadowElevation;
  Widget child;
  EdgeInsets childPadding;

  SquircleWidget({
    this.color = Colors.white,
    this.margin = const EdgeInsets.all(8.0),
    this.shadowElevation = 8.0,
    this.child = const SizedBox.shrink(),
    this.childPadding = const EdgeInsets.all(30.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      margin: margin,
      child: Material(
        color: color,
        shape: SquircleBorder(
          radius: BorderRadius.all(
            Radius.elliptical(
              40.0,
              40.0,
            ),
          ),
        ),
        elevation: shadowElevation,
        child: Padding(padding: childPadding, child: child),
      ),
    );
  }
}
