import 'package:flutter/material.dart';

class Router {
  String name;
  Widget page;

  Router(this.name, this.page);

  @override
  String toString() {
    return 'Router{name: $name, page: $page}';
  }
}
