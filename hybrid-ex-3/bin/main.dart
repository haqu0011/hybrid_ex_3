import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  // Method to sort the list by a specific field
  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main() {
  String jsonString = '''
  [
    {"first": "Steve", "last": "Griffith", "email": "griffis@algonquincollege.com"},
    {"first": "Adesh", "last": "Shah", "email": "shaha@algonquincollege.com"},
    {"first": "Tony", "last": "Davidson", "email": "davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  // Convert the JSON string to a List<Map<String, String>>
  List<dynamic> decodedJson = jsonDecode(jsonString);

  List<Map<String, String>> res =
      decodedJson.map((v) => Map<String, String>.from(v)).toList();

  // Create an instance of Students class
  Students students = Students(res);

  print("Original list:");
  students.output();

  students.sort("first");
  print("\nSorted by first:");
  students.output();

  students.plus({"first": "Sam", "last": "Ham", "email": "samham@gmail.com"});
  print("\nAfter adding a new student:");
  students.output();

  students.remove("first", "Alison");
  print("\nAfter removing Alison:");
  students.output();
}
