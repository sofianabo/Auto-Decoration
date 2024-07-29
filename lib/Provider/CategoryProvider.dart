import 'package:flutter/cupertino.dart';

import '../Model/CategoryModel.dart';

class CategoryProvider extends ChangeNotifier {
  List<Gategory> categorylist = [];
  bool state = false;
  String message = '';

  setcategory(List<Gategory> model) {
    categorylist.clear();
    categorylist = model;
    notifyListeners();
  }
}
