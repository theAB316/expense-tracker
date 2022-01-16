import 'dart:collection';

import 'package:flutter/material.dart';

// To create category list in MainScreen
class Category {
  String name = "";
  Icon icon = Icon(Icons.circle);
  Color iconCircleColor = COLOR_BLACK;

  Category(this.name, IconData iconData, this.iconCircleColor) {
    icon = Icon(
      iconData,
      color: COLOR_WHITE,
    );
  }
}

final LinkedHashMap<String, Category> CATEGORIES_MAP = LinkedHashMap.from({
  "Food": Category("Food & Essentials", Icons.fastfood_sharp, COLOR_YELLOW),
  "Shopping": Category("Shopping", Icons.shopping_cart_sharp, COLOR_PURPLE),
  "Entertainment": Category("Entertainment", Icons.movie_sharp, COLOR_RED),
  "Blah 1": Category("Blah 1", Icons.circle, COLOR_GREEN),
  "Blah 2": Category("Blah 2", Icons.circle, COLOR_YELLOW),
});

final MAIN_EXPENSES_WIDGET_COLOURS = [
  Colors.blue,
  Colors.purpleAccent.shade100,
  Colors.redAccent.shade100
];

// Other
const RUPPEE_SYMBOL = '\u{20B9}';

const double CIRCLE_LENGTH = 50;

const double PADDING_VALUE = 25;
const EdgeInsets SYMMETRIC_PADDING_HORIZONTAL =
    EdgeInsets.symmetric(horizontal: 25);

const EdgeInsets SYMMETRIC_PADDING_ALL =
    EdgeInsets.symmetric(horizontal: 25, vertical: 10);

const COLOR_BLACK = Color.fromRGBO(48, 47, 48, 1.0);
const COLOR_GREY = Color.fromRGBO(141, 141, 141, 1.0);
final COLOR_BLUE_GREY = Colors.blueGrey.shade50;
const COLOR_WHITE = Colors.white;
const COLOR_DARK_BLUE = Color.fromRGBO(20, 25, 45, 1.0);
final COLOR_YELLOW = Colors.yellow.shade700;
final COLOR_PURPLE = Colors.deepPurple.shade600;
final COLOR_RED = Colors.red.shade400;
final COLOR_GREEN = Colors.greenAccent.shade400;

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
    headline1: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 36),
    headline2: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 22),
    headline3: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 20),
    headline4: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 16),
    headline5: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 16),
    headline6: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: COLOR_WHITE,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_WHITE, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme TEXT_THEME_SMALL = TextTheme(
    headline1: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 22),
    headline2: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 20),
    headline3: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 14),
    headline5: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: COLOR_WHITE,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_WHITE, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 10, fontWeight: FontWeight.w400));

Widget addVerticleSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}
