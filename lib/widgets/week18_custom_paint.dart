/**
 * CustomPainter
 */
import 'package:flutter/material.dart';

class Week18 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 画笔 1
    final myGreenPaint = Paint()
      ..strokeWidth = 5
      ..color = Colors.green;

    /// 画笔 2
    final myRedAccentPaint = Paint()
      ..strokeWidth = 40
      ..color = Colors.redAccent;

    /// 画笔 3
    final myDeepOrangeAccentPaint = Paint()
      ..strokeWidth = 1
      ..color = Colors.deepOrangeAccent;

    /// Rect 方形
    final Rect rect = Rect.fromPoints(Offset(0, 0), Offset(100, 50));

    /// 半径
    final radius = 50.0;

    /// drawCircle 画圆 最底层
    canvas.drawCircle(Offset(-30, -30), radius, myDeepOrangeAccentPaint);

    /// drawLine 画线 第二层
    canvas.drawLine(Offset(-100, -100), Offset(100, 100), myGreenPaint);

    /// drawRect 画方形 第三层
    canvas.drawRect(rect, myRedAccentPaint);
//    canvas.drawImage(Image.asset('assets/myimage.jpg'), Offset(-80, -80), myGreenPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}
