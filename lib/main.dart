// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:myapp/screen/about.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/login.dart';

void main() {
  runApp(const MainApp());
}

// StatelessMyApp คงที่
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
