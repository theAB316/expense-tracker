import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_expense_tracker/ui/widgets/squircle_widget.dart';

class AddScreen extends StatelessWidget {
  // const AddScreen({ Key? key }) : super(key: key);

  final scrollController = ScrollController();

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
                  createInputField("Category"),
                  addVerticleSpace(PADDING_VALUE),
                  createInputField("Note"),
                  addVerticleSpace(PADDING_VALUE),
                  createInputField("Date"),
                  addVerticleSpace(PADDING_VALUE),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createInputField(String labelText) {
    final topPadding = 10.0;
    final bottomPadding = 25.0;

    return SquircleWidget(
      shadowElevation: 0.0,
      childPadding: EdgeInsets.fromLTRB(
        PADDING_VALUE,
        topPadding,
        PADDING_VALUE,
        bottomPadding,
      ),
      child: TextField(
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}
