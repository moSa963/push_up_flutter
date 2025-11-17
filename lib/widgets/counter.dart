import 'package:flutter/material.dart';

class Counter<T extends num> extends StatelessWidget {
  const Counter({
    super.key,
    required this.value,
    required this.onChange,
    this.max = 100,
    this.min = 0,
    this.step = 1,
    this.unit = "",
  });

  final T value;
  final num max;
  final num min;
  final num step;
  final String unit;
  final void Function(T val) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: [
        IconButton(
          onPressed: () => _handleChange(-step as T),
          icon: const Icon(Icons.remove),
        ),
        Text(value.toString()),
        Text(unit),
        IconButton(
          onPressed: () => _handleChange(_toT(step)),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  void _handleChange(T delta) {
    final num newValue = value + delta;

    if (newValue <= max && newValue >= min) {
      onChange(_toT(newValue));
    } else if (delta > 0 && value != max) {
      onChange(_toT(max));
    } else if (delta < 0 && value != min) {
      onChange(_toT(min));
    }
  }

  T _toT(num n) {
    if (value is int) {
      return n.toInt() as T;
    } else {
      final rounded = double.parse(n.toStringAsFixed(2));
      return rounded as T;
    }
  }
}
