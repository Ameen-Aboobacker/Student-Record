
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_record/widgets/delete_button.dart';
import 'package:student_record/widgets/edit_button.dart';
import 'package:provider/provider.dart';

import '../provider/student_provider.dart';
import '../screens/screen_details.dart';

class StudentList extends StatelessWidget {
  const StudentList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(builder: (context, data, _) {
      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        itemBuilder: (context, index) {
          final studentinfo = StudentProvider.studentData[index];
          return ListTile(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => StudentDetails(data: studentinfo),
                ),
              );
            }),
            leading:   CircleAvatar(
              radius: 30,
             backgroundImage: FileImage(File(studentinfo.image)),
            ),
            title: Text(studentinfo.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                EditButton(data: studentinfo),
                DeleteButton(index: studentinfo.id!),
              ],
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: StudentProvider.studentData.length,
      );
    });
  }
}
