import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screens/chat.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool _isLoading = false;
  bool _Checkbox = false;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        if (_Checkbox) {
          // Register user
          try {
            await _auth.createUserWithEmailAndPassword(
              email: _email.text.trim(),
              password: _passwordController.text.trim(),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Registration successful!')),
            );
            setState(() {
              _Checkbox = false;
              _passwordController.text = '';
              _email.text = '';
            });
          } on FirebaseAuthException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Registration failed: ${e.message}')),
            );
          }
        } else {
          // Login user
          await _auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login successful!')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Chat()),
          );
        }

        // Navigate to another screen or home screen after login/registration
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'An error occurred')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Card(
        borderOnForeground: true,
        margin: EdgeInsets.fromLTRB(50, 25, 50, 100),
        shadowColor: Color.fromRGBO(241, 107, 107, 0.498),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 100,
                    height: 80,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                    //     .hasMatch(value)) {
                    //   return 'Please enter a valid email';
                    // }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // else if (value.length < 6) {
                    //   return 'Password must be at least 6 characters long';
                    // }
                    else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _Checkbox,
                      onChanged: (bool? value) {
                        setState(() {
                          _Checkbox = value!;
                        });
                      },
                    ),
                    Text('register')
                  ],
                ),
                SizedBox(height: 16),
                _Checkbox
                    ? TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          } else {
                            return null;
                          }
                        },
                      )
                    : SizedBox.shrink(),
                SizedBox(height: _Checkbox ? 20 : 0),
                _isLoading
                    ? CircularProgressIndicator(
                        strokeWidth: BorderSide.strokeAlignCenter,
                      )
                    : SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: _login,
                          child: Text('เข้าสู่ระบบ'),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
