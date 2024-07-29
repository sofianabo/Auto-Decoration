import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Provider/userProvider.dart';
import 'api.dart' as global;

class ShowDesignsAPI {
  BuildContext context;
  ShowDesignsAPI({ this.context});
  Dio dio = new Dio();
  ShowDesigns(int modelid, int x, int y, int z) async {
    String myurl = "${global.serveryurl}/";
    String token = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.post(myurl,
          data: {"modelid": modelid, "x": x, "y": y, "z": z},
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
