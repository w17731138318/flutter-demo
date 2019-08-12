/**
 * Align 中 Alignment() 是按百分比定位的
 */
import 'package:flutter/material.dart';

class Week25 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Align(
        alignment: Alignment(0, 0), //百分比
        child: Text('Align'),
      ),
    );
  }
}
