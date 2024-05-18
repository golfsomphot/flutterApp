import 'package:flutter/material.dart';
import 'package:myapp/screen/about.dart';
import 'package:myapp/screen/login.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getdat();
  }

  final String face = '';
  List response = [];

  void Getdat() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return About();
                  }));
                },
                child: Center(child: Text('$i')),
              );
            }),
      ),
    );
  }
}
