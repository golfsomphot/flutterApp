import 'package:flutter/material.dart';
import 'package:myapp/screen/about.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/login.dart';

import 'package:myapp/screen/register.dart';

// import 'page1/page1_page.dart';
// import 'login/login_page.dart';

class AppRoute {
  static const login = 'login';
  static const home = 'home';
  static const register = 'register';
  static const about = 'about';

  static get all async => <String, WidgetBuilder>{
        login: (context) => const Login(),
        home: (context) => const Home(),
        register: (context) => const Register(),
        about: (context) => const About(),
      };
}
