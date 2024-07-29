import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Provider/userProvider.dart';
import 'api.dart' as global;

class ViewModelEngAPI {
  BuildContext context;
  ViewModelEngAPI({ this.context});
  Dio dio = new Dio();
  viewmodel(int modelID) async {
    String myurl = "${global.serveryurl}/";
    String token = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.post(myurl,
          data: {
            "modelid": modelID,
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $token'
          }));
      return response.statusCode;
    } catch (e) {
      print('selection faild');
    }
  }
}
