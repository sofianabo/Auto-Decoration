// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/EngneersModel.dart';

class EngProvider extends ChangeNotifier {
  List<User> englist = [];
  bool state = false;
  String massage = '';

  setengneers(Engmodel model) {
    englist.clear();
    state = model.stat;
    massage = model.massage;
    englist = model.user;
    notifyListeners();
  }
}
