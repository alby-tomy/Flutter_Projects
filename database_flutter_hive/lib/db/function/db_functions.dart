import 'package:database_flutter/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  // ignore: invalid_use_of_protected_member

  final studentDb = await Hive.openBox<StudentModel>('studentDb');
  final _id = await studentDb.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('studentDb');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDb = await Hive.openBox<StudentModel>('studentDb');
  await studentDb.delete(id);
  getAllStudents();
}

//call only when you need to clear all the data from db
Future<void> clearAllDataStudent() async {
  final studentBox = await Hive.openBox<StudentModel>('studentDb');
  await studentBox.clear();
  studentListNotifier.value
      .clear(); // Optionally, you can also clear your notifier list
  studentListNotifier.notifyListeners();
}
