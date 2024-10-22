import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final List<Map<String, dynamic>> numproduct; // รับรายการสินค้าเป็น list
  Chat(this.numproduct);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    // เตรียมข้อมูลสินค้า
    List<Map<String, dynamic>> cartProduct = widget.numproduct;

    return Scaffold(
      appBar: AppBar(
        title: Text('สินค้า'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: cartProduct.length,
        itemBuilder: (context, index) {
          final item = cartProduct[index];
          return ListTile(
            title: Text(item['title']),
            trailing: Text('จำนวน: ${item['count']}'),
          );
        },
      ),
    );
  }
}
