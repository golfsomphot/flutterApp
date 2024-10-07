import 'package:flutter/material.dart';
import 'package:myapp/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ซ่อนแบนเนอร์ debug
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.red, // สีธีมหลักของแอป
      ),
      home: LoginScreen(), // หน้าจอเริ่มต้น
    );
  }
}
