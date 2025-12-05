import 'dart:convert';

List<Employee> employeeModelFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeModelToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  int id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    employeeName: json['employeeName'],
    employeeSalary: json['employeeSalary'],
    employeeAge: json['employeeAge'],
    profileImage: json['profileImage']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeName": employeeName,
    "employeeSalary": employeeSalary,
    "employeeAge": employeeAge,
    "profileImage": profileImage
  };
}
