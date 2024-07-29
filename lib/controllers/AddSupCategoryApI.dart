import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class addSubAPI {
  addSubAPI(this.context);
  BuildContext context;
  Dio dio = Dio();
  addsup(String categname, String namesub) async {
    String myurl = "${global.serveryurl}/addSupCategory";
    String token = Provider.of<UserInfoProvider>(context, listen: false).token;
    print(token);
    try {
      var response = await dio.post(myurl,
          data: {'supName': namesub, 'name': categname},
          options: Options(headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }
}
