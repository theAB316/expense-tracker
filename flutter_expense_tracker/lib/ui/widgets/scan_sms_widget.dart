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
    return ElevatedButton(
      onPressed: () async {
        var permission = await Permission.sms.status;
        if (permission.isGranted) {
          final messages = await _query.querySms(
            kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
            // address: '+254712345789',
            count: 10,
          );
          debugPrint('sms inbox messages: ${messages.length}');

          setState(() => _messages = messages);
        } else {
          debugPrint('no permission yet');
          await Permission.sms.request();
        }
      },
      child: const Icon(Icons.refresh),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
