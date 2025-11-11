import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key, required this.actions, required this.child});
  final List<Widget> actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(100, 0, 0, 0),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.90,
          heightFactor: 0.90,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            ),
            child: Column(
              children: [
                SizedBox(height: 50, child: Row(children: actions)),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
