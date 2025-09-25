import "dart:math" as Math;

// basics of classes and abstraction
abstract class Shape {
  void area();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius):super();

  @override
  void area() {
    print(Math.pow(radius, 2) * Math.pi);
  }
}

class Square extends Shape {
  int side;

  Square(this.side):super();

  @override
  void area() {
    print(side * side);
  }
}

// enum basics
enum Operation {
  sum,
  multiply,
  subtract,
  divide,
  module
}

// encapsulation
class Employee {
  var _name;
  var _id;
  var _email;
  var _address;

  Employee(this._name, this._id, this._email, this._address);

  get address => _address;

  set address(value) {
    _address = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }
}

/// outputs the value of the point in a 3D plane
test(int x, int y, [int z = 0])  {
  print('point x is: ${x}');
  print('point y is: ${y}');
  print('point z is: ${z}');
}

// test with {}, it does not matter the order
test2(n1, {s1, s2}) {
  print(n1);
  print(s1);
}

int inc(int x) => ++x;

int dec(int x) => --x;

int apply(int x, Function fn) {
  return fn(x);
}

// named constructors are used as parameterized
class Student {
  Student();

  Student.namedConst(String randomString) {
    print("named constructor: ${randomString}");
  }
}

// OOP
class Laptop {
  Laptop({var name, var color}) {
    print("Laptop constructor");
    print(name);
    print(color);
  }

  Laptop.intel() {
    print("Intel constructor");
  }
}

class MacBook extends Laptop {
  MacBook({var name, var color}) : super(name: name, color : color) {
    print("parameterized constructir");
  }
}

// temperature conversion
void main() {
  double tempFahr = 90.25;
  double tempCels = (tempFahr - 32) / 1.8;

  // string interpolation + basic temperature changer
  print('${tempFahr.toStringAsFixed(1)}F = ${tempCels.toStringAsFixed(1)}C');

  const a = 2;
  const b = 4;

  // enum usage in switch
  const op = Operation.multiply;

  // you get the idea right
  switch (op) {
    case Operation.multiply:
      print(a * b);
      break;
    default:
      print('ronaldo');
      break;
  }

  // arrow function
  int add(int x, int y) => x * y;

  //optional parameters example
  // x = 2, y = 6, z = 0
  test(2, 6);

  // x = 3, y = 6, z = 9
  test(3, 6, 9);

  // x = 3, y = 6, z = 9
  test(3, 6, 9);

  // n1 = 123, s1 = hk, s2 = who nose
  test2(123, s1: 'hk');

  // n1 = 123, s2 = top 5, s1 = world
  test2(123, s2: 'top 5', s1: 'world');

  const tests = [true, false, true, true, false];

  // anonymous functions, like typescript
  tests.forEach((element) => print(element ? "Successful" : "Failure"));

  tests.forEach((bool element) {
    print(element ? "Successful" : "Failure");
  });

  print(apply(5, inc));
  print(apply(2, dec));

  Student.namedConst("testing");

  MacBook macbook = MacBook(name: "MacBook for viados edition", color: "Rainbow");
}
