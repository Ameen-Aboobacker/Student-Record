
import 'package:flutter/material.dart';
import 'package:hive_sample/screens/screen_update.dart';
import 'package:hive_sample/screens/search_screen.dart';
import 'package:provider/provider.dart';

import '../provider/student_provider.dart';
import '../widgets/student_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<StudentProvider>().getAllStudents();
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Record'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchScreen(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Consumer<StudentProvider>(
        builder: (context, value, _) {
          return value.studentDB.isEmpty
              ? const Center(child: Text("No data found"))
              : const StudentList();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InputStudent(action: 'Add', message: 'Student Details Added Successfully'),
            ),
          );
        },
        icon: const Icon(
          Icons.person_add_alt_1,
          size: 30,
        ),
        label: const Text('   Add\nStudent'),
      ),
    );
  }
}    
