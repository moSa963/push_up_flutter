import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/ListView/list_view_item.dart';

class MainListView extends StatefulWidget {
  const MainListView({super.key, required this.children});
  final List<Widget> children;

  @override
  State<MainListView> createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  Widget? _selected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < widget.children.length; ++i)
          MainListViewItem(
            onTap: (child) => setState(() {
              _selected = child;
            }),
            first: i == 0,
            selected: widget.children[i] == _selected,
            last: i == widget.children.length - 1,
            child: widget.children[i],
          ),
      ],
    );
  }
}
