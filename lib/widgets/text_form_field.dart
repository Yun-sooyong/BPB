import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final List<TextInputFormatter>? inputFormatter;
  final String? Function(String?)? validators;

  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatter,
    this.validators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: inputFormatter,
        validator: validators,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        //RegExp(r"^\s*([A-Za-z가-힣]{1,})[ ]?+[A-Za-z가-힣]+\.?\s*$");
        // ignore: valid_regexps
        RegExp(r"^\s*([A-Za-z가-힣])+[A-Za-z가-힣]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^01([016789])([0-9]{8})$");
    return phoneRegExp.hasMatch(this);
  }
}
