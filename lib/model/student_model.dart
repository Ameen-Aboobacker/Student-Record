import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
   String name;
  @HiveField(2)
   String age;
  @HiveField(3)
   String place;
  @HiveField(4)
   String number;
  @HiveField(5)
   String image;
  StudentModel({
     this.id,
    required this.name,
    required this.age,
    required this.place,
    required this.number,
    required this.image,
  });
}
