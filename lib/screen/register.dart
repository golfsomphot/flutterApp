
import 'package:flutter/material.dart';
import 'package:myapp/model/profile.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


final formkey  = GlobalKey<FormState>();
Profile profiles = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สร้างบัญชีผู้ใช้งาน'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key:formkey,
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Email'),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? email) {
                   profiles.email = email ?? '';
                 },
                  
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Password'),
                TextFormField(
                  obscureText: true,
                   onSaved: (String? password) {
                   profiles.password = password ?? '';
                 },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('ลงทะเบียน'),
                    onPressed: () {
                      formkey.currentState?.save();
                      print('email= ${profiles.email} password= ${profiles.password}');
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
