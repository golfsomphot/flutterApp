import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  // สร้างรายการข้อมูล 10 รายการ
  final List<String> items =
      List<String>.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CHATS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
              backgroundColor: Colors.transparent, // กำหนดพื้นหลังให้โปร่งใส
              elevation: 0,
              onPressed: () {},
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 18,
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                    height: 40,
                    child: SearchBar(
                      autoFocus: false,
                      hintText: 'ค้นหา',
                      leading: const Icon(Icons.search),
                      trailing: <Widget>[],
                    )),
              ),
              Container(
                height: 100.0, // ความสูงของ Container
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // ตั้งค่าให้เลื่อนไปทางแนวนอน
                  itemCount: 10, // จำนวนรายการใน ListView
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          4.0), // การจัดระยะห่างระหว่างไอเทม
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min, // ใช้ขนาดที่พอเหมาะกับเนื้อหา
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            child: CircleAvatar(
                              radius: 40.0, // ขนาดของ CircleAvatar
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYv57bwc8eNsFKHQLZDejL951VYSiUg08jGg&s',
                                  scale: 5),
                            ),
                          ),
                          SizedBox(
                              height: 2.0), // ระยะห่างระหว่างรูปภาพและข้อความ
                          Text(
                            'Name ${index + 1}', // ข้อความที่แสดงด้านล่างรูปภาพ
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}
