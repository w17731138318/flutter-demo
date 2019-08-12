/**
 * BackdropFilter 可以用来 模糊照片
 */
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class Week24 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/myimage.jpg'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}
