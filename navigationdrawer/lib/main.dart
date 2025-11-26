import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NavDrawerApp());
  }
}

class NavDrawerApp extends StatelessWidget {
  const NavDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A Drawer is an invisible side screen")),
      // parent widget that controls margin space
      body: Center(
        child: Text("Open to navigate", style: TextStyle(fontSize: 20.0)),
      ),
      drawer: Builder(
        builder: (context) => Drawer(
          child: ListView(
            padding: EdgeInsetsGeometry.all(8),
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Jon"),
                accountEmail: Text("dosmasdos@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("J", style: TextStyle(fontSize: 40.0)),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.contacts_outlined),
                title: const Text("Contacts"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('test'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavDrawerApp()),
              );
            },
            child: Text("Home"),
          ),
        ],
      ),
    );
  }
}

/*
Drawer(
        child: ListView(
          padding: EdgeInsetsGeometry.all(8),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Jonh Msith"),
              accountEmail: Text("john@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text("JM"),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.contacts_outlined),
              title: Text("Contacts"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
 */
