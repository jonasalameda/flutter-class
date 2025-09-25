import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasketballApp(),
      debugShowCheckedModeBanner: false,
      title: "Basketball application",
      color: Colors.deepOrange,
    );
  }
}

class BasketballApp extends StatefulWidget {
  const BasketballApp({super.key});

  @override
  State<BasketballApp> createState() => _BasketballAppState();
}

class _BasketballAppState extends State<BasketballApp> {
  int score1 = 0;
  int score2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basketball Points Counter"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Team 1", style: TextStyle(fontSize: 32)),
                    Text(score1.toString(), style: TextStyle(fontSize: 72)),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ++score1;
                        });
                      },
                      child: Text("Add 1 Point"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          score1 += 2;
                        });
                      },
                      child: Text("Add 2 Point"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          score1 += 3;
                        });
                      },
                      child: Text("Add 3 Point"),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Divider(),
                Column(
                  children: [
                    Text("Team 2", style: TextStyle(fontSize: 32)),
                    Text(score2.toString(), style: TextStyle(fontSize: 72)),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ++score2;
                        });
                      },
                      child: Text("Add 1 Point"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          score2 += 2;
                        });
                      },
                      child: Text("Add 2 Point"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          score2 += 3;
                        });
                      },
                      child: Text("Add 3 Point"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    String winner =  "Team ${score1 > score2 ? "1" : "2"} has won!";

                    if (score1 == score2 ) {
                      winner = "Draw!";
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          winner,
                        ),
                      ),
                    );
                    score1 = 0;
                    score2 = 0;
                  });
                },
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
