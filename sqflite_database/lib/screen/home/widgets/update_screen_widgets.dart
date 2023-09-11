import 'package:flutter/material.dart';
import '../../../db/function/db_functions.dart';
import '../../../db/model/data_model.dart';
// import '../model/data_model.dart'; // Import your data model here

class UpdateStudentScreen extends StatefulWidget {
  final StudentModel student;

  UpdateStudentScreen({required this.student});

  @override
  _UpdateStudentScreenState createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with the existing student data
    nameController.text = widget.student.name;
    ageController.text = widget.student.age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the student's information
                widget.student.name = nameController.text;
                widget.student.age = ageController.text;
                // Call the updateStudent function to update the database
                updateStudent(widget.student);
                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
