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

class login {
  login(this.context);

  BuildContext context;
  Dio dio = Dio();
  loginn(String email, String password) async {
    String myurl = "${global.serveryurl}/auth/login";

    try {
      var response = await dio.post(myurl,
          data: {
            "userName": email,
            "password": password,
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));
      UserInfoModel user = UserInfoModel.fromJson(response.data);
      Provider.of<UserInfoProvider>(context, listen: false)
          .setUserInfo(user, user.token);
      if(response.statusCode==200) {
        if (Provider
            .of<UserInfoProvider>(context, listen: false)
            .role == 'engineer')
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoomInformations()));
        else {
          GetCategoryAPI(context).getcategory();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainScreen()));
        }
      }

      return response.statusCode;

    } catch (e) {
      print('Login field');
    }

  }

  register(String username, String name, String email, String address,
      String password) async {
    String myurl = "${global.serveryurl}/auth/register";

    try {
      var response = await dio.post(myurl,
          data: {
            "userName": username,
            "name": name,
            "email": email,
            "password": password,
            "address": address
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));
      UserInfoModel user = UserInfoModel.fromJson(response.data);
      // ignore: use_build_context_synchronously
      Provider.of<UserInfoProvider>(context, listen: false)
          .setUserInfo(user, user.token);
      GetCategoryAPI(context).getcategory();

      return response.statusCode;
    } catch (e) {
      print('re field');
    }
  }
}
