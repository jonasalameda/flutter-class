import 'dart:math' as Math;

void main() {
  // Task 1
  var circleArea = (int radius) {
    Math.pi * Math.pow(radius, 2);
  };
  var circleCircumference = (int radius) => 2 * Math.pi * radius;

  print("Task 1");
  print(circleArea(5));
  print(circleCircumference(5));

  // Task 2.b
  SuperBank bank1 = SuperBank("placeholder", 0, 0);
  SuperBank bank2 = SuperBank.namedBank("placeholder2");
  RBC bank3 = RBC(1, [], "test");
  RBC bank4 = RBC.newAccount(2, "placeholder3", 0, 0);

  print("Task 2");
  print(bank1);
  print(bank2);
  print(bank3);
  print(bank4);
  // task 3
  int calculate(int num1, int num2) => num1 + num2;
  print("Task 3");
  print(calculate(5, 2));
  // task 4
  Map<String, double> employees = <String, double>{};

  print("Task 4");
  employees["john"] = 50000;
  employees["smith"] = 45000;
  employees["jane"] = 65000;
  employees["humuhumunukunukuāpua'a"] = 100000;

  employees.forEach(
    (key, value) => print(value >= 50000 && value <= 75000 ? value : ""),
  );

  // task 5
  print("Task 5");
  List<int> nums = [1,2,3,4,4,4,4,5,6,7,8,9,343,777,434,1,4,5,];
  print(nums.lastIndexOf(1));
  nums.remove(6);
  nums.where((element) => element == 4).forEach((element) => print(element));

  List<String> words = ["stead", "books", "dread", "plead", "stops", "haste"];
  print(words.lastIndexOf("stead"));
  words.remove("dread");
  words.where((element) => element == "books").forEach((element) => print(element));
}

// Task 2.a
class SuperBank {
  String name;
  int dollars;
  int cents;

  SuperBank(this.name, this.dollars, this.cents);

  SuperBank.namedBank(this.name) : cents = 0, dollars = 0;
}

class RBC extends SuperBank {
  int accountId;
  List<int> invoiceNums;

  RBC(this.accountId, this.invoiceNums, String name) : super.namedBank(name);

  RBC.newAccount(this.accountId, super.name, super.dollars, super.cents)
    : invoiceNums = [];
}
