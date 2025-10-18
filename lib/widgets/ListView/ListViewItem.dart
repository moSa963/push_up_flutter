import 'package:flutter/material.dart';

class MainListViewItem extends StatelessWidget {
  const MainListViewItem({
    super.key,
    required this.child,
    this.first = false,
    this.last = false,
  });
  final bool first;
  final bool last;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final firstRad = first ? Radius.circular(1) : Radius.zero;
    final lastRad = last ? Radius.circular(1) : Radius.zero;

    return Container(
      color: Theme.of(context).cardColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: firstRad,
          topRight: firstRad,
          bottomLeft: lastRad,
          bottomRight: lastRad,
        ),
      ),
      child: child,
    );
  }
}
