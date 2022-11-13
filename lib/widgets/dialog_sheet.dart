import 'package:flutter/material.dart';

Future<bool?> dialogSheet(
  BuildContext context,
) async {
  showDialog(
      // 다이얼로그 외 탭 시 반응여부
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('삭제'),
          content: const Text('삭제할까요?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                '확인',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ],
        );
      });
}
