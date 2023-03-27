

import 'package:flutter/material.dart';
import 'package:hive_sample/widgets/snackbar.dart';
import 'package:provider/provider.dart';

import '../model/student_model.dart';
import '../provider/student_provider.dart';
import 'package:hive_sample/widgets/text_field.dart';

class InputStudent extends StatelessWidget {
  InputStudent({
    super.key,
     this.name='',
     this.age='',
     this.place='',
     this.phone='',
     this.id=-1, 
     required this.action, 
     required this.message,
  });
  final int id;
  final String name;
  final String age;
  final String place;
  final String phone;
  final String action;
  final String message;
  
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController placeController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final formValidateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = name;
      ageController.text = age;
      placeController.text = place;
      phoneController.text = phone;
    });
    return Scaffold(
      appBar: AppBar(
        title:  Text('$action Student'),
        centerTitle: true,
      ),
      body: Form(
        key: formValidateKey,
        child: ListView(
          children: [
            TextFieldWidget(
              controller: nameController,
              labelText: "Name",
              validateText: "Field Must be Fill",
              keyType: TextInputType.name,
              isAlpha: true,
            ),
            TextFieldWidget(
              controller: ageController,
              labelText: 'Age',
              validateText: "Field Must be Fill",
              keyType: TextInputType.number,
              isAge: true,
              
            ),
            TextFieldWidget(
              controller: placeController,
              labelText: 'Place',
              validateText: "Field Must be Fill",
              keyType: TextInputType.emailAddress,
            ),
            TextFieldWidget(
              controller: phoneController,
              labelText: "Phone Number",
              validateText: "Field Must be Fill",
              keyType: TextInputType.number,
              isContact: true,
            ),
            Center(
              child: ElevatedButton(
                 style:ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),padding:const EdgeInsets.fromLTRB(40,0,40,0),),
                onPressed: () {
                  if (formValidateKey.currentState!.validate()) {
                    final student = StudentModel(
                      id:id,
                      name: nameController.text,
                      age: ageController.text,
                      place: placeController.text,
                      number: phoneController.text,
                    );
                    if(action=='Update'){
                      Provider.of<StudentProvider>(context, listen: false)
                        .updateStudent(student.id!, student);
                                          Navigator.pop(context);
                   snackBar(
                        context: context, message: message);
                    }
                    
                    if(action=='Add'){
                      Provider.of<StudentProvider>(context, listen: false)
                        .addStudent(student);
                                          Navigator.pop(context);
                    snackBar(
                        context: context, message: message);
                    }
            
                  }
                },
                child: Text(action),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*void snackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      width:double.infinity,
      behavior: SnackBarBehavior.floating,
    
      content: SizedBox(
        height: 20,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    ),
  );
}*/
