import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  int _age = 45;
  String _name = '刘备';
  List<String> _recentSuggest = List<String>()..add('sjz')..add('bj');
  get age => _age;

  get name => _name;
  get recentSuggest => _recentSuggest;

  void update(age, name) async {
    _age = age;
    _name = name;
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }

  void addQuery(query) {
    if (!_recentSuggest.contains(query)) {
      _recentSuggest.add(query);
      _recentSuggest = _recentSuggest;
    }
    notifyListeners();
  }

  UserModel of(context) => ScopedModel.of<UserModel>(context);
}
