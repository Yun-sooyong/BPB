import 'package:business_phone_book/services/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:business_phone_book/pages/add_item_page.dart';
import 'package:business_phone_book/utils.dart';
import 'package:business_phone_book/widgets/phone_book_tile.dart';

class HomePage extends StatefulWidget {
  final String? uid;

  const HomePage({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('연락처'),
        centerTitle: true,
        backgroundColor: cPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => GoogleAuth().signOut(),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItemPage(
                    uid: widget.uid,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection(widget.uid!).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data?.size != 0) {
              // true
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(),
                    secondaryBackground: Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) => FirebaseFirestore.instance
                        .collection(widget.uid!)
                        .doc(snapshot.data?.docs[index].id)
                        .delete(),
                    confirmDismiss: (direction) {
                      return showDialog(
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
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text(
                                    '취소',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 16),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text(
                                    '확인',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 18, right: 18),
                      child: BookTile(
                        name: snapshot.data?.docs[index]['name'],
                        company: snapshot.data?.docs[index]['company'],
                        phoneNum: snapshot.data?.docs[index]['phoneNum'],
                        email: snapshot.data?.docs[index]['email'],
                        position: snapshot.data?.docs[index]['position'],
                      ),
                    ),
                  );
                },
              );
            } else {
              // error나 firestore docs가 비어있을 경우 표시
              //print(snapshot.data?.docs.length);
              // TODO add empty image
              //<a href="https://www.flaticon.com/free-icons/empty" title="empty icons">Empty icons created by kerismaker - Flaticon</a>
              return Center(
                child: Image.asset(
                  'lib/assets/images/empty.png',
                ),
              );
            }
          }),
    );
  }
}
