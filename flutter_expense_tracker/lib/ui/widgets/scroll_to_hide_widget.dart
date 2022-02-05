import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScrollToHideWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    SCROLL_CONTROLLER.addListener(listen);
  }

  @override
  void dispose() {
    SCROLL_CONTROLLER.removeListener(listen);

    super.dispose();
  }

  void listen() {
    final direction = SCROLL_CONTROLLER.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      // thumb goes down
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 70 : 0,
      child: Wrap(children: [widget.child]),
    );
  }
}
