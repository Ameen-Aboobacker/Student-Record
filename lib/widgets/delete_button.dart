
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../screens/screen_update.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx1) => AlertDialog(
            title: const Text('Delete'),
            content: const Text('Do you want to delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Provider.of<StudentProvider>(context, listen: false)
                        .deletestudent(index);
                    Navigator.pop(context);
                    snackBar(
                        context: context, message: 'Deleted Successflully');
                  },
                  child: const Text('Yes')),
              TextButton(
                onPressed: () => Navigator.pop(ctx1),
                child: const Text('No'),
              )
            ],
          ),
        );
      },
      icon: const Icon(Icons.delete,color: Colors.red,),
    );
  }
}
