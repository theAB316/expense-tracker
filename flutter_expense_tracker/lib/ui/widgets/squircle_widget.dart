import 'package:flutter/material.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart'; // For SquircleBorder

class SquircleWidget extends StatelessWidget {
  List<Color> colors;
  EdgeInsets margin;
  double shadowElevation;
  Widget child;
  EdgeInsets childPadding;

  SquircleWidget({
    Key? key,
    this.colors = const [Colors.white],
    this.margin = const EdgeInsets.all(0.0),
    this.shadowElevation = 8.0,
    this.child = const SizedBox.shrink(),
    this.childPadding = const EdgeInsets.all(PADDING_VALUE),
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
        clipBehavior:
            Clip.antiAlias, // so that gradient is contained to rounded border
        elevation: shadowElevation,
        child: Container(
          padding: childPadding,
          color: (colors.length == 1) ? colors[0] : null,
          decoration: (colors.length == 1)
              ? null
              : BoxDecoration(
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
