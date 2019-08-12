/**
 * Tooltip
 */
import 'package:flutter/material.dart';

class Week19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Tooltip(
        message: '提示信息',
        verticalOffset: MediaQuery.of(context).size.height / 3,
        child: Scaffold(),
      ),
    );
  }
}
