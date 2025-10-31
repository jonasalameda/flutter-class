import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DicePage(),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int dice1 = 1;
  int dice2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset("dice$dice1.png", height: 200, width: 200,),
                Image.asset("dice$dice2.png",  height: 200, width: 200,),
              ],),
            SizedBox(height: 20,),
            OutlinedButton(onPressed: () {
              setState(() {
                // put random number in dice 1 and 2
                dice1 = Math.Random().nextInt(6) + 1;
                dice2 = Math.Random().nextInt(6) + 1;
              });
            }, child: Text("Roll!"))
          ],
        ),
      ),
    );
  }
}
