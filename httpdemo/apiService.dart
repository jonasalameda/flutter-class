import 'dart:math';

import 'package:http/http.dart' as http;
import 'userModel.dart';
import 'constants.dart';

class ApiService {
  // because it can return null, put a ? after the List<UserModel>
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.usersEndPoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch(e) {
      log(e.toString() as num);
    }
  }
}