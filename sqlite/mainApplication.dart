import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DInterface());
  }
}

class DInterface extends StatefulWidget {
  const DInterface({super.key});

  @override
  State<DInterface> createState() => _DInterfaceState();
}

class _DInterfaceState extends State<DInterface> {
  // initialize the data base object
  late Database database;
  List<Dog> dogList = [];

  // controllers for user entry point
  final _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _typeController = TextEditingController();

  Dog? currentDog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDatabase();
  }

  // define initialize database
  Future<void> initializeDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'dog_list.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, type TEXT)',
        );
      },
      version: 1,
    );
    // since user can add multiple dog objects,
    // we have to write a method to update the new value
    refreshDogs();
  }

  //insert a dog object to db
  Future<void> insertDog(Dog dog) async {
    await database.insert(
      'dogs',
      dog.toMap(),
      // this map function is used to convert dog dart object to db object
      conflictAlgorithm:
          ConflictAlgorithm.replace, // this is used to solve the id error
    );
    refreshDogs();
  }

  Future<void> refreshDogs() async {
    final List<Map<String, dynamic>> maps = await database.query('dogs');
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

  Future<void> updateDog(Dog dog) async {
    await database.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
    refreshDogs();
  }

  Future<void> deleteDog(Dog dog) async {}

  void clearForm() {
    _nameController.clear();
    _ageController.clear();
    _typeController.clear();
    currentDog = null;
  }

  void showFormDialog({Dog? dog}) {
    if (dog != null) {
      _nameController.text = dog.name;
      _ageController.text = dog.age.toString();
      _typeController.text = dog.type;
      currentDog = dog;
    }
    showDialog(
      context: this.context,
      builder: (context) {
        return AlertDialog(
          title: Text(dog == null ? 'Add dog' : 'Update Dog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                clearForm();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final name = _nameController.text;
                final age = int.parse(_ageController.text) ?? 0;
                final type = _typeController.text;

                if (name.isNotEmpty && age > 0) {
                  if (currentDog == null) {
                    insertDog(Dog(id: 0, name: name, age: age, type: type));
                  }
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite demo")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dogList.length,
              itemBuilder: (context, index) {
                final dog = dogList[index];
                return ListTile(
                  title: Text(dog.name),
                  subtitle: Text('Age: ${dog.age}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => showFormDialog(dog: dog),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => deleteDog(dog),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => showFormDialog(),
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => refreshDogs(),
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
