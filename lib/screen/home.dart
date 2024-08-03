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
        backgroundColor: Colors.blue[200],
        title: Row(

          children: [
            Text(
              'HOME',
              style: TextStyle(
                fontSize: 24,
                fontFamily: AutofillHints.birthdayDay,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
           SizedBox(width: 290,),
             Icon(Icons.calendar_month ,
             color: Colors.white,),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
