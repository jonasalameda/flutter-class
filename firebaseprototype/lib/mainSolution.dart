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
  MyApp({super.key});

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
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'Users',
  );
  final CollectionReference employees = FirebaseFirestore.instance.collection(
    'Employees',
  );

  String name = '';
  String password = '';
  String employeeName = '';
  String employeeRole = '';
  String nameFilter = '';
  String roleFilter = '';

  // create the user
  Future<void> addUser() async {
    if (name.isNotEmpty && password.isNotEmpty) {
      await users.add(({'name': name, 'password': password}));
      setState(() {
        name = '';
        password = '';
      });
    }
  }

  Future<void> addEmployee() async {
    if (employeeName.isNotEmpty && employeeRole.isNotEmpty) {
      await employees.add({'name': employeeName, 'role': employeeRole});
      setState(() {
        employeeName = '';
        employeeRole = '';
      });
    }
  }

  // update
  Future<void> updateUser(String id, String newName, String newPassword) async {
    if (newName.isNotEmpty) {
      await users.doc(id).update({'name': newName, 'password': newPassword});
    }
  }

  Future<void> updateEmployee(String id, String newName, String newRole) async {
    if (newName.isNotEmpty && newRole.isNotEmpty) {
      await employees.doc(id).update({'name': newName, 'role': newRole});
    }
  }

  // delete
  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }

  Future<void> deleteEmployee(String id) async {
    await employees.doc(id).delete();
  }

  // dialog box for editing the db
  void showEditDialog(Map<String, dynamic> item) {
    String newName = item['name'];
    String newPassword = item['password'] ?? '';
    String newRole = item['role'] ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit ${item['type']}'),
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
                  onChanged: (val) => newPassword = val,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              if (item['type'] == 'employee')
                TextField(
                  controller: TextEditingController(text: newRole),
                  onChanged: (val) => newPassword = val,
                  decoration: InputDecoration(labelText: 'Role'),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (item['type'] == 'user') {
                  updateUser(item['id'], newName, newPassword);
                } else {
                  updateEmployee(item['id'], newName, newRole);
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // delete dialog

  void confirmDelete(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${item['type']}?'),
        content: Text('are you sure you want to delete ${item['name']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'),
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
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  // build the UI and use combined Stream
  // we will use rxdart which is used for manipulate combined streams

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FS Combined Stream")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // build user section
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add user', style: TextStyle(fontSize: 16)),
                  TextField(
                    onChanged: (val) => name = val,
                    decoration: InputDecoration(labelText: 'user name'),
                  ),
                  TextField(
                    onChanged: (val) => password = val,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'password'),
                  ),
                  ElevatedButton(onPressed: addUser, child: Text('Add to FS')),
                ],
              ),
            ),

            // create employee section
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add Employee', style: TextStyle(fontSize: 16)),
                  TextField(
                    onChanged: (val) => employeeName = val,
                    decoration: InputDecoration(labelText: 'Employee Name'),
                  ),
                  TextField(
                    onChanged: (val) => employeeRole = val,
                    decoration: InputDecoration(labelText: 'Employee Role'),
                  ),
                  ElevatedButton(
                    onPressed: addEmployee,
                    child: Text('Add Employee'),
                  ),
                ],
              ),
            ),

            // Filter Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filters', style: TextStyle(fontSize: 16)),
                  TextField(
                    onChanged: (val) =>
                        setState(() => nameFilter = val.toLowerCase()),
                    decoration: InputDecoration(
                      labelText: 'Filter by name',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  TextField(
                    onChanged: (val) =>
                        setState(() => roleFilter = val.toLowerCase()),
                    decoration: InputDecoration(
                      labelText: 'Filter by role',
                      prefixIcon: Icon(Icons.filter_alt),
                    ),
                  ),
                ],
              ),
            ),
            // read and crud button (combined stream)
            Padding(
              padding: EdgeInsets.all(10),
              // use the Streambuilder and querySnapshot (manipulate the firestore object
              child: StreamBuilder<List<QuerySnapshot>>(
                // time to use combinedstream from RXdart
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
                  //merge into one combined list

                  var combined = [
                    // use spread operator
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
                  // apply filters to manipulate the cloud database
                  combined = combined.where((item) {
                    final nameMatch = item['name']
                        .toString()
                        .toLowerCase()
                        .contains(nameFilter);
                    if (roleFilter.isNotEmpty &&
                        item['type'] == 'employee' &&
                        item.containsKey('role')) {
                      final roleMatch = item['role']
                          .toString()
                          .toLowerCase()
                          .contains(roleFilter);
                      return nameMatch && roleMatch;
                    }
                    return nameMatch;
                  }).toList();
                  if (combined.isEmpty) {
                    return Text('No records found');
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
                                ? 'Password : ${item['password']}'
                                : 'Role ${item['role']}',
                          ),
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              IconButton(
                                onPressed: () => showEditDialog(item),
                                icon: Icon(Icons.edit, color: Colors.blue),
                              ),
                              IconButton(
                                onPressed: () => confirmDelete(item),
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
