import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  bool _isLoading = false;
  bool _Checkbox = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        if (_emailController.text != 'g') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('เมลไม่ถูกต้อง')),
          );
          setState(() {
            _isLoading = false;
          });
          return;
        }

        if (_passwordController.text != 'g') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('พาสไม่ถูกต้อง')),
          );
          setState(() {
            _isLoading = false;
          });
          return;
        }

        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
      });
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
                        keyboardType: TextInputType.phone,
                        controller: _phone,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your numbers';
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
