import 'package:flutter/material.dart';
import '../model/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _db;
Future<void> initDatabase() async {
  _db = await openDatabase('student_table.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE student_table(id INTEGER PRIMARY KEY, NAME TEXT, AGE TEXT)');
  });
}

Future<void> addStudent(StudentModel value) async {
  _db.rawInsert('INSERT INTO student_table (name,age) VALUES (?,?)',
      [value.name, value.age]);

  getAllStudents();
}

Future<void> getAllStudents() async {
  final _values = await _db.rawQuery('SELECT * FROM student_table');
  // print('value : $_values');
  studentListNotifier.value.clear();

  _values.forEach((map) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  });
}

Future<void> deleteStudent(int id) async {
  try {
    await _db.rawDelete('DELETE FROM student_table WHERE id = ?', [id]);
    getAllStudents();
  } catch (e) {
    print('Error deleting student : $e');
  }
}

Future<void> updateStudent(StudentModel updatedStudent) async {
  try {
    await _db.rawUpdate(
        'UPDATE student_table SET name = ?, age = ? WHERE id = ?',
        [updatedStudent.name, updatedStudent.age, updatedStudent.id]);

    // Update the list of students after the update
    getAllStudents();
  } catch (e) {
    print('Error updating student: $e');
  }
}
