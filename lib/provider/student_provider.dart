
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/student_model.dart';

class StudentProvider with ChangeNotifier {
  static List<StudentModel> studentData = [];
  final studentDB = Hive.box<StudentModel>('student_db');

  Future<void> addStudent(StudentModel model) async {
    final key = await studentDB.add(model);
    model.id = key;
    studentDB.put(key, model);
    studentData.add(model);
    notifyListeners();
  }

  Future<void> getAllStudents() async {
    studentData.clear();
    studentData.addAll(studentDB.values);
    notifyListeners();
  }

  deletestudent(int id) async {
    await studentDB.delete(id);
    studentData.removeWhere((student) => student.id == id);
    getAllStudents();
  }

  updateStudent(int id, StudentModel model) async {
    await studentDB.put(id, model);
    await getAllStudents();
  }
}
