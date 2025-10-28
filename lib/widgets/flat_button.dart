import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  const FlatButton({super.key, required this.onPressed, required this.child});

  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withAlpha(100),
        ),
      ),
      child: child,
    );
  }
}
