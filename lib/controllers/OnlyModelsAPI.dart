import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/GetFurnitureInfoModel.dart';
import 'package:flutter_unity_widget_example/Provider/FurnitureProvider.dart';

import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class OnlyModelsAPI {
  BuildContext context;
  Dio dio = Dio();
  OnlyModelsAPI(this.context);

  getOnlyModels() async {
    String myurl = "${global.serveryurl}/models";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      GetFurnitureInfoModel model = GetFurnitureInfoModel.fromJson(response.data);
 Provider.of<FurniturProvider>(context,listen: false).setfurniture(model.models);
    } catch (e) {
      print('eng field ');
    }
  }
}
