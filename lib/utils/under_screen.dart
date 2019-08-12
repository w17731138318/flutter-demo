import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/utils/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class UnderScreen extends StatefulWidget {
  UnderScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UnderScreenState createState() => new _UnderScreenState();
}

class _UnderScreenState extends State<UnderScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                return Text(
                  model.name + ':' + model.age.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return FloatingActionButton(
            onPressed: () => model.update(41, '张飞'),
            tooltip: 'update',
            child: Icon(Icons.update),
          );
        },
      ),
    );
  }
}
