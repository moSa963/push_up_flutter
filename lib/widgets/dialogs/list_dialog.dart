import 'package:flutter/material.dart';
import 'package:push_up_flutter/widgets/flat_button.dart';

class ListDialog extends StatelessWidget {
  const ListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.9,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Container(
                color: Colors.black26,
                height: 50,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("exits"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: ListView(children: [

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
