import 'package:flutter/material.dart';
import 'package:push_up_flutter/models/routine_model.dart';
import 'package:push_up_flutter/widgets/dialogs/dialog_button.dart';
import 'package:push_up_flutter/widgets/dialogs/navigable_dialog.dart';
import 'package:push_up_flutter/widgets/exercise_form.dart';

class CreateRoutineDialogs extends StatefulWidget {
  const CreateRoutineDialogs({super.key});

  @override
  State<CreateRoutineDialogs> createState() => _CreateRoutineDialogsState();
}

class _CreateRoutineDialogsState extends State<CreateRoutineDialogs> {
  final RoutineModel _routine = RoutineModel(name: "");
  final _key = ExerciseForm.globalKey;

  @override
  Widget build(BuildContext context) {
    return NavigableDialog(
      builder: (push, pop) {
        return ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'next one',
                labelStyle: TextStyle(color: Theme.of(context).hintColor),
                border: InputBorder.none,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
              ),
              onChanged: (value) {
                setState(() {
                  _routine.name = value;
                });
              },
            ),

            IconButton(
              onPressed: () => push(ExerciseForm(key: _key), [
                DialogButton(
                  onPressed: () {
                    final ex = _key.currentState?.exercise;

                    if (ex != null) {
                      _routine.exercises.add(ex);
                    }

                    pop();
                  },
                  child: Icon(Icons.check),
                ),
              ]),
              icon: Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
