import 'package:flutter/material.dart';
import 'package:myapp/screen/navbarscreen.dart';
import 'package:myapp/widget/chatscreen.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"id": 1, "name": "John Doe", "image": "https://picsum.photos/200"},
      {"id": 2, "name": "Jane Smith", "image": "https://picsum.photos/200"},
      {"id": 3, "name": "Alice Johnson", "image": "https://picsum.photos/200"},
      {"id": 4, "name": "Bob Brown", "image": "https://picsum.photos/200"},
      {"id": 5, "name": "Charlie Davis", "image": "https://picsum.photos/200"},
      {"id": 6, "name": "David Wilson", "image": "https://picsum.photos/200"},
      {"id": 7, "name": "Emma Moore", "image": "https://picsum.photos/200"},
      {"id": 8, "name": "Frank Harris", "image": "https://picsum.photos/200"},
      {"id": 9, "name": "Grace Clark", "image": "https://picsum.photos/200"},
      {"id": 10, "name": "Henry Lewis", "image": "https://picsum.photos/200"}
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Mainhome',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
                  ),
                ),
              ),
              Container(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYv57bwc8eNsFKHQLZDejL951VYSiUg08jGg&s',
                                scale: 5,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            'Name ${index + 1}',
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index];
                    var id = item['id'];
                    var image = item['image'];
                    var name = item['name'];
                    return Container(
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(image),
                          ),
                          title: Text(
                            ' ${name}',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Chatscreen(
                                  id: id,
                                  name: name,
                                  img: image,
                                ),
                              ),
                            );
                          }),
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
