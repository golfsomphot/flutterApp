import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/wigget/listmenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HOME',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  IconButton(
                    focusColor: Colors.amber,
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.add),
                  ),
                  IconButton(
                    focusColor: Colors.amber,
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.camera),
                  )
                ],
              )
            ],
          )),
      body: ListMenu(),
    );
  }
}
