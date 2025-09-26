import 'dart:io';

Future<void> main() async {
  // 1
  applyFunction([1, 2, 3, 4, 5, 6, 7], (value) => {print(value)});

  // 2
  transformList(['rat', 'raw', 'row', 'knew']).forEach((el) {
    print(el);
  });

  // 3
  List<int> nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];

  List test = nums.map((num) {
    return num % 2 == 0 ? num * num : 0;
  }).toList();

  test.removeWhere((num) => num == 0);

  test.forEach((n) => {print(n)});

  // 4
  print(greetUser('Polaco', 'Macho Homem'));
  
  // 5
  createEmail("biel", 'taspio');

  // 6
  Rectangle square = Rectangle.square(6);
  Rectangle rectangle = Rectangle.normal(12, 6);

  print(square.calculateArea());
  print(rectangle.calculateArea());

  // 7
  // List<int> nums2 = await streamExample();
  // nums2.forEach((sla) => print(sla));

  // 8
  printUserData();
}

// 1
void applyFunction(List<int> nums, var fn) {
  for (int value in nums) {
    fn(value);
  }
}

// 2
List transformList(List<String> words) {
  return words.map((str) {
    String c = str[0].toUpperCase();

    return c + str.substring(1);
  }).toList();
}

// 4
String greetUser([String fName = 'Guest', String lName = '']) {
  if (lName.isEmpty) {
    return "Hello, $fName";
  }

  return "Hello, $fName $lName";
}

// 5
void createEmail(String username, String domain, [String extension = 'com']) {
  print('$username@$domain.$extension');
}

// 6
class Rectangle {
  int width = 0;
  int height = 0;

  Rectangle.square(int side) {
    width = side;
    height = side;
  }

  Rectangle.normal(this.width, this.height);

  int calculateArea() {
    return width * height;
  }
}

// 7
Future<List<int>> streamExample() async {
  await Future.delayed(Duration(seconds: 5));

  List<int> nums = List.generate(100, (i) => i++);
  nums.removeWhere((num) => isPrime(num));

  await Future.delayed(Duration(seconds: 5));

  return nums;
}

bool isPrime(int num) {
  if (num == 1) {
    return false;
  }
  int i = 2;

  while(i * i <= num) {
    if (num % i == 0) {
      return false;
    }
    i++;
  }
  return true;
}

// 8
Future<Map<int, String>> fetchUserData() async {
  await Future.delayed(Duration(seconds: 5));

  Map<int, String> userData = <int, String>{};
  userData[0] = "test1";
  userData[1] = "test2";
  userData[2] = "test3";

  return userData;
}

void printUserData() async {
  print(await fetchUserData());
}
