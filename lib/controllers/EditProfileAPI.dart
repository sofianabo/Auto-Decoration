import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/Model/userInfo.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/controllers/GetCategoryAPI.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/roominformations.dart';
import 'package:flutter_unity_widget_example/screens/mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'api.dart' as global;

class EditProfileAPI {
  EditProfileAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  EditProfile(String name, String email,String address,String password) async {
    String myurl = "${global.serveryurl}/update";
  String token= Provider.of<UserInfoProvider>(context,listen: false).token;
    try {
      var response = await dio.post(myurl,
          data: {
            "name": name,
            "email": email,
            "address":address,
            "password":password
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $token'
          }));
      UserInfoModel model = UserInfoModel.fromJson(response.data);
      Provider.of<UserInfoProvider>(context,listen: false).setUserInfo(model, token);

    } catch (e) {
      print('Login field');
    }

  }}