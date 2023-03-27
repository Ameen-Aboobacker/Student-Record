import 'package:flutter/material.dart';

void snackBar({required BuildContext context, required String message}) {
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
}