/*
 * PageView 能够作出可以翻页的 page
 * 需要一个 pageController 来控制
 * 也可以指定initPage来控制最初显示的page页面
 */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Week9 extends StatefulWidget {
  @override
  _Week9State createState() => _Week9State();
}

class _Week9State extends State<Week9> with SingleTickerProviderStateMixin {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal, // vertical 垂直翻译 横向翻页
        reverse: false, // 是否反向翻页
        pageSnapping: true, // 页面对齐
        dragStartBehavior: DragStartBehavior.start,
        controller: _controller,
        children: <Widget>[
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.pinkAccent,
          ),
          Container(
            color: Colors.greenAccent,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
