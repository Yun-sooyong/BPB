import 'package:business_phone_book/utils.dart';
import 'package:business_phone_book/widgets/row_circular_buttons.dart';
import 'package:flutter/material.dart';

/// PHONE BOOK LIST TILE
///
/// GESTUREDETECTOR : 탭하면 AnimatedContainer의 사이즈 변경
/// DISMISSBILE : tile swipe 기능 추가 /// 왼쪽으로 스와이프 시 해당 타일의 데이터를 삭제
///

class BookTile extends StatefulWidget {
  final String name;
  final String company;
  final String position;
  final String phoneNum;
  final String email;

  const BookTile({
    super.key,
    required this.name,
    required this.company,
    required this.phoneNum,
    required this.email,
    required this.position,
  });

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          isTap = !isTap;
        });
      },
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: isTap ? size.height * 0.22 : size.height * 0.15,
            decoration: BoxDecoration(
              color: cViolet,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RowCircularButtons(
                  number: widget.phoneNum,
                  email: widget.email,
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.15,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: cWhitegrey,
              border: Border(
                left: BorderSide(color: cViolet, width: 6),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.company,
                  style: const TextStyle(fontSize: 15),
                ),
                Text.rich(
                  TextSpan(
                    text: widget.name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    children: [
                      const TextSpan(text: '  '),
                      TextSpan(
                        text: widget.position,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Text(widget.phoneNum),
                Text(widget.email),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
