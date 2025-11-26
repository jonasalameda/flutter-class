import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XylophonePage(),
    );
  }
}

class XylophonePage extends StatelessWidget {
  const XylophonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Xylophone"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


