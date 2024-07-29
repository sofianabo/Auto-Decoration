import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/IdModelModel.dart';
import 'package:flutter_unity_widget_example/Model/userInfo.dart';

class IdModelProvider extends ChangeNotifier {
  int id = 0;

  setIdModel(IdModelModel model) {

    var data = model.id;

    notifyListeners();
  }
}
