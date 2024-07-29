import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/userInfo.dart';

class UserInfoProvider extends ChangeNotifier {
  String username = '';
  String email = '';
  String name = '';
  String address = '';
  String role = '';
  String token = '';
  setUserInfo(UserInfoModel model, String tokens) {

    var data = model.user;
    username = data.userName;
    name = data.name;
    email = data.email;
    address = data.address;
    role = data.roll;
    token = tokens;
    notifyListeners();
  }
}
