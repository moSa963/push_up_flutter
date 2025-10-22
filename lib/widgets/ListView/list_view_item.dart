import 'package:flutter/material.dart';

class MainListViewItem extends StatelessWidget {
  const MainListViewItem({
    super.key,
    required this.child,
    this.first = false,
    this.selected = false,
    this.onTap,
    this.last = false,
  });
  final bool first;
  final bool last;
  final bool selected;
  final Function(Widget child)? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final firstRad = first ? Radius.circular(10) : Radius.zero;
    final lastRad = last ? Radius.circular(10) : Radius.zero;

    return GestureDetector(
      onTap: () => onTap?.call(child),
      child: AnimatedContainer(
        duration: Durations.short3,
        padding: EdgeInsets.all(20),
        margin: selected ? EdgeInsets.only(top: 5, bottom: 5) : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Theme.of(context).splashColor.withAlpha(10),
          borderRadius: BorderRadius.only(
            topLeft: firstRad,
            topRight: firstRad,
            bottomLeft: lastRad,
            bottomRight: lastRad,
          ),
        ),
        child: child,
      ),
    );
  }
}
