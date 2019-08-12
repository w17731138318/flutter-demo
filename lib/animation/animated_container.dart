import 'dart:async';

/**
 * AnimationContainer使用要点
 * 必须传入Duration告诉动画的播放时间
 * 当animationContainer接收到一个新的值的时候
 * 会根据老值进行补间动画
 * 例如开始宽高为100，然后给了新值0并setState后
 * AnimationContainer会让宽高从100逐渐变化到0
 * 其中变化曲线由Curve决定，默认为Curves.linear
 */
import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/widgets/week12_sliver_list_grid.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double _value = 255.0;

  _changeValue() {
    setState(() {
      _value = 0.1;
    });
  }

  Timer timer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
    timer = new Timer(const Duration(milliseconds: 2000), () {
      try {
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Week12()));
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.amber,
          ),
          Center(
            child: ScaleTransition(
              scale: animation,
              child: RotationTransition(
                turns: animation,
                child: FlutterLogo(size: _value),
              ),
            ),
          )
        ],
      ),
    );
  }
}
