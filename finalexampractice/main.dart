import 'package:finalexampractice/employeeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'apiService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: APILoaderPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class APILoaderPage extends StatefulWidget {
  const APILoaderPage({super.key});

  @override
  State<APILoaderPage> createState() => _APILoaderPageState();
}

class _APILoaderPageState extends State<APILoaderPage> {
  List<Employee> _employees = [];

  void _getData() async {
    _employees = (await ApiService().getUsers())!;
    Future.delayed(Duration(seconds: 5)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _employees!.isEmpty || _employees == null ?
      Center(
        child: CircularProgressIndicator(),
      )
          :
      ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(_employees![index].employeeName),
                  Text(_employees![index].employeeAge),
                  Text(_employees![index].employeeSalary),
                  Text(_employees![index].profileImage),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        );
      })
    );
  }
}
