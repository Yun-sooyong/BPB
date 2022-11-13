import 'package:business_phone_book/services/google_auth.dart';
import 'package:business_phone_book/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cWhitegrey,
      body: Center(
        child: SizedBox(
          height: size.height * 0.5,
          width: size.width * 0.6,
          child: Container(
            padding: const EdgeInsets.all(10),
            //color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/logo.png',
                ),
                // SizedBox(
                //   height: size.height * 0.15,
                // ),
                ElevatedButton(
                  onPressed: () {
                    GoogleAuth().signInWithGoogle();
                  },
                  child: const Text('Google Login'),
                )
                /*GestureDetector(
                  onTap: () {
                    GoogleAuth().signInWithGoogle();
                  },
                  child: Container(
                    height: size.height * 0.1,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      //border: Border.all(color: Colors.black26),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 8,
                            //offset: Offset(2, 2),
                            color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
