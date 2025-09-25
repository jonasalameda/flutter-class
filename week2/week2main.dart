import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const LakeProject());
}

class LakeProject extends StatelessWidget {
  const LakeProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstVisit(), debugShowCheckedModeBanner: false);
  }
}

class FirstVisit extends StatelessWidget {
  const FirstVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('top 10 lakes: number 1 -> this one')),
      body: ListView(
        children: [
          Image(
            image: AssetImage('asset/sonho.jpg'),
            width: 400,
            fit: BoxFit.cover,
          ),
          // Image(image: AssetImage('asset/casadocara.png'), width: 400,),
          Padding(
            padding: EdgeInsetsGeometry.all(32),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "That is that, this is this",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Luxembourg, City",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.star, color: Colors.deepOrange),
                      Text("47", style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          child: Icon(Icons.phone, color: Colors.blue),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            "CALL",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          child: Icon(Icons.directions, color: Colors.blue),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            "ROUTE",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          child: Icon(Icons.mail, color: Colors.blue),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            "MAIL",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing"
                    " and typesetting industry."
                    " Lorem Ipsum has been the industry's"
                    " standard dummy text ever since the 1500s,"
                    " when an unknown printer took a galley of type and "
                    "scrambled it to make a type specimen book. "
                    "It has survived not only five centuries, "
                    "but also the leap into electronic typesetting, "
                    "remaining essentially unchanged."
                    " It was popularised in the 1960s with the release of "
                    "Letraset sheets containing Lorem",
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
