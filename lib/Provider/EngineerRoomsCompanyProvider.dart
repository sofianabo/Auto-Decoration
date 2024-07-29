import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/EngineerRoomsCompanyModel.dart';

class EnginnerRoomsCompanyProvider extends ChangeNotifier {
  List<Room> EngRoomsCompany = [];
  bool state = false;
  String message = '';

  setengRoomsCompany(List<Room> model) {
    EngRoomsCompany.clear();
    EngRoomsCompany = model;
    notifyListeners();
  }
}
