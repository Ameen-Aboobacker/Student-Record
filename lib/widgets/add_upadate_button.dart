import 'package:flutter/material.dart';
import 'package:student_record/model/student_model.dart';
import 'package:student_record/widgets/snackbar.dart';
import 'package:provider/provider.dart';

import '../provider/student_provider.dart';

class AddUpdateButton extends StatelessWidget {
  const AddUpdateButton({
    super.key,
    required this.formValidateKey,
    required this.action,
    required this.id,
    required this.nameController,
    required this.ageController,
    required this.placeController,
    required this.phoneController,
    required this.message,
    required this.imgPath,
  });

  final GlobalKey<FormState> formValidateKey;
  final String action;
  final int id;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController placeController;
  final TextEditingController phoneController;
  final String message;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      ),
      onPressed: () {
      if (formValidateKey.currentState!.validate()) {
        if (action == 'Update') {
          final student = StudentModel(
            id: id,
            image:imgPath,
            name: nameController.text,
            age: ageController.text,
            place: placeController.text,
            number: phoneController.text,
          );
          Provider.of<StudentProvider>(context, listen: false)
              .updateStudent(student.id!, student);
          Navigator.pop(context);
          snackBar(context: context, message: message);
        }

        if (action == 'Add') {
          final studentadd = StudentModel(
            id: id,
            image: imgPath,
            name: nameController.text,
            age: ageController.text,
            place: placeController.text,
            number: phoneController.text,
          );
          Provider.of<StudentProvider>(context, listen: false)
              .addStudent(studentadd);
          Navigator.pop(context);
          snackBar(context: context, message: message);
        }
      }
    },
      child: Text(action),
    );
  }
}