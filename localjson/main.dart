import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JsonApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class JsonApp extends StatefulWidget {
  const JsonApp({super.key});

  @override
  State<JsonApp> createState() => _JsonAppState();
}

class _JsonAppState extends State<JsonApp> {
  List _items = [];

  // function to fetch the content on the local json file
  Future<void> readJSON() async {
    final String response = await (rootBundle.loadString("assets/settings.json"));
    final data = await jsonDecode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: readJSON, child: Text("Get Data")),
          _items.isNotEmpty ?
              Expanded(child: ListView.builder(itemCount: _items.length, itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsetsGeometry.all(10),
                  child: ListTile(
                    leading: Text(_items[index]["id"]),
                    trailing: Text(_items[index]["name"]),
                    subtitle: Text(_items[index]["description"]),
                  ),
                );
              },)) : Text("")
        ],
      ),
    );
  }
}
