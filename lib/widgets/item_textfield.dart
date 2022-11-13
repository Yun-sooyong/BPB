import 'package:business_phone_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  const ItemTextfield({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  State<ItemTextfield> createState() => _ItemTextfieldState();
}

class _ItemTextfieldState extends State<ItemTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.title == '전화번호'
            ? TextInputType.number
            : widget.title == '이메일'
                ? TextInputType.emailAddress
                : TextInputType.text,
        inputFormatters: widget.title == '전화번호'
            ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
            : widget.title == '이메일'
                ? [FilteringTextInputFormatter.allow(RegExp('[a-zA-z0-9@.-_]'))]
                : null,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.grey[300],
          hintText: widget.title,
          hintStyle: const TextStyle(fontSize: 20),
          focusColor: cOrchid,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cViolet),
            borderRadius: BorderRadius.circular(45),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cViolet, width: 3),
            borderRadius: BorderRadius.circular(45),
          ),
        ),
      ),
    );
  }
}
