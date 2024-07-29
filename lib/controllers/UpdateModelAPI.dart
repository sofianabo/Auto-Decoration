import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/IdModelModel.dart';
import 'package:flutter_unity_widget_example/Provider/IdModelProvider.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;

class UpdateModelAPI{
  BuildContext context;
  UpdateModelAPI(this.context);
  Dio dio = Dio();
  UpdateModel(int id,double scale)async{

    String myurl = "${global.serveryurl}/updateModel";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.post(
        myurl,
        data: {
          "id":id,
          "scale":scale
        },
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      IdModelModel model =IdModelModel.fromJson(response.data);
      Provider.of<IdModelProvider>(context,listen: false).setIdModel(model);
    } catch (e) {
      print('eng field ');
    }

  }

}