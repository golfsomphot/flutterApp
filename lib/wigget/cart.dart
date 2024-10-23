import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final List<Map<String, dynamic>> selectedItems;

  // รับ selectedItems ผ่าน constructor
  Cart(this.selectedItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${selectedItems[index]['title']}'),
            subtitle: Text('จำนวน: ${selectedItems[index]['count']}'),
          );
        },
      ),
    );
  }
}
