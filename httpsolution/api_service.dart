import 'package:http/http.dart' as http;
import 'package:httpsolution/todos_model.dart';
import 'user_model.dart';
import 'constants.dart';
import 'dart:developer';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<TodosModel>?> getTodos() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TodosModel> _model = todosModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
