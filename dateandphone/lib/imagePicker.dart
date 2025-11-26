import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? cameraFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> selectFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        cameraFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date picker")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Image picker"),

            ElevatedButton(onPressed: () async {
              await selectFromCamera();
            }, child: Text("Date")),

            SizedBox(height: 10,),
            SizedBox(
              height: 300,
              width: 300,
              child: cameraFile == null
              ? Center(child: Text("Sorry nothing selected"),)
              : Image.file(cameraFile!)
            )
          ],
        ),
      ),
    );
  }
}
