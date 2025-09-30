import 'package:flutter/material.dart';
import 'package:jobportal/page/loginpage.dart';
import 'package:jobportal/page/registrationpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Registration()
    );
  }
}


