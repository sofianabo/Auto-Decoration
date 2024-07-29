import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/SupCategoryOnlyModel.dart';

import '../Model/CategoryModel.dart';

class SupCategoryOnlyProvider extends ChangeNotifier {
  List<SupCategoryOnly> SupOnlyList = [];
  bool state = false;
  String message = '';

  setsuponly(List<SupCategoryOnly> model) {
    SupOnlyList.clear();
    SupOnlyList = model;
    notifyListeners();
  }
}
