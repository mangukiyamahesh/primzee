import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: GridView.builder(
            itemCount: 20,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                mainAxisExtent: 200),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.grey,
                child: Center(
                    child: Text(
                  '$index',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
              );
            },
          ),
        )
      ]),
    );
  }
}
