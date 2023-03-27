
import 'package:flutter/material.dart';
import 'package:hive_sample/model/student_model.dart';

import '../widgets/edit_button.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({
    super.key,
    required this.data,
  });
  final StudentModel data;

  @override
  Widget build(BuildContext context) {
    List details = [data.name, data.age, data.place, data.number];
    List title = ['Name', 'Age', 'Place', 'Phone'];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 3,
          title: Text(data.name.toUpperCase()),
          actions: [
            EditButton(data: data),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const CircleAvatar(
              radius: 70,
              child: Icon(
                Icons.person,
                size: 120,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(40, 70, 0, 0),
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${title[index]}:  ${details[index]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                }),
                separatorBuilder: ((context, index) => const Divider()),
                itemCount: details.length,
              ),
            ),
          ],
        ));
  }
}
