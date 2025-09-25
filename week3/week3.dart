import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeProject());
}

class CoffeeProject extends StatelessWidget {
  const CoffeeProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CoffeeMain(), debugShowCheckedModeBanner: false,);
  }
}

class CoffeeMain extends StatefulWidget {
  const CoffeeMain({super.key});

  @override
  State<CoffeeMain> createState() => _CoffeeMainState();
}

class _CoffeeMainState extends State<CoffeeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coffee shop'), backgroundColor: Colors.brown,),
      body: ListView(
        padding: EdgeInsets.all(2),

      ),
    );
  }
}
