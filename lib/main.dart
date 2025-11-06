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
  surfaceContainer: Color.fromARGB(255, 230, 230, 230),
  surfaceContainerHigh: Color.fromARGB(255, 220, 220, 220),
  surfaceContainerHighest: Color.fromARGB(255, 210, 210, 210),
);

final darkColors = ColorScheme.dark(
  surfaceContainerLowest: Color.fromARGB(255, 0, 0, 0),
  surfaceContainerLow: Color.fromARGB(255, 2, 2, 2),
  surface: Color.fromARGB(255, 5, 5, 5),
  surfaceContainer: Color.fromARGB(255, 12, 12, 12),
  surfaceContainerHigh: Color.fromARGB(255, 20, 20, 20),
  surfaceContainerHighest: Color.fromARGB(255, 25, 25, 25),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Up',
      theme: ThemeData(colorScheme: lightColor),
      darkTheme: ThemeData(colorScheme: darkColors),
      home: const HomePage(),
    );
  }
}
