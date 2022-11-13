import 'package:business_phone_book/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:business_phone_book/services/call_and_message_service.dart';
import 'package:business_phone_book/widgets/circular_button.dart';

class RowCircularButtons extends StatefulWidget {
  final String number;
  final String email;

  const RowCircularButtons({
    Key? key,
    required this.number,
    required this.email,
  }) : super(key: key);

  @override
  State<RowCircularButtons> createState() => _RowCircularButtonsState();
}

class _RowCircularButtonsState extends State<RowCircularButtons> {
  final CallAndMessageService _service = locator<CallAndMessageService>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircularButton(
            //color: cPurple,
            icon: Icons.call_rounded,
            onPressed: () => _service.launch('tel', '010-5186-9646')),
        CircularButton(
            //color: Colors.lime,
            icon: Icons.message_rounded,
            onPressed: () => _service.launch('sms', widget.number)),
        CircularButton(
            //color: Colors.pink.shade300,
            icon: Icons.email_rounded,
            onPressed: () => _service.launch('mailto', widget.email)),
        CircularButton(
          icon: Icons.edit_rounded,
          onPressed: () {},
        ),
      ],
    );
  }
}
