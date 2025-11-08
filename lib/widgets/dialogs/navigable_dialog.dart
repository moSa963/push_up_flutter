import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/dialogs/dialog_button.dart';

class NavigableDialog extends StatefulWidget {
  const NavigableDialog({super.key, this.actions, required this.builder});
  final List<DialogButton>? actions;
  final Widget Function(
    Future<T?>? Function<T extends Object?>(Route<T> push)? push,
    Function pop,
  )
  builder;

  @override
  State<NavigableDialog> createState() => _NavigableDialogState();
}

class _NavigableDialogState extends State<NavigableDialog> {
  final GlobalKey<NavigatorState> _innerNavigatorKey =
      GlobalKey<NavigatorState>();

  int _count = 0;

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
                        color: const Color.fromARGB(255, 146, 89, 89),
                        child: _count > 0
                            ? Icon(Icons.arrow_back)
                            : Icon(Icons.close),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: widget.actions ?? [],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Navigator(
                    key: _innerNavigatorKey,
                    onGenerateRoute: (_) => MaterialPageRoute(
                      builder: (innerCtx) => Material(
                        color: const Color.fromARGB(0, 0, 0, 0),
                        child: widget.builder(_push, _handleClose),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<T?>? _push<T extends Object?>(Route<T> route) {
    setState(() {
      ++_count;
    });
    return _innerNavigatorKey.currentState?.push(route);
  }

  void _handleClose(BuildContext context) {
    if (_count > 0) {
      setState(() {
        --_count;
      });
      _innerNavigatorKey.currentState?.pop();
      return;
    }
    Navigator.pop(context);
  }
}
