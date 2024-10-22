import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/wigget/listmenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
<<<<<<< HEAD
  String _scanResult = 'Unknown';

  Future<void> startBarcodeScan() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // สีของปุ่ม "Cancel"
        'Cancel', // ข้อความของปุ่ม "Cancel"
        true, // เปิดใช้งานแฟลชไฟฉายหรือไม่
        ScanMode.BARCODE, // หรือใช้ ScanMode.QR สำหรับ QR Code
      );
    } catch (e) {
      barcodeScanRes = 'Failed to get scan result: $e';
    }

    if (!mounted) return;

    setState(() {
      _scanResult = barcodeScanRes;
    });

    print('Scan result: $_scanResult');
  }

=======
>>>>>>> parent of f125523 (scan)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'HOME',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                IconButton(
                  focusColor: Colors.amber,
                  onPressed: () => {},
                  icon: FaIcon(FontAwesomeIcons.add),
                ),
                IconButton(
                  focusColor: Colors.amber,
                  onPressed: startBarcodeScan,
                  icon: FaIcon(FontAwesomeIcons.addressBook),
                )
              ],
            )
          ],
        ),
      ),
=======
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HOME',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  IconButton(
                    focusColor: Colors.amber,
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.add),
                  ),
                  IconButton(
                    focusColor: Colors.amber,
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.camera),
                  )
                ],
              )
            ],
          )),
>>>>>>> parent of f125523 (scan)
      body: ListMenu(),
    );
  }
}
