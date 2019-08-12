/**
 * 等待数据
 * StreamBuilder
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/data/user.dart';

class Week14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: count(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData)
                return Center(
                    child: Text(
                  "等待数据",
                  style: TextStyle(fontSize: 24),
                ));
              return Center(
                child: Text('${snapshot.data}', style: TextStyle(fontSize: 24)),
              );
            }),
      ),
    );
  }

  Stream<User> count() async* {
    print(111);
    int i = 0;
    while (i < 100) {
      await Future.delayed(Duration(seconds: 1));
      i++;
      yield User('王伟欣', '男', i++);
    }
  }
}
