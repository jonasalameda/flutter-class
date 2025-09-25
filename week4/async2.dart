Future<void> main() async {
  // fetchUserData()
  //     .then((user) {
  //       print("updated user data");
  //     })
  //     .catchError((error) {
  //       print("error : $error");
  //     });
  //
  // print("end");

  print("start");
  try {
    final user = await fetchUserData();
    print("received user : $user");
  } catch(error) {
    print("error: $error");
  }
}

Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 5));
  return "john";
}
