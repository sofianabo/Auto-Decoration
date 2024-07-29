import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/Model/AddBranch_EngneerModel.dart';
import 'package:flutter_unity_widget_example/Provider/add_BEProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class AddBranch_Engneer {
  AddBranch_Engneer(this.context);
  BuildContext context;
  Dio dio = Dio();
  getaddBra_Eng(String username, String name, String email, String address,
      String password, String role) async {
    String myurl = "${global.serveryurl}/auth/register/company";
    String token = Provider.of<UserInfoProvider>(context, listen: false).token;
    print(token);
    try {
      var response = await dio.post(myurl,
          data: {
            "userName": username,
            "name": name,
            "email": email,
            "password": password,
            "address": address,
            "roll": role
          },
          options: Options(headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      add_BEModel user = add_BEModel.fromJson(response.data);
      Provider.of<add_BEProvider>(context, listen: false).setBEInfo(user);

      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }
}
