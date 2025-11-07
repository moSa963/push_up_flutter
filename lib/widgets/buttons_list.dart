import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/flat_button.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({super.key, required this.title, required this.list});
  final String title;
  final List<FlatButton> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Text(
            title,
            textScaler: TextScaler.linear(1.2),
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
          Wrap(spacing: 5, children: list),
        ],
      ),
    );
  }
}
