/**
 * Transform 变形 倾斜 梯形 旋转
 */
import 'dart:math';

import 'package:flutter/material.dart';

class Week23 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.lightBlueAccent,
              child: Transform.rotate(
                origin: Offset(100, 100),
                angle: pi / 4,
                child: Text(
                  'Transform.rotate1',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: Transform.scale(
                origin: Offset(-100, -200),
                scale: 0.8,
                child: Text(
                  'Transform.scale2',
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: Transform.translate(
                offset: Offset(100, -200),
                child: Text(
                  'Transform.translate3',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: Transform(
                transform: Matrix4.skew(-0.5, 0), // 字体倾斜
                child: Text(
                  'Matrix4.skew4',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 1)
                  ..rotateX(0.05), // 梯形
                alignment: FractionalOffset.center,
                child: Text(
                  'Matrix4.identity5',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
