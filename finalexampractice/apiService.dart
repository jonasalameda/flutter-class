import 'dart:math';

import 'package:http/http.dart' as http;
import 'employeeModel.dart';
import 'constants.dart';

class ApiService {
  // because it can return null, put a ? after the List<UserModel>
  Future<List<Employee>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<Employee> _model = employeeModelFromJson(response.body);
        return _model;
      }
    } catch(e) {
      print(e.toString());
      print("ue");
      return List<Employee>.empty();
    }
    return List<Employee>.empty();
  }
}
