import 'package:flutter/material.dart';
import 'package:sqflite_database/screen/home/widgets/add_student_widgets.dart';
import 'package:sqflite_database/screen/home/widgets/list_student_details.dart';

import '../../db/function/db_functions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ScreenAddStudent(),
            const Expanded(child: ListStudentWidget())
          ],
        ),
      ),
    );
  }
}
