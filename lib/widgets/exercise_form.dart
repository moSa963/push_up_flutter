import 'package:flutter/material.dart';
import 'package:push_up_flutter/models/exercise_model.dart';
import 'package:push_up_flutter/models/set_model.dart';
import 'package:push_up_flutter/widgets/flat_button.dart';
import 'package:push_up_flutter/widgets/set_card.dart';

class ExerciseForm extends StatefulWidget {
  const ExerciseForm({super.key});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  ExerciseModel exercise = ExerciseModel(name: "", sets: []);

  SetModel _set = SetModel(reps: 0, weight: 0);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          decoration: InputDecoration(
            filled: true,
            labelText: 'Exercise name',
            labelStyle: TextStyle(color: Theme.of(context).hintColor),
            border: InputBorder.none,
            fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          onChanged: (value) => exercise.name = value,
        ),
        SizedBox(height: 20),

        for (int i = 0; i < exercise.sets.length; ++i)
          SetCard(
            key: Key("setCard_$i"),
            model: exercise.sets[i],
            title: "Set ${i + 1}",
          ),

        SetCard(
          model: _set,
          onChange: (model) => setState(() {
            _set = model;
          }),
          defaultOpen: true,
          title: "New Set",
          child: FlatButton(onPressed: _handleNewSet, child: Text("ADD")),
        ),
      ],
    );
  }

  void _handleNewSet() {
    setState(() {
      exercise.sets.add(_set);
      _set = SetModel(reps: _set.reps, weight: _set.weight);
    });
  }
}
