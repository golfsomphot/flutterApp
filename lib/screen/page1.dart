import 'package:flutter/material.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/login.dart';
import 'package:myapp/screen/routes.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1',
      routes: AppRoute.all,
      home: Login(),
    );
  }
}
