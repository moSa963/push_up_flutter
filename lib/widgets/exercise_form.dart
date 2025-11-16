import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/counter.dart';

class ExerciseForm extends StatefulWidget {
  const ExerciseForm({super.key});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  double _counter = 0;

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
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 4),
          child: Container(
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Theme.of(context).hintColor),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sets: "),
                    Counter(
                      value: _counter,
                      onChange: (v) => setState(() {
                        _counter = v;
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
