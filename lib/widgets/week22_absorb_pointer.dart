/**
 * AbsorbPointer 要想阻止子控件接收到触摸事件有很多实现方式
 */
import 'package:flutter/material.dart';

class Week22 extends StatelessWidget {
  Color hightLightChanged = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const RaisedButton(
              onPressed: null,
              child: Text(
                '按钮1',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            AbsorbPointer(
              absorbing: true,
              ignoringSemantics: true,
              child: RaisedButton(
                hoverColor: Colors.purpleAccent,
                onPressed: () {
                  print(2);
                },
                child: const Text('按钮2', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () => this.tapped(),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('按钮3', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: AbsorbPointer(
        absorbing: true,
        ignoringSemantics: false,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const RaisedButton(
                onPressed: null,
                child: Text(
                  '按钮1',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                hoverColor: Colors.purpleAccent,
                onPressed: () {
                  print(2);
                },
                child: const Text('按钮2', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () => this.tapped(),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('按钮3', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tapped() {
    print(3);
  }
}
