import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/AddBranch_EngneerModel.dart';

class add_BEProvider extends ChangeNotifier {
  setBEInfo(add_BEModel model) {
    model.user;
    notifyListeners();
  }
}
