import 'dart:collection';

import 'package:flutter_expense_tracker/data/database.dart';
import 'package:flutter_expense_tracker/data/dummy_data.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/screens/add_screen.dart';
import 'package:flutter_expense_tracker/ui/screens/main_screen.dart';
import 'package:flutter_expense_tracker/ui/screens/more_info_screen.dart';
import 'package:flutter_expense_tracker/ui/screens/search_screen.dart';
import 'package:intl/number_symbols.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

////////////// IMPORTANT CONSTANTS //////////////////////////

// Init the screens
final List<Widget> SCREENS = [
  MainScreen(),
  // MoreInfoScreen(),
  SearchScreen(),
  AddScreen(),
];

// Controller is used to hide/show the bottom navbar, based on scroll direction
ScrollController SCROLL_CONTROLLER = ScrollController();

// For screen change on tap of bottom navbar items
int SELECTED_INDEX = 0;

int MAIN_SCREEN_SELECTED_INDEX = 0;

// 1 => 1Y, 2 => 1M, 3 => 1D. By default messages upto 1D is selected
int DATE_FILTER_RANGE_SELECTED = 3;

/////////////////////////////////////////////////////////////

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
  "Others": Category("Others", Icons.circle, COLOR_GREEN),
  "Blah 2": Category("Blah 2", Icons.circle, COLOR_YELLOW),
});

// Below list of colours creates the gradient for TotalExpenses widget
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

const TextStyle TEXT_MEDIUM_BLACK = TextStyle(
    color: COLOR_BLUE_GREY, fontWeight: FontWeight.w700, fontSize: 16);

const COLOR_BLACK = Color.fromRGBO(48, 47, 48, 1.0);
const COLOR_GREY = Color.fromRGBO(141, 141, 141, 1.0);
final COLOR_LIGHT_BLUE_GREY = Colors.blueGrey.shade50;
const COLOR_BLUE_GREY = Color(0xFF455A54); // Colors.blueGrey.shade700;
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
        color: COLOR_BLUE_GREY, fontWeight: FontWeight.w700, fontSize: 16),
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

// Below widget can be used to add verticle space in Column for example
Widget addVerticleSpace(double height) {
  return SizedBox(
    height: height,
  );
}

// Below widget can be used to add horizontal space in Row for example
Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

String getCurrency() {
  // Hard-coding for Ruppee for the timebeingstore
  var format = NumberFormat.simpleCurrency(locale: "en_IN");

  // var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
  return format.currencySymbol;
}

// Future<List<SmsMessage>> getAllSms() async {
//   SmsQuery query = SmsQuery();
//   var permission = await Permission.sms.request();

//   if (permission.isGranted) {
//     final List<SmsMessage> messages = await query.querySms(
//       kinds: [SmsQueryKind.inbox],
//       count: 20,
//     );
//     debugPrint('Sms inbox messages: ${messages.length}');

//     for (var i = 0; i < messages.length; i++) {
//       HashMap txnDetailsMap = getTransactionDetails(messages[i].body);
//       if (txnDetailsMap["validTransaction"]) {
//         debugPrint(
//             "${txnDetailsMap["amount"]}, ${txnDetailsMap["merchant"]}, ${txnDetailsMap["cardType"]}");
//       }
//     }

//     return messages;
//   } else {
//     debugPrint('Please refresh and provide permissions!');
//     return List.empty();
//   }
// }

void getAllSms() {
  for (var i = 0; i < dummySmsList.length; i++) {
    if (dummySmsList[i] == "") continue;

    HashMap txnDetailsMap = getTransactionDetails(dummySmsList[i]);
    if (txnDetailsMap["validTransaction"]) {
      debugPrint("${txnDetailsMap["amount"]}, ${txnDetailsMap["txnType"]}");

      // add to database
      addTransaction(
          txnDetailsMap["amount"],
          txnDetailsMap["txnType"] == 0, // 0 - debit, 1 - credit
          DateTime.now(),
          "DummyBank",
          "DummyCategory");
    }
  }
}

HashMap getTransactionDetails(String sms) {
  /**
   * amount
   * merchant 
   * txnType - debit/credit
   * validTransaction - valid txn or spam
  */
  HashMap hashMap = HashMap();

  hashMap["amount"] = getAmount(sms);
  //hashMap["merchant"] = getMerchantName(sms);
  hashMap["txnType"] = getTransactionType(sms);

  // if any of the above is not present, it is not a valid txn (might be spam)
  if (hashMap["amount"] == -1 && hashMap["txnType"] == 2) {
    hashMap["validTransaction"] = false;
  } else {
    hashMap["validTransaction"] = true;
  }

  return hashMap;
}

// diff regex for scanning SMS
double getAmount(String sms) {
  RegExp regexExtractAmount = RegExp(
      r'(?:(?:RS|INR|MRP)\.?\s?)(\d+(:?\,\d+)?(\,\d+)?(\.\d{1,2})?)',
      caseSensitive: false);

  final matchedExp = regexExtractAmount.firstMatch(sms);

  if (matchedExp == null || matchedExp.group(1) == null) return -1;

  // Remove any commas in the amount. Use NumberFormat.parse() if international
  final amountStr = (matchedExp.group(1) as String).replaceAll(',', '');

  return double.parse(amountStr);
}

String getMerchantName(String sms) {
  RegExp reg = RegExp(
      r'(?:\sat\s|in\*)([A-Za-z0-9]*\s?-?\s?[A-Za-z0-9]*\s?-?\.?)',
      caseSensitive: false);

  final matchedString = reg.firstMatch(sms)?.group(0);
  return matchedString ?? "";
}

/// Return 0 if debit txn
/// Return 1 if credit txn
/// Return 2 if no txn string was found
int getTransactionType(String sms) {
  sms = sms.toLowerCase();

  // Diff debit txn checks (add more)
  final debitCheckStrings = [
    "spent on",
    "debited for",
    "debited to your",
    "debited from"
  ];

  // Diff credit txns (add more)
  final creditCheckStrings = ["credited to", "credit for"];

  for (int i = 0; i < debitCheckStrings.length; i++) {
    if (sms.contains(debitCheckStrings[i])) return 0;
  }

  for (int i = 0; i < creditCheckStrings.length; i++) {
    if (sms.contains(creditCheckStrings[i])) return 1;
  }

  // unknown txn type or incorrect sms
  return 2;
}
