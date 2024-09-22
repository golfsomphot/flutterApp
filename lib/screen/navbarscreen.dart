import 'package:flutter/material.dart';
import 'package:myapp/screen/mainhome.dart';
import 'package:myapp/screen/payment.dart';
import 'package:myapp/screen/product.dart';
import 'package:myapp/screen/profile.dart';
import 'package:myapp/widget/chatscreen.dart';

class NewMenuScreen extends StatefulWidget {
  @override
  _NewMenuScreenState createState() => _NewMenuScreenState();
}

class _NewMenuScreenState extends State<NewMenuScreen> {
  int _selectedIndex = 0;

  List<Widget> _screens = [Mainhome(), ProductPage(), Payment(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Chat',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits_sharp),
              label: 'production',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Payment',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
              backgroundColor: Colors.black),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
