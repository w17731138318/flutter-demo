import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/data/router.dart';
import 'package:flutter_widget_of_the_week/sqflite_demo/data_page.dart';
import 'package:flutter_widget_of_the_week/sqflite_demo/sqflite_test.dart';
import 'package:flutter_widget_of_the_week/widgets/week10_table.dart';
import 'package:flutter_widget_of_the_week/widgets/week11_sliver_app_bar.dart';
import 'package:flutter_widget_of_the_week/widgets/week12_sliver_list_grid.dart';
import 'package:flutter_widget_of_the_week/widgets/week13_fade_in_image.dart';
import 'package:flutter_widget_of_the_week/widgets/week14_stream_builder.dart';
import 'package:flutter_widget_of_the_week/widgets/week15_inherited_model.dart';
import 'package:flutter_widget_of_the_week/widgets/week16_clip_r_rect.dart';
import 'package:flutter_widget_of_the_week/widgets/week17_hero.dart';
import 'package:flutter_widget_of_the_week/widgets/week18_custom_paint.dart';
import 'package:flutter_widget_of_the_week/widgets/week19_tooltip.dart';
import 'package:flutter_widget_of_the_week/widgets/week20_fitted_box.dart';
import 'package:flutter_widget_of_the_week/widgets/week21_layout_builder.dart';
import 'package:flutter_widget_of_the_week/widgets/week22_absorb_pointer.dart';
import 'package:flutter_widget_of_the_week/widgets/week23_transform.dart';
import 'package:flutter_widget_of_the_week/widgets/week24_back_drop_filter.dart';
import 'package:flutter_widget_of_the_week/widgets/week25_align.dart';
import 'package:flutter_widget_of_the_week/widgets/week26_position.dart';
import 'package:flutter_widget_of_the_week/widgets/week27_animated_builder.dart';
import 'package:flutter_widget_of_the_week/widgets/week28_dismissible.dart';
import 'package:flutter_widget_of_the_week/widgets/week29_sizedbox.dart';
import 'package:flutter_widget_of_the_week/widgets/week30_value_listenable_builder.dart';
import 'package:flutter_widget_of_the_week/widgets/week6_future_builder.dart';
import 'package:flutter_widget_of_the_week/widgets/week7_fade_transition.dart';
import 'package:flutter_widget_of_the_week/widgets/week8_floating_action_button.dart';
import 'package:flutter_widget_of_the_week/widgets/week9_page_view.dart';
import 'package:scoped_model/scoped_model.dart';

import 'animation/animated_container.dart';
import 'utils/model/user_model.dart';
import 'utils/scoped_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //创建顶层状态
  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: userModel,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter组件'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller;
  List<Router> routers;
  @override
  void initState() {
    super.initState();
    routers = List<Router>();
    routers.add(Router('week6', Week6()));
    routers.add(Router('week7', Week7()));
    routers.add(Router('Week8', Week8()));
    routers.add(Router('Week9', Week9()));
    routers.add(Router('Week10', Week10()));
    routers.add(Router('Week11', Week11()));
    routers.add(Router('Week12', Week12()));
    routers.add(Router('Week13', Week13()));
    routers.add(Router('Week14', Week14()));
    routers.add(Router('Week15', Week15()));
    routers.add(Router('Week16', Week16()));
    routers.add(Router('Week17', Week17()));
    routers.add(Router('Week18', Week18()));
    routers.add(Router('Week19', Week19()));
    routers.add(Router('Week20', Week20()));
    routers.add(Router('Week21', Week21()));
    routers.add(Router('Week22', Week22()));
    routers.add(Router('Week23', Week23()));
    routers.add(Router('Week24', Week24()));
    routers.add(Router('Week25', Week25()));
    routers.add(Router('Week26', Week26()));
    routers.add(Router('Week27', Week27()));
    routers.add(Router('Week28', Week28()));
    routers.add(Router('Week29', Week29()));
    routers.add(Router('Week30', Week30()));
    routers.add(Router('AnimatedContainer', AnimatedContainerDemo()));
    routers.add(Router('ScopedDemo', ScopedDemo()));
    routers.add(Router('SqflitePage', SqflitePage()));
    routers.add(Router('DataAppPage', DataAppPage()));
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          controller: _controller,
          itemCount: routers.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: ListTile(
                title: Text(routers[index].name, style: TextStyle(fontSize: 24.0)),
                trailing: Icon(Icons.chevron_right),
                onTap: () => _navigatePage(context, routers[index]),
              ),
            );
          }),
    );
  }

  _navigatePage(context, Router router) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return router.page;
    }));
  }
}
