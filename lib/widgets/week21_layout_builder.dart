/**
 * LayoutBuilder
 * 可以获取父级器的 BoxConstraints 属性
 */
import 'package:flutter/material.dart';

class Week21 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Center(
        child: Container(
          width: 390,
          height: 676,
          alignment: Alignment.topCenter,
          child: LayoutBuilder(builder: (context, constraints) {
            print(constraints.maxWidth);
            print(constraints.maxHeight);
            print(constraints.biggest);
            if (constraints.maxWidth <= 388) {
              return ListView.builder(
                itemBuilder: (context, index) => Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Text('$index'),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(width: 1.0, color: Colors.purpleAccent),
                  ),
                ),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                  alignment: Alignment.center,
                  child: Text('$index'),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(width: 1.0, color: Colors.lightBlue),
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
