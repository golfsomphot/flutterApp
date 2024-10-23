import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/listmenu.dart';
import 'package:myapp/screens/chat.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import model

class ListMenu extends StatefulWidget {
  const ListMenu({super.key});

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  List<int> itemCountList = [];
  List<String> itemCountList_name = [];
  List<Photo> photos = [];

  // เก็บรายการ photos ใน State

  Future<List<Photo>> fetchAlbum() async {
    final res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (res.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(res.body);
      return jsonList.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }

  void _increment(int index) {
    setState(() {
      itemCountList[index]++;
    });
  }

  void _decrement(int index) {
    setState(() {
      if (itemCountList[index] > 0) {
        itemCountList[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            photos = snapshot.data!; // เก็บข้อมูลในตัวแปร photos

            if (itemCountList.isEmpty) {
              itemCountList = List.generate(5, (index) => 0);
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemCount: 5, // กำหนดจำนวนข้อมูลจริง
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            fit: BoxFit.cover,
                            photos[index].thumbnailUrl,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${photos[index].id.toString()} ${photos[index].title}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => _decrement(index),
                        ),
                        Container(
                          width: 30,
                          child: Text(
                            '${itemCountList[index]}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => {
                                  _increment(index),
                                }),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            const Color.fromARGB(255, 204, 223, 204).withOpacity(0.3),
        onPressed: () {
          List<Map<String, dynamic>> selectedItems = [];

          // ดึงข้อมูลสินค้าที่ถูกเลือก
          for (int i = 0; i < itemCountList.length; i++) {
            if (itemCountList[i] > 0) {
              selectedItems.add({
                'title': photos[i].title, // ชื่อสินค้า
                'count': itemCountList[i], // จำนวนสินค้า // จำนวนสินค้า
              });
            }
          }
          if (selectedItems != null) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => Chat(selectedItems),
              ),
            );
          }
          // แสดง obj ใหม่
          print('สินค้าที่เลือก: $selectedItems');
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 15,
              bottom: 5,
              child: Icon(
                color: Colors.white.withOpacity(0.9),
                Icons.shopping_cart,
              ),
            ),
            if (itemCountList.where((count) => count > 0).length > 0)
              Positioned(
                left: 20,
                bottom: 25,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red.withOpacity(0.9),
                  child: Text(
                    '${itemCountList.where((count) => count > 0).length}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
