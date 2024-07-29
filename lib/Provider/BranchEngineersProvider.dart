// ignore: file_names

import 'package:flutter/cupertino.dart';

import '../Model/BranchEngineersModel.dart';

class BranchEngineersProvider extends ChangeNotifier {
  List<User> branchengineeers = [];
  bool state = false;
  String message = '';

  getbranchengineers(List<User> model) {
    branchengineeers.clear();
    branchengineeers = model;
    notifyListeners();
  }
}
