import 'package:business_phone_book/model/book_model.dart';
import 'package:business_phone_book/utils.dart';
import 'package:business_phone_book/widgets/item_textfield.dart';
import 'package:business_phone_book/widgets/push_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 회사
                  ItemTextfield(
                    controller: _companyController,
                    title: '회사',
                  ),
                  // 이름
                  ItemTextfield(
                    controller: _nameController,
                    title: '이름',
                  ),
                  // 직급
                  ItemTextfield(
                    controller: _positionController,
                    title: '직급',
                  ),
                  // 전화번호
                  ItemTextfield(
                    controller: _phoneController,
                    title: '전화번호',
                  ),
                  // 이메일
                  ItemTextfield(
                    controller: _emailController,
                    title: '이메일',
                  ),
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
                            _companyController.clear();
                            _nameController.clear();
                            _positionController.clear();
                            _phoneController.clear();
                            _emailController.clear();
                            Navigator.of(context).pop();
                          },
                          color: Colors.grey,
                        ),
                        PushButton(
                          text: '저장',
                          onTap: () {
                            print('저장');
                            // TODO firestore 로 입력된 값을 전달
                            // TODO login 함수 추가 글자수 조건을 달아 저장 버튼을 on off 시킴
                            BookModel bookModel = BookModel(
                              _nameController.text,
                              _companyController.text,
                              _positionController.text,
                              _phoneController.text,
                              _emailController.text,
                            );
                            FirebaseFirestore.instance
                                .collection(widget.uid!)
                                .add(bookModel.toMap());
                            Navigator.of(context).pop();
                          },
                          color: cPurple,
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
    );
  }
}
