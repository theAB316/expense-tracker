import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_expense_tracker/ui/utils/constants.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class ScanSms extends StatefulWidget {
  const ScanSms({Key? key}) : super(key: key);

  @override
  _ScanSmsState createState() => _ScanSmsState();
}

class _ScanSmsState extends State<ScanSms> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: getAllSms,
      child: Row(
        children: [
          const Icon(
            Icons.refresh,
            color: COLOR_BLUE_GREY,
          ),
          addHorizontalSpace(10),
          Text(
            "Refresh",
            style: TEXT_MEDIUM_BLACK,
          )
        ],
      ),
      style: TextButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
