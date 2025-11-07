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
    return ListDialog(
      child: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Title',
              border: InputBorder.none,
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),

            onChanged: (text) {
              print(text);
            },
          ),
        ],
      ),
    );
  }
}
