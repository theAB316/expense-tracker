import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/squircle_widget.dart';

class AddScreen extends StatelessWidget {
  // const AddScreen({ Key? key }) : super(key: key);

  final scrollController = ScrollController();

  final EdgeInsets childPadding = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            addVerticleSpace(PADDING_VALUE * 5),
            Padding(
              padding: SYMMETRIC_PADDING_HORIZONTAL,
              child: Text("Add Expense", style: themeData.textTheme.headline5),
            ),
            addVerticleSpace(PADDING_VALUE),
            Padding(
              padding: SYMMETRIC_PADDING_HORIZONTAL,
              child: Column(
                children: [
                  createAmountField(),
                  addVerticleSpace(40),
                  createInputField("Category", Icons.star),
                  addVerticleSpace(15),
                  createInputField("Note", Icons.note),
                  addVerticleSpace(15),
                  createInputField("Date", Icons.date_range),
                  addVerticleSpace(15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createAmountField() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: childPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          style: TextStyle(color: COLOR_BLUE_GREY, fontSize: 32),
          decoration: InputDecoration(
            isDense: true,
            prefix: Text(
              "\$",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            prefixStyle: TextStyle(
              color: COLOR_BLUE_GREY,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget createInputField(String text, IconData iconData) {
    return SquircleWidget(
      shadowElevation: 0.0,
      childPadding: childPadding,
      child: createTextField(text, iconData),
    );
  }

  Widget createTextField(String text, IconData? iconData) {
    return TextField(
      // textAlign: TextAlign.center,
      style: TextStyle(color: COLOR_BLUE_GREY, fontSize: 18),
      decoration: InputDecoration(
        isDense: true,
        hintText: text,
        hintStyle: TextStyle(
          color: COLOR_BLUE_GREY,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        hintTextDirection: TextDirection.ltr,
        icon: Icon(iconData),
        border: InputBorder.none,
      ),
    );
  }
}
