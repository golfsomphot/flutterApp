
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:myapp/wigget/listmenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

    // คุณสามารถทำสิ่งอื่น ๆ ต่อหลังจากได้ผลลัพธ์การสแกน เช่น แสดงข้อความ หรือใช้ค่า `_scanResult`
    print('Scan result: $_scanResult');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  onPressed: startBarcodeScan, // เรียกใช้ฟังก์ชันการสแกน
                  icon: FaIcon(FontAwesomeIcons.add),
                ),
                IconButton(
                  focusColor: Colors.amber,
                  onPressed: () {
                    // สามารถเพิ่มฟังก์ชันสำหรับปุ่มนี้ได้หากต้องการ
                  },
                  icon: FaIcon(FontAwesomeIcons.camera),
                )
              ],
            )
          ],
        ),
      ),
      body: ListMenu(),
    );
  }
}
