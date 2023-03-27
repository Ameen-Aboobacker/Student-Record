
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String validateText;
  final String validateContact;
  final String validateAlpha;
    final String validateAge;
  final TextInputType keyType;
  final bool isContact;
  final bool isAlpha;
   final bool isAge;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validateText,
    this.validateAge='only digits allowed',
     this.validateContact='Number Must be 10 digits',
     this.validateAlpha='only Alphabets Allowed',
    required this.keyType,
    this.isContact = false,
    this.isAlpha=false,
    this.isAge=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyType,
        validator: (value) {
            if (value == null ||
              value.isEmpty ) {
            return validateText;
            
          }  else if(isContact && value.length != 10) {
            return validateContact;
          }
           else if(isAlpha) {
            return validateAlpha;
          }else if(isAge && value.length <= 2) {
            return validateAge;
          }
          else {
            return null;
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: labelText),
      ),
    );
  }
}
