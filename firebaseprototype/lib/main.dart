import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCsvjChR5LZzT5oRgOXtw2Eu-dFxICJHM0",
      appId: "109430906845",
      messagingSenderId: "1:109430906845:android:9334fc9bf3d0453b48e034",
      projectId: "fir-crud-69449",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyFS());
  }
}

class MyFS extends StatefulWidget {
  const MyFS({super.key});

  @override
  State<MyFS> createState() => _MyFSState();
}

class _MyFSState extends State<MyFS> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  CollectionReference employees = FirebaseFirestore.instance.collection(
    'Employees',
  );

  String name = "";
  String password = "";
  String empName = "";
  String empRole = "";
  String nameFilter = "";
  String roleFilter = "";

  Future<void> addUser() async {
    if (name.isNotEmpty && password.isNotEmpty) {
      await users.add({'name': name, 'password': password});
      setState(() {
        name = '';
        password = '';
      });
    }
  }

  Future<void> addEmployee() async {
    if (name.isNotEmpty && password.isNotEmpty) {
      await users.add({'name': name, 'role': password});
      setState(() {
        empName = '';
        empRole = '';
      });
    }
  }

  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }

  Future<void> deleteEmployee(String id) async {
    await employees.doc(id).delete();
  }

  Future<void> updateUser(String id, String newName, String newPsw) async {
    if (newName.isNotEmpty) {
      await users.doc(id).update({'name': newName, 'password': newPsw});
    }
  }

  Future<void> updateEmployee(String id, String newName, String newRole) async {
    if (newName.isNotEmpty) {
      await users.doc(id).update({'name': newName, 'role': newRole});
    }
  }

  void showEditDialog(Map<String, dynamic> item) {
    String newName = item['name'] ?? '';
    String newPassword = item['password'] ?? '';
    String newRole = item['role'] ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit ${item['type']}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: newName),
                onChanged: (val) => newName = val,
                decoration: InputDecoration(labelText: 'Name'),
              ),

              if (item['type'] == 'user')
                TextField(
                  controller: TextEditingController(text: newPassword),
                  onChanged: (value) => newPassword = value,
                  decoration: InputDecoration(labelText: 'Password'),
                ),

              if (item['type'] == 'user')
                TextField(
                  controller: TextEditingController(text: newRole),
                  onChanged: (value) => newRole = value,
                  decoration: InputDecoration(labelText: 'Role'),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (item['type'] == 'user') {
                  updateUser(item['id'], newName, newPassword);
                } else {
                  updateEmployee(item['id'], newName, newRole);
                }
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void confirmDelete(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete ${item['type']}?"),
        content: Text('Are you sure you want to delete? ${item['name']}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: () {
              if (item['type'] == 'user') {
                deleteUser(item['id']);
              } else {
                deleteEmployee(item['id']);
              }
              Navigator.pop(context);
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  // build the UI and use combined Stream
  // we will use restart which is used to manipulate combined streams
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firestore CRUD")),
      // helps the rendering process, otherwise ListView would be needed
      body: SingleChildScrollView(
        child: Column(
          children: [
            // build user section
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                children: [
                  Text("Add user", style: TextStyle(fontSize: 16)),

                  TextField(
                    onChanged: (value) => name = value,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),

                  TextField(
                    onChanged: (value) => password = value,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),

                  ElevatedButton(onPressed: addUser, child: Text('Add to FS')),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add Employee"),
                  TextField(
                    onChanged: (value) => empName = value,
                    decoration: InputDecoration(labelText: 'Employee Name'),
                  ),

                  TextField(
                    onChanged: (value) => empRole = value,
                    decoration: InputDecoration(labelText: 'Employee Role'),
                  ),

                  ElevatedButton(onPressed: addUser, child: Text('Add to FS')),
                ],
              ),
            ),

            // filter section
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Filter", style: TextStyle(fontSize: 16)),
                  TextField(
                    onChanged: (val) => setState(() {
                      nameFilter = val.toLowerCase();
                    }),
                    decoration: InputDecoration(
                      label: Text('Filter by name'),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),

                  TextField(
                    onChanged: (val) => setState(() {
                      roleFilter = val.toLowerCase();
                    }),
                    decoration: InputDecoration(
                      label: Text('Filter by role'),
                      prefixIcon: Icon(Icons.filter_alt),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(10),
              // use the StreamBuilder and querySnapshot
              child: StreamBuilder<List<QuerySnapshot>>(
                // time to use combined streams from RXdart
                stream: CombineLatestStream.list([
                  FirebaseFirestore.instance.collection('Users').snapshots(),

                  FirebaseFirestore.instance
                      .collection('Employees')
                      .snapshots(),
                ]),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var usersData = snapshot.data![0].docs;
                  var employeesData = snapshot.data![1].docs;

                  // merge into one combined list
                  var combined = [
                    // spread operator = ...
                    ...usersData.map(
                      (d) => {
                        'id': d.id,
                        'name': d['name'],
                        'password': d['password'],
                        'type': 'user',
                      },
                    ),

                    ...employeesData.map(
                      (d) => {
                        'id': d.id,
                        'name': d['name'],
                        'role': d['role'],
                        'type': 'employee',
                      },
                    ),
                  ];

                  // based on the value, apply filters to manipulate the cloud database
                  combined = combined.where((item) {
                    final nameMatch = item['name']
                        .toString()
                        .toLowerCase()
                        .contains(nameFilter);

                    if (roleFilter.isNotEmpty &&
                        item['type'] == 'employee' &&
                        item.containsKey('role')) {
                      final roleMatch = item['roleMatch']
                          .toString()
                          .toLowerCase()
                          .contains(nameFilter);
                      return nameMatch && roleMatch;
                    }

                    return nameMatch;
                  }).toList();

                  if (combined.isEmpty) {
                    return Text("No records found");
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: combined.length,
                    itemBuilder: (context, i) {
                      final item = combined[i];

                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          title: Text(item['name']),
                          subtitle: Text(
                            item['type'] == 'user'
                                ? 'Password: ${item['password']}'
                                : 'Role: ${item['role']}',
                          ),
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              IconButton(
                                onPressed: () => showEditDialog(item),
                                icon: Icon(Icons.edit, color: Colors.blue),
                              ),
                              IconButton(
                                onPressed: () => showEditDialog(item),
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
