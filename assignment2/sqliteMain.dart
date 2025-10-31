import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: DatabaseApp(), debugShowCheckedModeBanner: false));
}

class DatabaseApp extends StatefulWidget {
  const DatabaseApp({super.key});

  @override
  State<DatabaseApp> createState() => _DatabaseAppState();
}

Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY, firstName VARCHAR(100), '
        'lastName VARCHAR(100), marks INTEGER)',
      );
    },
    version: 1,
  );
}

Database? db;

List<User> userList = [];

Future<void> initializeDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'users_db');

  db = await openDatabase(
    path,
    version: 2,
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT, lastName TEXT, marks INT)",
      );
    },
  );
}

Future<void> insertUser(User user) async {
  final data = {
    'firstName': user.firstName,
    'lastName': user.lastName,
    'marks': user.marks,
  };

  await db!.insert('user', data, conflictAlgorithm: ConflictAlgorithm.replace);

  // await refreshUsers();
}

Future<void> updateUser(User user) async {
  final data = {
    'firstName': user.firstName,
    'lastName': user.lastName,
    'marks': user.marks,
  };

  await db!.update(
    'user',
    data,
    where: 'id = ?',
    whereArgs: [user.id],
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  // await refreshUsers();
}

Future<void> deleteUser(int id) async {
  await db!.delete('user', where: 'id = ?', whereArgs: [id]);

  // await refreshUsers();
}

class _DatabaseAppState extends State<DatabaseApp> {
  final _idController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _marksController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> refreshUsers() async {
    if (db == null) return;
    final List<Map<String, dynamic>> maps = await db!.query('user');
    setState(() {
      userList = List.generate(maps.length, (i) {
        return User(
          id: maps[i]['id'] as int,
          firstName: maps[i]['firstName'] as String,
          lastName: maps[i]['lastName'] as String,
          marks: maps[i]['marks'] as int,
        );
      });
    });
  }

  void clearForm() {
    _idController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _marksController.clear();
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
              controller: _firstNameController,
              decoration: InputDecoration(labelText: "First Name"),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              controller: _marksController,
              decoration: InputDecoration(labelText: "Marks"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    final id = int.parse(_idController.text.trim());
                    final firstName = _firstNameController.text.trim();
                    final lastName = _lastNameController.text.trim();
                    final marks = int.parse(_marksController.text.trim());

                    if (firstName.isNotEmpty && lastName.isNotEmpty) {
                      await insertUser(
                        User(
                          id: id,
                          firstName: firstName,
                          lastName: lastName,
                          marks: marks,
                        ),
                      );

                      await refreshUsers();
                    }
                  },
                  child: Text("Add"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final id = int.parse(_idController.text.trim());
                    final firstName = _firstNameController.text.trim();
                    final lastName = _lastNameController.text.trim();
                    final marks = int.parse(_marksController.text.trim());

                    if (firstName.isNotEmpty && lastName.isNotEmpty) {
                      await updateUser(
                        User(
                          id: id,
                          firstName: firstName,
                          lastName: lastName,
                          marks: marks,
                        ),
                      );

                      await refreshUsers();
                    }
                  },
                  child: Text("Update"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    await refreshUsers();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MasterViewPage(userList: userList),
                      ),
                    );
                  },
                  child: Text("See List"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MasterViewPage extends StatefulWidget {
  const MasterViewPage({super.key, required this.userList});

  final userList;

  @override
  State<MasterViewPage> createState() =>
      _MasterViewPageState(userList: userList);
}

class _MasterViewPageState extends State<MasterViewPage> {
  _MasterViewPageState({required this.userList});

  late final userList;

  List<Map<String, Object?>> test = [];
  var test2 = [];

  Future<void> refreshUsers() async {
    if (db == null) return;
    final List<Map<String, dynamic>> maps = await db!.query('user');
    test = (await db!.query("SELECT * FROM users"));
    setState(() {
      test2 = List.generate(maps.length, (i) {
        return User(
          id: maps[i]['id'] as int,
          firstName: maps[i]['firstName'] as String,
          lastName: maps[i]['lastName'] as String,
          marks: maps[i]['marks'] as int,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: userList!.isEmpty
                  ? Center(child: Text("No Data found"))
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        final user = userList[index];
                        return ListTile(
                          leading: CircleAvatar(child: Text("${user.id}")),
                          title: Text(user.firstName),
                          subtitle: Column(
                            children: [
                              Text(user.lastName),
                              Text(user.firstName),
                              Text(user.marks.toString()),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final int marks;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.marks,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'marks': marks,
    };
  }

  @override
  String toString() {
    return "User{id': $id, 'firstName': $firstName, "
        "'lastName': $lastName, 'marks': $marks}";
  }
}
