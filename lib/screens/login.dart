import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screens/bottombar.dart';
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
  bool rememberme = false;

  void _login() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MultiTabBottomBar()),
    );
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
            MaterialPageRoute(builder: (context) => const BottomAppBar()),
          );
        }
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
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 100,
                    height: 300,
                    child: Column(
                      children: [
                        Image.asset(
                          color: Colors.white,
                          './assets/images/userPhotoroom.png',
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
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
                    return null;
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
                    return null;
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
                    Text('register'),
                    Checkbox(
                      value: rememberme,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberme = value!;
                        });
                      },
                    ),
                    Text('rememberme')
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
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.black.withOpacity(0.7),
                            ),
                          ),
                          onPressed: _login,
                          child: Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(color: Colors.white),
                          ),
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
