import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpdemo/apiService.dart';
import 'userModel.dart';
import 'constants.dart';

void main() {
  // runApp(const MyApp());
}

class APIDEMO extends StatefulWidget {
  const APIDEMO({super.key});

  @override
  State<APIDEMO> createState() => _APIDEMOState();
}

class _APIDEMOState extends State<APIDEMO> {
  List<UserModel> _userModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listening users from REST API"),
      ),
      body: _userModel!.isEmpty || _userModel == null ?
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
                      Text(_userModel![index].email),
                      Text(_userModel![index].website),
                      Text(_userModel![index].address.street),
                      Text(_userModel![index].address.city),
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
