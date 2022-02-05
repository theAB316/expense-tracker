import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';

class MainScreenButton extends StatelessWidget {
  String displayText;
  int whichButton;

  MainScreenButton({
    Key? key,
    required this.displayText,
    required this.whichButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState() {
          MAIN_SCREEN_SELECTED_INDEX = whichButton;
        }
      },
      child: Text(
        displayText,
        style: TEXT_MEDIUM_BLACK,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
