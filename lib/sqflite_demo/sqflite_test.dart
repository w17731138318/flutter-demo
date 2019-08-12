import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_of_the_week/sqflite_demo/model/main_item.dart';
import 'package:flutter_widget_of_the_week/sqflite_demo/raw_test_page.dart';
import 'package:flutter_widget_of_the_week/sqflite_demo/src/dev_utils.dart';
import 'package:flutter_widget_of_the_week/sqflite_demo/src/main_item_widget.dart';
import 'package:flutter_widget_of_the_week/sqflite_demo/todo_test_page.dart';
import 'package:sqflite/sqflite.dart';

const String testRawRoute = "/test/simple";
const String testOpenRoute = "/test/open";
const String testSlowRoute = "/test/slow";
const String testTypeRoute = "/test/type";
const String testBatchRoute = "/test/batch";
const String testTodoRoute = "/test/todo";
const String testExceptionRoute = "/test/exception";
const String testManualRoute = "/test/manual";
const String testExpRoute = "/test/exp";
const String testDeprecatedRoute = "/test/deprecated";

class SqflitePage extends StatefulWidget {
  @override
  _SqfliteState createState() => _SqfliteState();
}

class _SqfliteState extends State<SqflitePage> {
  var routes = <String, WidgetBuilder>{
    '/test': (BuildContext context) => SqfliteHomePage(),
    testRawRoute: (BuildContext context) => RawTestPage(),
//    testOpenRoute: (BuildContext context) => OpenTestPage(),
//    testSlowRoute: (BuildContext context) => SlowTestPage(),
    testTodoRoute: (BuildContext context) => TodoTestPage(),
//    testTypeRoute: (BuildContext context) => TypeTestPage(),
//    testManualRoute: (BuildContext context) => ManualTestPage(),
//    testBatchRoute: (BuildContext context) => BatchTestPage(),
//    testExceptionRoute: (BuildContext context) => ExceptionTestPage(),
//    testExpRoute: (BuildContext context) => ExpTestPage(),
//    testDeprecatedRoute: (BuildContext context) => DeprecatedTestPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sqflite Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SqfliteHomePage(title: 'Sqflite Demo Home Page'),
        routes: routes);
  }
}

class SqfliteHomePage extends StatefulWidget {
  SqfliteHomePage({Key key, this.title}) : super(key: key) {
    items.add(MainItem("Raw tests", "Raw SQLite operations", route: testRawRoute));
    items.add(MainItem("Open tests", "Open onCreate/onUpgrade/onDowngrade", route: testOpenRoute));
    items.add(MainItem("Type tests", "Test value types", route: testTypeRoute));
    items.add(MainItem("Batch tests", "Test batch operations", route: testBatchRoute));
    items.add(MainItem("Slow tests", "Lengthy operations", route: testSlowRoute));
    items.add(MainItem("Todo database example", "Simple Todo-like database usage example", route: testTodoRoute));
    items.add(MainItem("Exp tests", "Experimental and various tests", route: testExpRoute));
    items.add(MainItem("Exception tests", "Tests that trigger exceptions", route: testExceptionRoute));
    items.add(MainItem("Manual tests", "Tests that requires manual execution", route: testManualRoute));
    items.add(MainItem("Deprecated test", "Keeping some old tests for deprecated functionalities", route: testDeprecatedRoute));

    // Uncomment to view all logs
    //Sqflite.devSetDebugModeOn(true);
  }

  final List<MainItem> items = [];
  final String title;

  @override
  _SqfliteHomePageState createState() => _SqfliteHomePageState();
}

String _debugAutoStartRouteName;

String get debugAutoStartRouteName => _debugAutoStartRouteName;

/// Deprecated to avoid calls
@deprecated
set debugAutoStartRouteName(String routeName) => _debugAutoStartRouteName = routeName;

class _SqfliteHomePageState extends State<SqfliteHomePage> {
  String _platformVersion = 'Unknown';

  int get _itemCount => widget.items.length;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Sqflite.platformVersion;
    } on PlatformException {
      platformVersion = "Failed to get platform version";
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

    print("running on: " + _platformVersion);

    // Use it to auto start a test page
    if (debugAutoStartRouteName != null) {
      // only once

      // await Navigator.of(context).pushNamed(testExpRoute);
      // await Navigator.of(context).pushNamed(testRawRoute);
      var future = Navigator.of(context).pushNamed(debugAutoStartRouteName);
      // ignore: deprecated_member_use_from_same_package
      debugAutoStartRouteName = null;
      await future;
      // await Navigator.of(context).pushNamed(testExceptionRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Sqflite demo', textAlign: TextAlign.center)),
        ),
        body: ListView.builder(itemBuilder: _itemBuilder, itemCount: _itemCount));
  }

  //new Center(child: new Text('Running on: $_platformVersion\n')),

  Widget _itemBuilder(BuildContext context, int index) {
    return MainItemWidget(widget.items[index], (MainItem item) {
      Navigator.of(context).pushNamed(item.route);
    });
  }
}
