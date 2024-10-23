import 'package:flutter/material.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/seting.dart';
import 'package:myapp/screens/time.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MultiTabBottomBar extends StatefulWidget {
  @override
  _MultiTabBottomBarState createState() => _MultiTabBottomBarState();
}

class _MultiTabBottomBarState extends State<MultiTabBottomBar> {
  int _selectedIndex = 0; // ตัวแปรเพื่อเก็บแท็บที่เลือก
  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Time(),
    Text('การแจ้งเตือน',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('PROFILE',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Setting()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // เปลี่ยนแท็บที่เลือก
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: _widgetOptions[_selectedIndex], // แสดงเนื้อหาตามแท็บที่เลือก
          ),
        ),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home),
                label: 'หน้าแรก',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.list),
                label: 'การแจ้งเตือน',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.photoFilm),
                label: 'การตั้งค่า',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user),
                label: 'โปรไฟล์',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.gear),
                label: 'การตั้งค่า',
                backgroundColor: Colors.black),
          ],
          currentIndex: _selectedIndex, // กำหนดแท็บที่เลือก
          selectedItemColor: Colors.grey,
          onTap: _onItemTapped, // ตั้งค่าฟังก์ชันเมื่อแท็บถูกเลือก
        ),
      ],
    );
  }
}
