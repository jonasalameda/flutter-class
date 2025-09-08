import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const LakeProject());
}

class LakeProject extends StatelessWidget {
  const LakeProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstVisit(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstVisit extends StatelessWidget {
  const FirstVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('top 10 lakes: number 1 -> this one'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Image(
                image: AssetImage('asset/sonho.jpg'),
                width: 400),
              // Image(image: AssetImage('asset/casadocara.png'), width: 400,),
            ],
          ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("That is that, this is this", style:
                      TextStyle(
                          color: Colors.black, fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.star, color: Colors.deepOrange, ),
                    Text("47", style: TextStyle(color: Colors.orange),)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text("England, London", style:
                    TextStyle(
                        color: Colors.black87
                    )
                  ),
                  SizedBox(height: 10,)
                ],)
              ],
            ),

            SizedBox(height: 10,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                ElevatedButton(onPressed: null, child: Icon(Icons.phone, color: Colors.blue)),
                Text("CALL", style: TextStyle(color: Colors.blue),),
                SizedBox(height: 10),
              ],),

              Column(children: [
                ElevatedButton(onPressed: null, child: Icon(Icons.directions, color: Colors.blue)),
                Text("ROUTE", style: TextStyle(color: Colors.blue)),
                SizedBox(height: 10),
              ],),

              Column(children: [
                ElevatedButton(onPressed: null, child: Icon(Icons.mail, color: Colors.blue)),
                Text("MAIL", style: TextStyle(color: Colors.blue)),
                SizedBox(height: 10),
              ],),
            ],
          ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "\nProin pharetra, nunc vel interdum porta, mi risus porttitor, "
                  "\nquis tincidunt orci enim at nisl. Nunc vitae nulla tristique, "
                  "\nscelerisque arcu sit amet, dictum dolor. Aliquam erat volutpat."
                  " \nDonec congue leo id dui varius ")],
            )],
        ),
      ),
    );
  }
}

