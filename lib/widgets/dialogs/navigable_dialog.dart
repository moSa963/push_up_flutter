import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/dialogs/base_dialog.dart';
import 'package:push_up_flutter/widgets/dialogs/dialog_button.dart';

class NavigableDialog extends StatefulWidget {
  const NavigableDialog({super.key, this.actions, required this.builder});
  final List<DialogButton>? actions;
  final Widget Function(
    Function(Widget widget, List<DialogButton> actions) push,
    Function() pop,
  )
  builder;

  @override
  State<NavigableDialog> createState() => _NavigableDialogState();
}

class _NavigableDialogState extends State<NavigableDialog>
    with SingleTickerProviderStateMixin {
  final List<(Widget, List<DialogButton>)> widgets = [];
  late AnimationController controller;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController.unbounded(
          vsync: this,
          value: 0.0,
          duration: const Duration(milliseconds: 200),
        )..addListener(() {
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      actions: [
        DialogButton(
          onPressed: () => _pop(context),
          color: const Color.fromARGB(255, 146, 89, 89),
          child: _count > 0 ? Icon(Icons.arrow_back) : Icon(Icons.close),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:
                (_count > 0 ? widgets[_count - 1].$2 : widget.actions) ?? [],
          ),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          return Stack(
            children: [
              Positioned(
                top: 0,
                width: width,
                bottom: 0,
                left: -(width * controller.value),
                child: widget.builder(_push, () => _pop(context)),
              ),
              for (int i = 0; i < widgets.length; ++i)
                Positioned(
                  key: Key("value$i"),
                  top: 0,
                  width: width,
                  bottom: 0,
                  left: ((i + 1) * width) - (width * controller.value),
                  child: widgets[i].$1,
                ),
            ],
          );
        },
      ),
    );
  }

  void _push(Widget widget, List<DialogButton> actions) {
    widgets.add((widget, actions));
    ++_count;
    controller.animateTo(_count.toDouble());
  }

  void _pop(BuildContext context) {
    if (widgets.isEmpty) {
      return Navigator.pop(context);
    }
    widgets.removeLast();

    --_count;
    controller.animateBack(_count.toDouble());
  }
}
