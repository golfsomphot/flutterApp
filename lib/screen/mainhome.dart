import 'package:flutter/material.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ListViewScreen(),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  // สร้างรายการข้อมูล 20 รายการ
  final List<String> items =
      List<String>.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView in Flutter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: ListView.builder(
            itemCount: items.length, // จำนวนรายการใน ListView
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ), // หมายเลขรายการในวงกลม
                ),
                title: Text(
                  items[index],
                  style: TextStyle(color: Colors.white),
                ), // ข้อความรายการ
              );
            },
          ),
        ),
      ),
    );
  }
}
