import 'package:flutter/material.dart';
import 'package:push_up_flutter/pages/home_page/routine_buttons.dart';
import 'package:push_up_flutter/widgets/ListView/list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "list", icon: Icon(Icons.list)),
          BottomNavigationBarItem(
            label: "settings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: ListView(
          children: [
            RoutineButtons(),
            SizedBox(height: 10),
            MainListView(children: [

              ],
            ),
          ],
        ),
      ),
    );
  }
}
