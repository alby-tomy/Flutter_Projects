class StudentModel {
  int? id;

  late String name;

  late String age;

  StudentModel({required this.name, required this.age, this.id});

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['NAME'] as String; //check the query
    final age = map['AGE'] as String; //check the query
    // print(map['age']);

    // if (name != null && age != null) {
    return StudentModel(id: id, name: name, age: age);
    // } else {
    // throw Exception("Invalid map data: name or age is null");
    //   }
  }
}
