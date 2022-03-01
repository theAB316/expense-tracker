import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';

class DateFilter extends StatefulWidget {
  const DateFilter({Key? key}) : super(key: key);

  @override
  _DateFilterState createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        basicButton("1Y", 1),
        addHorizontalSpace(7),
        basicButton("1M", 2),
        addHorizontalSpace(7),
        basicButton("1D", 3),
        addHorizontalSpace(7),
      ],
    );
  }
}

// Widget basicButton(String text, Function callback) {
//   return TextButton(
//     onPressed: () {
//       callback();
//     },
//     child: Text(
//       text,
//       style: TEXT_MEDIUM_BLACK,
//     ),
//     style: TextButton.styleFrom(
//       minimumSize: Size(1, 1),
//       primary: Colors.transparent,
//       elevation: 0,
//     ),
//   );
// }

Widget basicButton(String text, int value) {
  return InkWell(
    onTap: () {
      DATE_FILTER_RANGE_SELECTED = value;
    },
    child: Text(
      text,
      style: TEXT_MEDIUM_BLACK,
    ),
  );
}
