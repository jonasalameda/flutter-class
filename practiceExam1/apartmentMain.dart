import 'package:flutter/material.dart';

void main() {
  runApp(ContainerApp());
}

int guests = 1;
int rooms = 1;

class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContainerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            _tile('Las Vegas, NV', Icons.compass_calibration),
          ListTile(
              title: Text(
                "$guests Guests",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              leading: Icon(Icons.people, color: Colors.blueGrey),
              trailing: Row(
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      guests++;
                    });
                  }, icon: Icon(Icons.add)),
                  IconButton(onPressed: () {
                    setState(() {
                      guests -= guests <= 1 ? 0 : 1;
                    });
                  }, icon: Icon(Icons.remove)),
                ],
              )
          ),
          ListTile(
              title: Text(
                '$rooms Room',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              leading: Icon(Icons.bed, color: Colors.blueGrey),
              trailing: Row(
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      rooms++;
                    });
                  }, icon: Icon(Icons.add)),
                  IconButton(onPressed: () {
                    setState(() {
                      rooms -= rooms <= 1 ? 0 : 1;
                    });
                  }, icon: Icon(Icons.remove)),
                ],
              )
          ),
            _tile('Today', Icons.arrow_forward),
            _tile('Tomorrow', Icons.arrow_back),

            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "You are trying to book $guests guests and $rooms rooms",
                    ),
                  ),
                );
              },
              child: Text("Reserve"),
            ),
          ],
        ),
      ),
    );
  }
}

ListTile _tile(String title, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
    leading: Icon(icon, color: Colors.black),
    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
  );
}

ListTile _buttonTile(String title, IconData icon, int variable) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
    leading: Icon(icon, color: Colors.blueGrey),
    trailing: Row(
      children: [
        IconButton(onPressed: () {
          variable++;
        }, icon: Icon(Icons.add)),
        IconButton(onPressed: () {
          variable -= variable <= 1 ? 0 : 1;
        }, icon: Icon(Icons.remove)),
      ],
    )
  );
}
