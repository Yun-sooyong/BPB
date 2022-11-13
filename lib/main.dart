import 'package:business_phone_book/firebase_options.dart';
import 'package:business_phone_book/services/service_locator.dart';
import 'package:business_phone_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:business_phone_book/services/google_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '임시 타이틀[Business phone book]',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: cWhitegrey,
      ),
      debugShowCheckedModeBanner: false,
      home: GoogleAuth().handleAuthState(),
    );
  }
}
