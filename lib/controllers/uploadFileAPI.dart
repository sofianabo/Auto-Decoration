import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_unity_widget_example/Model/IdModelModel.dart';
import 'package:flutter_unity_widget_example/Provider/IdModelProvider.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;

class Uploadf {
  Uploadf(this.context);
  BuildContext context;

  var dio = Dio();
  uploadfile(String name ,double h,double w,double l,double price,String sup,String fa,bitdata,double scale) async {
    print("file: ");
    print(MultipartFile.fromBytes(bitdata));
    String token = Provider.of<UserInfoProvider>(context, listen: false).token;
    FormData formData = FormData.fromMap({
      'name': sup,
      'H':h,
      'W':w,
      'L':l,
      'path': await MultipartFile.fromBytes(bitdata, filename: name),
      'modelName': name,
      'price': price,
      'type':fa,
      'scale':scale
    });
    var response = await dio.post('${global.serveryurl}/addModel',
        data: formData,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    IdModelModel model =IdModelModel.fromJson(response.data);
    Provider.of<IdModelProvider>(context,listen: false).setIdModel(model);
    return response.statusCode;
  }
}
