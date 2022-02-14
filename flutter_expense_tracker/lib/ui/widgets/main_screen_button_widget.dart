import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';

class MainScreenButton extends StatefulWidget {
  final String displayText;
  final int whichButton;
  final Function callback;

  const MainScreenButton({
    Key? key,
    required this.displayText,
    required this.whichButton,
    required this.callback,
  }) : super(key: key);

  @override
  State<MainScreenButton> createState() => _MainScreenButtonState();
}

class _MainScreenButtonState extends State<MainScreenButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        MAIN_SCREEN_SELECTED_INDEX = widget.whichButton;
        widget.callback();
      },
      child: Text(
        widget.displayText,
        style: TEXT_MEDIUM_BLACK,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
