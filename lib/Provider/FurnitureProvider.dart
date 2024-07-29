import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/GetFurnitureInfoModel.dart';

class FurniturProvider extends ChangeNotifier {
  List<Models> FurnitureList = [];
  bool state = false;
  String message = '';

  setfurniture(List<Models> model) {
    FurnitureList.clear();
    FurnitureList = model;
    notifyListeners();
  }
}
