import 'dart:math';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink, Colors.purple],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // เพิ่ม SingleChildScrollView
            child: Card(
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller:_userController ,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller:_passwordController ,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        Text('Remember me'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Log in with social account'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(backgroundColor: Colors.red, radius: 15),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundColor: Colors.blue, radius: 15),
                        SizedBox(width: 10),
                        CircleAvatar(
                            backgroundColor: Colors.orange, radius: 15),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('Log In'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        // Handle login logic here
                      },
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      child: Text('Forgot your password?'),
                      onPressed: () {
                        // Handle forgot password logic here
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
