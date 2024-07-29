import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class InputDimenssion {
  InputDimenssion(this.context);

  BuildContext context;
  Dio dio = Dio();
  InputDi(String color, int h, int w, int l) async {
    String myurl = "${global.serveryurl}/";

    try {
      var response = await dio.post(myurl,
          data: {"color": color, "hieght": h, "width": w, "length": l},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));

      return response.statusCode;
    } catch (e) {
      print('error dimenssion');
    }
  }
}
