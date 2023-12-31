import 'package:flutter/material.dart';
import 'package:loginpage/pages/login_page.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tugas Mobile",
      theme: ThemeData(fontFamily: "SF-Pro-Text"),
      home: MyLoginPage(),
    );
  }
}
