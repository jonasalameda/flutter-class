import 'package:flutter/material.dart';
//TODO: put actual images
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyLVexample());
  }
}

class MyLVexample extends StatelessWidget {
  const MyLVexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 50,
            color: Colors.lime[600],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.local_cafe_outlined),
                  Text("Coffee"),
                  Icon(Icons.local_cafe_outlined)
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.blue[600],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.fastfood_sharp),
                  Text("Food"),
                  Icon(Icons.fastfood_sharp),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.red[600],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.apple),
                  Text("Apple"),
                  Icon(Icons.apple)
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.yellow[600],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.emoji_food_beverage_sharp),
                  Text("Tea"),
                  Icon(Icons.emoji_food_beverage_sharp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
