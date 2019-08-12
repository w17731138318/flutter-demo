import 'package:flutter/material.dart';
import 'package:flutter_widget_of_the_week/utils/model/user_model.dart';
import 'package:flutter_widget_of_the_week/widget/asset.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchBar extends StatefulWidget {
  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.search), onPressed: () => showSearch(context: context, delegate: SearchBarDelegate()));
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => query = ""),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null),
    );
  }

  Model getModel(BuildContext context, query) {
    final userModel = ScopedModel.of<UserModel>(context);
    userModel.addQuery(query);
    return userModel;
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty && query.trim().length > 0) {
      getModel(context, query);
      return Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          child: Card(
            color: Colors.redAccent,
            child: Center(
              child: Text(
                query,
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Text(
          query.isNotEmpty && query.trim().length > 0 ? '没有找到任何数据' : '',
          style: TextStyle(color: Colors.deepOrange, decoration: TextDecoration.none),
        ),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final userModel = ScopedModel.of<UserModel>(context);
    final suggestionList = query.isEmpty ? userModel.recentSuggest : searchList.where((input) => input.startsWith(query)).toList();
    print(userModel.recentSuggest);
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              query = suggestionList[index];
              showResults(context);
            },
            title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
//    return ListView.builder(
//        itemCount: suggestionList.length,
//        itemBuilder: (context, index) => ListTile(
//              onTap: () {
//                addQuery(query);
//                query = suggestionList[index];
//                showResults(context);
//              },
//              title: RichText(
//                  text: TextSpan(
//                      text: suggestionList[index].substring(0, query.length),
//                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                      children: [TextSpan(text: suggestionList[index].substring(query.length), style: TextStyle(color: Colors.grey))])),
//            ));
  }
}
