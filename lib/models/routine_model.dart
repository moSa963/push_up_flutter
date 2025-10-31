import 'package:push_up_flutter/models/exercise_model.dart';

class RoutineModel {
  String name;

  List<ExerciseModel> exercises;

  RoutineModel({required this.name, this.exercises = const []});
}
