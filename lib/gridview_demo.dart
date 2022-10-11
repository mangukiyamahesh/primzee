import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 5),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey,
                  child: Center(
                      child: Text(
                    '${index + 1}',
                    style: TextStyle(fontSize: 20),
                  )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
