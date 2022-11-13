import 'package:business_phone_book/utils.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  //final Color color;
  final IconData? icon;
  final Function() onPressed;

  const CircularButton(
      {super.key,
      //required this.color,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cPurple,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
