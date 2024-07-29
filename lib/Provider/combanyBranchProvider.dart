import 'package:flutter/cupertino.dart';

import '../Model/CompanyBranchModel.dart';

class CBProvider extends ChangeNotifier {
  List<company> cblist = [];
  bool state = false;
  String message = '';

  setCBInfo(List<company> model) {
    cblist.clear();
    cblist = model;
    notifyListeners();
  }
}
