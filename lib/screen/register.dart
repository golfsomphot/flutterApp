import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/models/profile.dart';
import 'package:myapp/screen/login.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //  ตัวแปลเช็ค ฟอร์ม
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
                  title: Text('error'),
                ),
                body: Center(
                  child: Text("${snapshot.error}"),
                ));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.pink,
                title: Text(
                  'Create  account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 100),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // Adjust radius as needed
                  ),
                  height: 600,
                  child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Email",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                validator: MultiValidator([
                                  EmailValidator(errorText: 'email ไม่ถูกต้อง'),
                                  RequiredValidator(
                                      errorText: 'กรุณาใส่อีเมล email')
                                ]),
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (mail) => {profile.email = mail!},
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.number,
                                validator: RequiredValidator(
                                    errorText: 'ป้อน password'),
                                onSaved: (password) =>
                                    {profile.password = password!},
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: SizedBox(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  child: const Text(
                                    'Create',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    //  varidate form
                                    if (formkey.currentState!.validate()) {
                                      formkey.currentState?.save();
                                      try {
                                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                                email: profile.email,
                                                password: profile.password)
                                            .then((Value) => {
                                                  // clear ค่าใน form field
                                                  formkey.currentState?.reset(),
                                                  Fluttertoast.showToast(
                                                      msg:"สร้างบัญชีเรียบร้อย",
                                                      gravity:ToastGravity.CENTER),

                                                  Navigator.pop(context,MaterialPageRoute(
                                                        builder: (context) =>LoginScreen()),
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
                                    // เรียก ใช้งาน on save
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
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
