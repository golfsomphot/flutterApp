import 'package:flutter/material.dart';

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
        backgroundColor: Colors.purple[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TODO APP',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Arial', // ปรับเป็นฟอนต์มาตรฐาน
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.purple[50], // สีพื้นหลังของ body
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TODO TITLE $index',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'TODO SUB TITLE',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.purple[200],
                            onPressed: () {
                              // Action for edit
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.purple[200],
                            onPressed: () {
                              // Action for delete
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.check_circle),
                            color: Colors.purple[200],
                            onPressed: () {
                              // Action for mark as complete
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
