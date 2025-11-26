import 'package:dateandphone/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

_makeCall() async {
  const url = 'tel:5142587580';
  if (await launch(url)) {
    await launch(url);
  } else {
    throw Error();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Phone Demo")),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text("Call this number"),
                ElevatedButton(onPressed: () async {
                  await _makeCall();
                }, child: Text('Call')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
