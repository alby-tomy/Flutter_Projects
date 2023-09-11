import 'package:database_flutter/db/function/db_functions.dart';
import 'package:flutter/material.dart';

import '../../../db/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              trailing: IconButton(
                onPressed: () {
                  if (data.id != null) {
                    deleteStudent(data.id!);
                  } else {
                    print('Student id is null');
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.blueGrey,
                ),
              ),
              title: Text(data.name),
              subtitle: Text(data.age),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
