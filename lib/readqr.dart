

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:toast/toast.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrstr = "let's Scan it";
  var height,width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanning QR code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(qrstr,style: TextStyle(color: Colors.blue,fontSize: 30),),
            ElevatedButton(onPressed: scanQr, child:
            Text(('Scanner'))),
            SizedBox(height: width,),
            TextButton(

              style: TextButton.styleFrom(
                padding: EdgeInsets.all(22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                backgroundColor: Color(0xff438842),

              ),
              onPressed: () => showToast("Successfully done", duration: Toast.lengthLong,gravity: Toast.bottom),   child: Text(
              "Ok Scanner",style: TextStyle(
                color: Colors.white
            ),),
            ),
          ],
        ),
      )
    );
  }


  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr=value;
        });
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
