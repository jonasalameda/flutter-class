import 'package:flutter/material.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      color: Colors.orangeAccent,
      debugShowCheckedModeBanner: false,
      home: MainAppPage(),
    );
  }
}

class MainAppPage extends StatelessWidget {
  const MainAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Polaco Macho Homem",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    "polaco.daora@gmail.com",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    "some number xd",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              Text("Address", style: TextStyle(fontSize: 18, color: Colors.red)),
              Row(
                children: [
                  Text("Jardim ipiranga"),
                  Text("R. Itaiba"),
                  Text("248-442"),
                  Text("Parque Res. Nardini"),
                ],
              ),
              Divider(),
              Text("Company", style: TextStyle(fontSize: 18, color: Colors.red)),
              Row(

                children: [
                  Flexible(child: Text("Polaco INC.\n", textAlign: TextAlign.start,)),
                  Flexible(child:Text("Multi-layered ALPHA company")),
                  Flexible(child: Text("cannot handle cowards")),
                  Flexible(child: Text("only REDPILL SIGMA BASED MEN can join")),
                  Flexible(child: Text("(yes you are hired if you eat a raw egg in front of the recruiter)")),
                ],
              ),
              Image.asset("assets/person.png")
            ],
          ),
        ],
      )
    );
  }
}
