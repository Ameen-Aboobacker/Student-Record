
import 'package:flutter/material.dart';

import '../model/student_model.dart';
import '../screens/screen_update.dart';


class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.data,
  });
  final StudentModel data;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InputStudent(
              action:'Update',
              message:'Updated Successflully',
              id:data.id!,
              name: data.name,
              age: data.age,
              place: data.place,
              phone: data.number,
              image:data.image,
             
            ),
          ),
        );
      },
      icon: const Icon(Icons.edit,color:Colors.blue),
    );
  }
}
