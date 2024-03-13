// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:myapp/screen/home.dart';

void main() {
  runApp(const MainApp());
}

// StatelessMyApp คงที่
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

 