import 'package:flutter/material.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _fromkey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "https://st4.depositphotos.com/20547288/25572/i/450/depositphotos_255724190-stock-photo-abstract-purple-and-blue-background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        Form(
                          key: _fromkey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.login),
                                  hintText: 'What do people call you?',
                                  labelText: 'Name *',
                                ),
                                onSaved: (String? value) {
                                  _username = value!;
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.password),
                                  hintText: 'What do people call you?',
                                  labelText: 'Password *',
                                ),
                                onSaved: (String? value) {
                                  _password = value!;
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _fromkey.currentState?.save();
                                      // print(_username);
                                      // print(_password);
                                      // _fromkey.currentState?.reset();
                                      _btnlogin(context, _username, _password);
                                      _fromkey.currentState?.reset();
                                    },
                                    child: Text('Submit'),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _fromkey.currentState?.save();
                                      // print(_username);
                                      // print(_password);
                                      // _fromkey.currentState?.reset();
                                      _btnRegister(
                                        context,
                                      );
                                      _fromkey.currentState?.reset();
                                    },
                                    child: Text('Register'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _btnlogin(BuildContext context, _username, _password) {
  print(_password);
  if (_username == 'g') {
    if (_password == '1') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      AlertDialog(
        actions: [Text('Password ไม่ถูกต้อง')],
      );
    }
  } else {
    AlertDialog(
      actions: [Text('User ไม่ถูกต้อง')],
    );
  }
}

void _btnRegister(
  BuildContext context,
) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Register()),
  );
}
