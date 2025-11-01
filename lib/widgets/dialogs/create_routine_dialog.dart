import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/dialogs/list_dialog.dart';

class CreateRoutineDialogs extends StatefulWidget {
  const CreateRoutineDialogs({super.key});

  @override
  State<CreateRoutineDialogs> createState() => _CreateRoutineDialogsState();
}

class _CreateRoutineDialogsState extends State<CreateRoutineDialogs> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListDialog(
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  gapPadding: 1,
                  borderSide: BorderSide(width: 1),
                ),
              ),
              onChanged: (text) {
                print(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
