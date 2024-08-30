import 'package:flutter/material.dart';


class ProductPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'สินค้า 1',
      'price': '฿100',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 2',
      'price': '฿200',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 3',
      'price': '฿300',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 4',
      'price': '฿400',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 5',
      'price': '฿500',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 6',
      'price': '฿600',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 7',
      'price': '฿700',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 8',
      'price': '฿800',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 9',
      'price': '฿900',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 10',
      'price': '฿1000',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 11',
      'price': '฿1100',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 12',
      'price': '฿1200',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 13',
      'price': '฿1300',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 14',
      'price': '฿1400',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 15',
      'price': '฿1500',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 16',
      'price': '฿1600',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 17',
      'price': '฿1700',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 18',
      'price': '฿1800',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 19',
      'price': '฿1900',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
    {
      'name': 'สินค้า 20',
      'price': '฿2000',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrmYzhiIPMuFAclFBdWDrWmwentg1zu2ujoA&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return
     Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Arial', // ปรับเป็นฟอนต์มาตรฐาน
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      products[index]['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          products[index]['price'],
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
