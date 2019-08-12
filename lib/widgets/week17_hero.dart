import 'package:flutter/material.dart';

class Week17 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SecondPage();
              }));
            },
            child: SizedBox(
              height: 200,
              width: 200,
              child: Hero(
                tag: 'myHero',
                child: Image.asset('assets/myimage.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Hero(
                tag: 'myHero',
                child: Image.asset('assets/myimage.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
