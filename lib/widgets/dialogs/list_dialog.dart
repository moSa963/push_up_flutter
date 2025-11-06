import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/dialogs/dialog_button.dart';

class ListDialog extends StatelessWidget {
  const ListDialog({super.key, this.actions, required this.child});
  final List<DialogButton>? actions;
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
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      DialogButton(
                        onPressed: () => _handleClose(context),
                        color: Colors.redAccent,
                        child: Icon(Icons.close),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: actions ?? [],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleClose(BuildContext context) {
    Navigator.pop(context);
  }
}
