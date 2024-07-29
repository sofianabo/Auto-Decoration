import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/SubCategoryModel.dart';

class SubCategoryProvider extends ChangeNotifier {
  List<SupCategory> subcatlist = [];
  bool state = false;
  String message = '';

  setsub(List<SupCategory> model) {
    subcatlist.clear();
    subcatlist = model;
    notifyListeners();
  }
}
