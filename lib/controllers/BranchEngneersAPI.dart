import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/BranchEngineersModel.dart';
import 'package:flutter_unity_widget_example/Model/EngneersModel.dart';
import 'package:flutter_unity_widget_example/Provider/BranchEngineersProvider.dart';
import 'package:flutter_unity_widget_example/Provider/EngneersProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class BranchEngneersAPI {
  BuildContext context;
  Dio dio = Dio();
  BranchEngneersAPI(this.context);

  getBranchEngneers(String UserName) async {
    String myurl = "${global.serveryurl}/showUser_subCompany/$UserName";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      BranchEngineersModel model =BranchEngineersModel.fromJson(response.data);
      Provider.of<BranchEngineersProvider>(context,listen: false).getbranchengineers(model.user);
    } catch (e) {
      print('eng field ');
    }
  }
}
