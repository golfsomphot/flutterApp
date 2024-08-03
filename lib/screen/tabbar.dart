import 'package:flutter/material.dart';
import 'package:myapp/screen/home.dart';
import 'package:myapp/screen/product.dart';
import 'package:myapp/screen/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _Tabbar();
}

class _Tabbar extends State<Tabbar> {
  int _selectedPage = 0;
  final _pageOptions = [Home(),ProductPage(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 't',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.productHunt),
                  label: 'Production'),
              // BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.portable_wifi_off_outlined), label: 'Profile'),
            ]),
      ),
    );
  }
}
