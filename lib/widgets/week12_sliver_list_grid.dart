import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/widget/search_bar.dart';

class Week12 extends StatefulWidget {
  @override
  _Week12State createState() => _Week12State();
}

class _Week12State extends State<Week12> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// SafeArea 解决流海问题
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          slivers: <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () => Navigator.pop(context),
              ),
              actions: <Widget>[
                SearchBar(),
              ],
              actionsIconTheme: IconThemeData(color: Colors.white, size: 30, opacity: 1),
              pinned: true,
              floating: true,
              snap: true,
              title: Text('SliverAppBar'),
              iconTheme: IconThemeData(color: Colors.white, size: 30, opacity: 1),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/myimage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _buildContainer(Colors.deepPurpleAccent),
                _buildContainer(Colors.yellow),
                _buildContainer(Colors.blue),
                _buildContainer(Colors.deepOrangeAccent),
                _buildContainer(Colors.pinkAccent),
              ]),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 10)],
                    child: Text(String.fromCharCode(index)),
                  );
                },
                childCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(Color color) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: color),
        height: 100,
        child: Text(
          'SliverList',
          style: TextStyle(decoration: TextDecoration.none, fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}
