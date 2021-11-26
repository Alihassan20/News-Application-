import 'package:flutter/cupertino.dart';
import 'package:news_app/server/news_api.dart';
import 'package:provider/provider.dart';

class ArticleListViewModel with ChangeNotifier {
  var _articaleList = [];
  var _articaleListByCategory = [];

  fetchArticale() async {
    _articaleList = await NewsApi().fetchArtical();
    print(_articaleList);
    notifyListeners();
  }

  fetchArticaleByCategory(category) async {
    _articaleListByCategory = await NewsApi().fetchArticalByCategory(category);
    notifyListeners();
  }


}
