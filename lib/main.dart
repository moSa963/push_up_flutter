import 'package:flutter/material.dart';
import 'package:push_up_flutter/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

final lightColor = ColorScheme.fromSeed(
  seedColor: Colors.indigoAccent,
  surfaceContainerLowest: Color.fromARGB(255, 255, 255, 255),
  surfaceContainerLow: Color.fromARGB(255, 245, 245, 245),
  surface: Color.fromARGB(255, 240, 240, 240),
  surfaceContainer: Color.fromARGB(255, 235, 235, 235),
  surfaceContainerHigh: Color.fromARGB(255, 230, 230, 230),
  surfaceContainerHighest: Color.fromARGB(255, 225, 225, 225),
);

final darkColors = ColorScheme.dark(
  surfaceContainerLowest: Color.fromARGB(255, 0, 0, 0),
  surfaceContainerLow: Color.fromARGB(255, 2, 2, 2),
  surface: Color.fromARGB(255, 5, 5, 5),
  surfaceContainer: Color.fromARGB(255, 8, 8, 8),
  surfaceContainerHigh: Color.fromARGB(255, 12, 12, 12),
  surfaceContainerHighest: Color.fromARGB(255, 15, 15, 15),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Up',
      theme: ThemeData(colorScheme: lightColor),
      home: const HomePage(),
    );
  }
}
