import 'package:flutter/material.dart';
import 'package:myapp/screen/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //ประกาศตัวแปลแบบ privad
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernamecontroller.text = '';
    _passwordcontroller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ..._buildtextField(),
                  //ปุ่มฟังชั่น
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //ถอด arry
                      ..._buildbtn(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClicklogin() {
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickreset() {
    _usernamecontroller.text = '';
    _passwordcontroller.text = '';
  }

  _buildbtn() {
    return [
      ElevatedButton(
        onPressed: _handleClicklogin,
        child: Text('login'),
      ),
      SizedBox(
        width: 5,
      ),
      ElevatedButton(
        onPressed: _handleClickreset,
        child: Text('Reset'),
      ),
      SizedBox(
        width: 5,
      ),
      ElevatedButton(
        onPressed: _handleClickregiter,
        child: Text('Register'),
      ),
    ];
  }

  _buildtextField() {
    return [
      Text.rich(
        TextSpan(text: 'Login'),
        style: TextStyle(fontSize: 30),
      ),
      TextField(
        controller: _usernamecontroller,
        decoration: InputDecoration(labelText: 'Username'),
        textAlign: TextAlign.start,
      ),
      TextField(
        controller: _passwordcontroller,
        decoration: InputDecoration(labelText: 'Password'),
        textAlign: TextAlign.start,
      ),
    ];
  }

  void _handleClickregiter() {
    Navigator.pushNamed(context, AppRoute.register);
  }
}
