import 'package:business_phone_book/model/book_model.dart';
import 'package:business_phone_book/utils.dart';
import 'package:business_phone_book/widgets/push_button.dart';
import 'package:business_phone_book/widgets/text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddItemPage extends StatefulWidget {
  final String? uid;
  const AddItemPage({super.key, this.uid});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _inputList = List.filled(5, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('연락처 추가'),
        backgroundColor: cPurple,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFormField(
                      hintText: '회사',
                      inputFormatter: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Zㄱ-ㅎ가-힣]+|\s")),
                      ],
                      validators: (val) {
                        if (!val!.isValidName) {
                          return '올바른 내용을 입력해 주세요.';
                        }
                        _inputList[0] = val;
                        return null;
                      },
                    ),
                    CustomFormField(
                      hintText: '이름',
                      inputFormatter: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Zㄱ-ㅎ가-힣]+|\s")),
                      ],
                      validators: (val) {
                        if (!val!.isValidName) {
                          return '올바른 내용을 입력해 주세요.';
                        }
                        _inputList[1] = val;
                        return null;
                      },
                    ),
                    CustomFormField(
                      hintText: '직급',
                      inputFormatter: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Zㄱ-ㅎ가-힣]+|\s")),
                      ],
                      validators: (val) {
                        if (!val!.isValidName) {
                          return '올바른 내용을 입력해 주세요.';
                        }
                        _inputList[2] = val;
                        return null;
                      },
                    ),
                    CustomFormField(
                      hintText: '전화번호',
                      inputFormatter: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[0-9]"),
                        )
                      ],
                      validators: (val) {
                        if (!val!.isValidPhone) {
                          return '올바른 내용을 입력해 주세요.';
                        }
                        _inputList[3] = val;
                        return null;
                      },
                    ),
                    CustomFormField(
                      hintText: '이메일',
                      validators: (val) {
                        if (!val!.isValidEmail) {
                          return '올바른 내용을 입력해 주세요.';
                        }
                        _inputList[4] = val;
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PushButton(
                            text: '취소',
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.grey,
                          ),
                          PushButton(
                            color: cPurple,
                            text: '저장',
                            onTap: () {
                              if (!_formKey.currentState!.validate()) {
                                null;
                              } else {
                                BookModel bookModel = BookModel(
                                  _inputList[0],
                                  _inputList[1],
                                  _inputList[2],
                                  _inputList[3],
                                  _inputList[4],
                                );
                                FirebaseFirestore.instance
                                    .collection(widget.uid!)
                                    .add(bookModel.toMap());
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
