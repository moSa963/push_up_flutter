import 'package:flutter/material.dart';
import 'package:push_up_flutter/models/routine_model.dart';

class RoutineListItem extends StatelessWidget {
  const RoutineListItem({super.key, required this.routine});
  final RoutineModel routine;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(routine.name)]);
  }
}
