import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/GetFurnitureInfoModel.dart';
import 'package:flutter_unity_widget_example/Provider/FurnitureProvider.dart';

import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class GetFurnitureInfoAPI {
  BuildContext context;
  Dio dio = Dio();
  GetFurnitureInfoAPI(this.context);

  GetFurnitureInfo(String Supname) async {
    String myurl = "${global.serveryurl}/get_models/$Supname";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      GetFurnitureInfoModel mod = GetFurnitureInfoModel.fromJson(response.data);
       Provider.of<FurniturProvider>(context,listen: false).setfurniture(mod.models);
    } catch (e) {
      print('eng field ');
    }
  }
}
