import 'package:flutter/material.dart';
import 'package:myapp/screen/login.dart';
import 'package:myapp/screen/register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "Login & Register",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.png',
              width: 150,
              height: 150,
            ),
            Center(
              child: SizedBox(
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  label: const Text(
                    'สร้างบัญชี',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Center(
              child: SizedBox(
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.login,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  label: const Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(color: Colors.black),
                  ),
                   onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Login();
                    }));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
