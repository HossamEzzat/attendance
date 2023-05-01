

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _image;

  Future getGallery()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }
  Future getCamara()async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student attendence"),
        backgroundColor: Color(0xFF3C4046),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            _image != null ?Image.file(_image!,width: 250,height: 250,fit: BoxFit.cover,):
            Image.asset('assets/img.png',width: 350),
            SizedBox(height: 30,),
            Container(
              width: 300,
              height: 40,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor:const Color(0xFF3C4046),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onPressed: getGallery,
                child: Row(
                  children: [
                    Icon(Icons.image_rounded),
                    SizedBox(width: 20,),
                    Text('choose from gallery'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 300,
              height: 40,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor:const Color(0xFF3C4046),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                onPressed: getCamara,
                child: Row(
                  children: [
                    Icon(Icons.camera_alt_rounded),
                    SizedBox(width: 20,),
                    Text('take a photo'),
                    SizedBox(width: 20,),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextButton(

                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(22),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  backgroundColor: Color(0xff438842),

                ),
                onPressed: () => showToast("Successfully done", duration: Toast.lengthShort,gravity: Toast.bottom),   child: Text(
                "Ok Image",style: TextStyle(
                color: Colors.white
            ),),
            ),

          ],
        ),
      ),
    );
  }
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}