import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/utils/model/user_model.dart';
import 'package:flutter_widget_of_the_week/utils/under_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
//  静态获取model用法实例
  Model getModel(BuildContext context) {
    //1、直接使用of
    final userModel = ScopedModel.of<UserModel>(context);
    //2、使用UserModel中重写的of
    final userModel2 = UserModel().of(context);
    userModel.update(30, '李磊');
    userModel2.update(43, '关羽');
    return userModel;
    //    return userModel2;
  }

  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(milliseconds: 2000), () {
      final userModel = ScopedModel.of<UserModel>(context);
      userModel.update(43, '关羽');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('back'),
          ),
          body: Center(
            child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                return Text(
                  model.name + ':' + model.age.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return UnderScreen(
                  title: "Under Screen",
                );
              }));
            },
            child: Icon(Icons.forward),
          ),
        );
      },
    );
  }
}
