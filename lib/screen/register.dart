import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/models/profile.dart';
import 'package:myapp/screen/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Profile profile = Profile(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
                appBar: AppBar(
                  title: Text('Error'),
                ),
                body: Center(
                  child: Text("${snapshot.error}"),
                ));
          }
          if (snapshot.connectionState == ConnectionState.done) {
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
                    child: Card(
                      margin: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'ลงทะเบียน',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
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
                                validator: MultiValidator([
                                  EmailValidator(errorText: 'email ไม่ถูกต้อง'),
                                  RequiredValidator(
                                      errorText: 'กรุณาใส่อีเมล email')
                                ]),
                                onSaved: (mail) => {profile.email = mail!},
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
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
                                validator: RequiredValidator(
                                    errorText: 'ป้อน password'),
                                onSaved: (password) =>
                                    {profile.password = password!},
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.indigo, // ปรับสีพื้นหลัง
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  minimumSize: Size(double.infinity, 50),
                                ),
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    formkey.currentState?.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) => {
                                                formkey.currentState?.reset(),
                                                Fluttertoast.showToast(
                                                    msg: "สร้างบัญชีเรียบร้อย",
                                                    gravity:
                                                        ToastGravity.CENTER),
                                                Navigator.pop(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()),
                                                )
                                              });
                                    } on FirebaseAuthException catch (e) {
                                      String msg = "";
                                      if (e.code == "email-already-in-use") {
                                        msg = "มีอีเมลอยู่ในระบบแล้ว";
                                      } else if (e.code == "weak-password") {
                                        msg = "password ขั้นต่ำ 6 เลข ";
                                      } else {
                                        msg = e.message!;
                                      }

                                      Fluttertoast.showToast(
                                          msg: msg,
                                          gravity: ToastGravity.CENTER);
                                    }
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                child: Text('Already have an account? Log In'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
