import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIME'),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // เพิ่ม Expanded ที่นี่
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      'sdsdsd $index', // แสดงค่า index เพื่อให้เห็นความแตกต่าง
                      style: TextStyle(color: Colors.amber),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
