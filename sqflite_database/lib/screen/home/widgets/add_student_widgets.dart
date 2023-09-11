// import 'package:database_flutter/db/function/db_functions.dart';
// import 'package:database_flutter/db/model/data_model.dart';
import 'package:flutter/material.dart';

import '../../../db/function/db_functions.dart';
import '../../../db/model/data_model.dart';

class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({Key? key}) : super(key: key);

  final _addStudentName = TextEditingController();
  final _addStudentAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _addStudentName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Student Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _addStudentAge,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter age'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: onAddStudentBtnClicked,
                icon: const Icon(Icons.add),
                label: const Text('Add Student'))
          ],
        ),
      ),
    );
  }

  void onAddStudentBtnClicked() {
    final name = _addStudentName.text.trim();
    final age = _addStudentAge.text.trim();
    if (name.isEmpty || age.isEmpty) {
      return;
    }
    // print('$name and  age');

    final student = StudentModel(name: name, age: age);
    addStudent(student);
  }
}
