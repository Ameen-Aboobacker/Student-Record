
import 'package:flutter/material.dart';
import 'package:hive_sample/widgets/delete_button.dart';
import 'package:hive_sample/widgets/edit_button.dart';
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
            leading: const CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
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
