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

late TextEditingController _companyController;
late TextEditingController _nameController;
late TextEditingController _positionController;
late TextEditingController _phoneController;
late TextEditingController _emailController;

class _AddItemPageState extends State<AddItemPage> {
  @override
  void initState() {
    _companyController = TextEditingController();
    _nameController = TextEditingController();
    _positionController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _companyController.dispose();
    _nameController.dispose();
    _positionController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
                          return 'Enter valid company';
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
                          return 'Enter valid name';
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
                          return 'Enter valid position';
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
                          return 'Enter valid phone';
                        }
                        _inputList[3] = val;
                        return null;
                      },
                    ),
                    CustomFormField(
                      hintText: '이메일',
                      validators: (val) {
                        if (!val!.isValidEmail) {
                          return 'Enter valid email';
                        }
                        _inputList[4] = val;
                        return null;
                      },
                    ),
                    // // 회사
                    // ItemTextfield(
                    //   controller: _companyController,
                    //   title: '회사',
                    // ),
                    // // 이름
                    // ItemTextfield(
                    //   controller: _nameController,
                    //   title: '이름',
                    // ),
                    // // 직급
                    // ItemTextfield(
                    //   controller: _positionController,
                    //   title: '직급',
                    // ),
                    // // 전화번호
                    // ItemTextfield(
                    //   controller: _phoneController,
                    //   title: '전화번호',
                    // ),
                    // // 이메일
                    // ItemTextfield(
                    //   controller: _emailController,
                    //   title: '이메일',
                    // ),
                    // 취소 / 확인
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PushButton(
                            text: '취소',
                            onTap: () {
                              //print('취소');
                              // _companyController.clear();
                              // _nameController.clear();
                              // _positionController.clear();
                              // _phoneController.clear();
                              // _emailController.clear();
                              // Navigator.of(context).pop();
                              _inputList.clear();
                            },
                            color: Colors.grey,
                          ),
                          PushButton(
                            color: cPurple,
                            text: '저장',
                            onTap: () {
                              // TODO firestore 로 입력된 값을 전달
                              // TODO login 함수 추가 글자수 조건을 달아 저장 버튼을 on off 시킴
                              // BookModel bookModel = BookModel(
                              //   _nameController.text,
                              //   _companyController.text,
                              //   _positionController.text,
                              //   _phoneController.text,
                              //   _emailController.text,
                              // );
                              // FirebaseFirestore.instance
                              //     .collection(widget.uid!)
                              //     .add(bookModel.toMap());
                              // Navigator.of(context).pop();
                              if (_formKey.currentState!.validate()) {
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
