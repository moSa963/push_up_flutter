import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
  });
  final Function()? onPressed;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          foregroundColor: color,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
