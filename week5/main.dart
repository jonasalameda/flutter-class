import 'package:flutter/material.dart';

void main() {
  runApp(MyFAB());
}

class MyFAB extends StatelessWidget {
  const MyFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyFabBtn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyFabBtn extends StatefulWidget {
  const MyFabBtn({super.key});

  @override
  State<MyFabBtn> createState() => _MyFabBtnState();
}

class _MyFabBtnState extends State<MyFabBtn> {
  String _value = "";

  void _onClicked() => setState(() {
    _value = DateTime.now().toString();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAB"), backgroundColor: Colors.blueAccent),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        backgroundColor: Colors.red,
        mini: false,
        child: Icon(Icons.calendar_today),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text(_value != "" ? _value : DateTime.now().toString()),
              SizedBox(height: 10),
              ElevatedButton(onPressed: null, child: Text("Login")),
              DataTable(
                columns: [
                  DataColumn(label: Text("Roll Number")),
                  DataColumn(label: Text("Student Name")),
                  DataColumn(label: Text("Phone Number")),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('122')),
                      DataCell(Text("john")),
                      DataCell(Text("(111) 111-1111")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('157')),
                      DataCell(Text("biel")),
                      DataCell(Text("(777) 777-7777")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('190')),
                      DataCell(Text("rafael")),
                      DataCell(Text("(343) 343-7777")),
                    ],
                  ),
                ],
              ),
              ListView(),
            ],
          ),
        ),
      ),
    );
  }
}
