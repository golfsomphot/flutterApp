import 'package:flutter/material.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({super.key});

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  List<int> itemCountList =
      List.generate(20, (index) => 0); // เก็บจำนวนของแต่ละเมนู

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Image.network(
                              fit: BoxFit.cover,
                              'https://img.pikbest.com/png-images/qianku/hand-painted-small-fresh-food-cartoon-illustration-fruit-cake-cute_1965054.png!w700wp',
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('รายการอาหาร ${index + 1}'),
                                  const Spacer(), // เพิ่ม Spacer เพื่อดันปุ่มไปทางขวา
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () => _decrement(index),
                                  ),
                                  Container(
                                    width: 30,
                                    child: Text(
                                      '${itemCountList[index]}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => _increment(index),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.withOpacity(0.3),
        onPressed: () {
          int selectedCount = itemCountList.where((count) => count > 0).length;
          print('จำนวนสินค้าที่เลือก: $selectedCount');
          print('รายการที่: $itemCountList');
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
                  backgroundColor: Colors.red.withOpacity(0.3),
                  child: Text(
                    '${itemCountList.where((count) => count > 0).length}',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
