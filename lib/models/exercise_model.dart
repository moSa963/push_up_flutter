import 'package:push_up_flutter/models/set_model.dart';

class ExerciseModel {
  String name;
  List<SetModel> sets;

  ExerciseModel({required this.name, this.sets = const []});
}
