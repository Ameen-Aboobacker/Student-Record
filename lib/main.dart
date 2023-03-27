
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_sample/provider/student_provider.dart';
import 'package:hive_sample/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'model/student_model.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(
      StudentModelAdapter(),
    );
  }
  await Hive.openBox<StudentModel>("student_db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => StudentProvider(),
      child: MaterialApp(
        title: 'Student Record',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const HomeScreen(),
      ),
    );
  }
}

