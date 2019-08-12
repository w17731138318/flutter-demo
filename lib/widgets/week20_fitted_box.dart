/**
 * FittedBox
 * BoxFit.contain 内部容器缩放 直到一边和外部容器相等
 * BoxFit.fill 内部容器拉伸或压缩
 * BoxFit.cover 内部容器缩放 直到最后一个边和外部容器相等
 * BoxFit.fitWidth 内部容器缩放 直到宽和外部容器相等
 * BoxFit.fitHeight 内部容器缩放 直到高和外部容器相等
 * BoxFit.none 内部容器不缩放
 * BoxFit.scaleDown 内部容器不缩放
 *
 */
import 'package:flutter/material.dart';

class Week20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: 100,
          width: 200,
          color: Colors.deepOrangeAccent,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerLeft,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
