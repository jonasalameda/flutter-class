import 'package:flutterweek4/async2.dart';

Future<String> fetchData(String userId) async {
  print("fetching user data for : $userId");
  
  await Future.delayed(Duration(seconds: 3));

  return "data retrieved";
}

void main() {
  String user = "123";
  
  // call the async and handle its result using then
  fetchData("123114").then((data) {
    print("processing data : $data");
    // you can perform further operations with the data here
    return data;
  }).then((result) {
    print(result);
  }).catchError((error) {
    print("error : $error");
  });
}
