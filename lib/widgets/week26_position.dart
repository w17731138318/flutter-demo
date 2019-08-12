/**
 * Positioned()用在Stack()组件中
 * Positioned组件的属性
 * bottom: 距离层叠组件下边的距离
 * left：距离层叠组件左边的距离
 * top：距离层叠组件上边的距离
 * right：距离层叠组件右边的距离
 * width: 层叠定位组件的宽度
 * height: 层叠定位组件的高度
 */
import 'package:flutter/material.dart';

class Week26 extends StatelessWidget {
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
          color: Colors.yellow,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                left: -100,
                top: -100,
                child: FlutterLogo(
                  size: 100,
                  colors: Colors.amber,
                ),
              ),
              Positioned(
                child: Text('原始的position在左上角'),
              ),
              Positioned.fill(
                child: FlutterLogo(
                  colors: Colors.teal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
