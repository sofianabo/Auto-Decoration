import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/SupCategoryOnlyModel.dart';
import 'package:flutter_unity_widget_example/Provider/SupCategoryOnlyProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class SupCategoryOnlyAPI {
  BuildContext context;
  Dio dio = Dio();
  SupCategoryOnlyAPI(this.context);

  SupCategoryOnly() async {
    String myurl = "${global.serveryurl}/show_supCategory";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      SupCategoryOnlyModel model =SupCategoryOnlyModel.fromJson(response.data);
      Provider.of<SupCategoryOnlyProvider>(context,listen: false).setsuponly(model.supCategoryonly);
    } catch (e) {
      print('eng field ');
    }
  }
}
