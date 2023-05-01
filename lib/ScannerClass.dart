import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omda_attendenceapp/readqr.dart';
import 'package:omda_attendenceapp/scanqr.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CreateScreen()));
                  print('creating qr code');
                },
                child: Text('create QR code')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ScanScreen()));
                  print('Read qr code');
                },
                child: Text('Read QR code')),
          ],
        ),
      ),
    );
  }
}
