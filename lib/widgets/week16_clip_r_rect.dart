import 'package:flutter/material.dart';

class Week16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          clipBehavior: Clip.hardEdge,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
