import 'package:flutter/material.dart';
import 'package:myapp/screen/login.dart';
import 'package:myapp/screen/tabbar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://www.google.com/search?sca_esv=b492b5af9f856ada&sxsrf=ADLYWIJy-lXWvPyihqrzIW5rKeIZvUCm2Q:1719491082667&q=%E0%B8%A3%E0%B8%B9%E0%B8%9B+profile&udm=2&fbs=AEQNm0Dknj0rUtdXi9Fo5N7f5K-IOwPIdUOvbBZnSodTsvBZ6U-CcVb22RbSsNjxwWgg2kvl_wQNF2OybhZrk9kJPc4pln9n-5POQQlZHD6Mj3OWECyif6UY7Nq7vsZQrDi3Cuxuo42woiLNnZxbIb1-SG84XlwOoozxoi-RtJHo1_YM-c8NaX-jTVn0uU1rw58reAbQolhT15bH97awAlA60_-hqnhqa8zh_-f3TCF4dp7xxrDYj8OA78-kcYs-Jy8avHdxqIX5ZHPQcIApcuQo9sFascIPsQDy1giXXOtZzfRgwfGwNSI&sa=X&ved=2ahUKEwifybS54_uGAxU-1jgGHf1uDjgQtKgLegQIFBAB&biw=1440&bih=686&dpr=2#vhid=UzEYDLQKsnBMRM&vssid=mosaic'),
              ),
              SizedBox(height: 10),
              Text(
                'ชื่อผู้ใช้งาน',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'user@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('ชื่อเต็ม'),
                subtitle: Text('ชื่อเต็มของผู้ใช้'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('เบอร์โทรศัพท์'),
                subtitle: Text('+66 123 456 789'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('ที่อยู่'),
                subtitle: Text('ที่อยู่ของผู้ใช้'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('ตั้งค่า'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('ออกจากระบบ'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
