import 'package:flutter/material.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/login.dart';
import 'package:myapp/screen/page1.dart';
import 'package:myapp/screen/register.dart';

// import 'page1/page1_page.dart';
// import 'login/login_page.dart';

class AppRoute {
  static const page1 = 'page1';
  static const home = 'home';
  static const login = 'login';
  static const register = 'register';

  static get all => <String, WidgetBuilder>{
        page1: (context) => const Page1(),
        home: (context) => const Home(),
        register: (context) => const Register(),
        login: (context) => const Login(),
      };
}
