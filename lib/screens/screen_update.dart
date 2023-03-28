import 'package:flutter/material.dart';
import 'package:student_record/widgets/add_upadate_button.dart';
import 'package:provider/provider.dart';

import '../provider/student_provider.dart';
import 'package:student_record/widgets/text_field.dart';

class InputStudent extends StatelessWidget {
  InputStudent({
    super.key,
    this.name = '',
    this.age = '',
    this.place = '',
    this.phone = '',
    this.id = -1,
    required this.action,
    required this.message, 
    this.image='',
  });
  final int id;
  final String name;
  final String age;
  final String place;
  final String phone;
  final String action;
  final String message;
  final String image;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final formValidateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String imgPath = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = name;
      ageController.text = age;
      placeController.text = place;
      phoneController.text = phone;
      imageController.text=image;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('$action Student'),
        centerTitle: true,
      ),
      body: Consumer<StudentProvider>(
        builder: (context, student, _) {
          imageController.text = student.imgName;
          imgPath = student.imgPath;
          return Form(
            key: formValidateKey,
            child: ListView(
              children: [
                TextFieldWidget(
                  controller: nameController,
                  labelText: "Name",
                  validateText: "Field Must be Fill",
                  keyType: TextInputType.name,
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
                Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              controller: imageController,
                              labelText: 'Click add image',
                              validateText: 'Add image',
                              keyType: TextInputType.none,
                            ),
                          ),
                          TextButton.icon(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 16,),
                              
                            ),
                            onPressed: () {
                              Provider.of<StudentProvider>(context,
                                      listen: false)
                                  .pickImagefrom();
                            },
                            icon: const Icon(Icons.photo_library),
                            label: const Text('add image'),
                          ),
                        ],
                      ),
                   
                Center(
                  child: AddUpdateButton(
                      formValidateKey: formValidateKey,
                      action: action,
                      id: id,
                      nameController: nameController,
                      ageController: ageController,
                      placeController: placeController,
                      phoneController: phoneController,
                      message: message,
                      imgPath: imgPath),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
