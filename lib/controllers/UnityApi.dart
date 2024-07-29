import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'api.dart' as global;

class GetUnityAPI {
  BuildContext context;
  Dio dio = Dio();
  GetUnityAPI(this.context);

  getUntiy(String bol,String modell) async {
    String myurl = "http://192.168.43.21:8000/unity";
    try {
      var response = await dio.post(
        myurl,
        data: {
          "add":bol,
          "data":modell
        },
      );

    } catch (e) {
      print('unity field ');
    }
  }
}
