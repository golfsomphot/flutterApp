import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/screen/mainhome.dart';

class Chatscreen extends StatefulWidget {
  final int id; // ประกาศตัวแปร id
  final String name; // ประกาศตัวแปร id
  final String img; // ประกาศตัวแปร id

  const Chatscreen(
      {Key? key, required this.id, required this.name, required this.img})
      : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.backwardFast,
            color: Colors.white,
            size: 18,
          ), // รูปภาพของไอคอน "กลับ"
          onPressed: () {
            Navigator.pop(
              context,
              // ลบทุกหน้าใน stack
            );
          },
        ),
        backgroundColor: Colors.black,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.img),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${widget.name}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.phone,
                    size: 16,
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
