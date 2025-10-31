import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/main.dart';

void main() {
  runApp(MyApp());
}
// TODO: MOVE DATA TO NEXT SCREEN: MOVE DOG LIST TO NEXT SCREEN

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatabaseApplication(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DatabaseApplication extends StatefulWidget {
  const DatabaseApplication({super.key});

  @override
  State<DatabaseApplication> createState() => _DatabaseApplicationState();
}

class _DatabaseApplicationState extends State<DatabaseApplication> {
  Database? database;

  // container to hold the dog instances
  List<Dog> dogList = [];

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _typeController = TextEditingController();

  // will launch once the application is started
  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'animal_db');

    database = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, type TEXT)",
        );
      },
    );
    // await refreshDogs();
  }

  Future<void> refreshDogs() async {
    if (database == null) return;
    final List<Map<String, dynamic>> maps = await database!.query('dogs');
    setState(() {
      dogList = List.generate(maps.length, (i) {
        return Dog(
          id: maps[i]['id'],
          name: maps[i]['name'],
          age: maps[i]['age'],
          type: maps[i]['type'],
        );
      });
    });
  }

  Future<void> insertDog(Dog dog) async {
    final data = {
      'name': dog.name,
      'age': dog.age,
      'type': dog.type,
    };

    await database!.insert(
      'dogs',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await refreshDogs();
  }

  Future<void> updateDog(Dog dog) async {
    final data = {
      'name': dog.name,
      'age': dog.age,
      'type': dog.type,
    };

    await database!.update(
      'dogs',
      data,
      where: "id = ?",
      whereArgs: [dog.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await refreshDogs();
  }

  Future<void> deleteDog(int id) async {
    await database!.delete('dogs', where: "id = ?", whereArgs: [id]);
    await refreshDogs();
  }

  void clearForm() {
    _idController.clear();
    _nameController.clear();
    _ageController.clear();
    _typeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Interface")),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: "ID"),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: "Age"),
            ),
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: "Type"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    final name = _nameController.text.trim();
                    final age = int.parse(_ageController.text.trim());
                    final type = _typeController.text.trim();

                    if (name.isNotEmpty) {
                      await insertDog(
                        Dog(id: 0, name: name, age: age, type: type),
                      );
                    }
                  },
                  child: Text("Add"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final name = _nameController.text.trim();
                    final age = int.parse(_ageController.text.trim());
                    final type = _typeController.text.trim();

                    if (name.isNotEmpty) {
                      await updateDog(
                        Dog(id: 0, name: name, age: age, type: type),
                      );
                    }
                  },
                  child: Text("Update"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final name = _nameController.text.trim();
                    final age = int.parse(_ageController.text.trim());
                    final id = int.parse(_idController.text.trim());
                    final type = _typeController.text.trim();

                    if (name.isNotEmpty) {
                      await deleteDog(id);
                      clearForm();
                    }
                  },
                  child: Text("Remove"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    await refreshDogs();
                  },
                  child: Text("Show List"),
                ),

                Expanded(
                  child: dogList.isEmpty
                    ? Center(child: Text("No Data found"))
                    : ListView.builder(
                        itemCount: dogList.length,
                        itemBuilder: (context, index) {
                          final dog = dogList[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(child: Text("${dog.id}")),
                              title: Text(dog.name),
                              subtitle: Text("${dog.age}"),
                              trailing: Text(dog.type),
                            ),
                          );
                        },
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
