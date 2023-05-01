
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omda_attendenceapp/picker.dart';

import 'ScannerClass.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int currentIndex = 0;


  List<Widget> screens = [
    Home(),
    MyHomePage(title: 'attendance',)


  ];

  List<String> titles = ["Camera", "Scanner"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffE7F6F2),
        currentIndex: currentIndex,
        onTap: (index) {
           setState(() {
                currentIndex = index;
              });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Camera",),
          BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner_outlined), label: "Scanner"),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
