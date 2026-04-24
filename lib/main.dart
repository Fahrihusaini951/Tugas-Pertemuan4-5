import 'package:flutter/material.dart';
import 'page/beranda_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Gabungan',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 40, 122, 205),
        fontFamily: 'Arial',
      ),
      home: BerandaPage(),
    );
  }
}
