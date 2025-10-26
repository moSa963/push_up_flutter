import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/buttons_list.dart';
import 'package:push_up_flutter/widgets/flat_button.dart';

class RoutineButtons extends StatelessWidget {
  const RoutineButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonList(
      title: "Add new routine",
      list: [
        FlatButton(
          onPressed: () {},
          child: Wrap(
            spacing: 2,
            children: [Icon(Icons.task), Text("create one")],
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 2,
            children: [Icon(Icons.diamond), Text("exists routines")],
          ),
        ),
      ],
    );
  }
}
