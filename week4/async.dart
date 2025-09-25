void main() {
  print("fetching recipes");

  // if there's no ".then" then it will wait until the code is executed
  Future.delayed(Duration(seconds: 3), () {
    print("recipes fetched");
  });
    // underscore -> receiving no value
  // }).then((_) {
  //   print("after fetching recipes");

  String something = "something";
  print(something);
  // });
  
  Future.delayed(Duration(seconds: 3), () {
    print("inside delayed 1");
  }).then((_) async {
    print("inside then 1");
    
    await Future.delayed(Duration(seconds: 2), () {
      print("inside delayed 2");
    });
    
    print("inside then 2");
  });
  
  print("after delayed");
}
