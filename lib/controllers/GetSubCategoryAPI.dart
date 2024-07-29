import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/SubCategoryModel.dart';
import 'package:flutter_unity_widget_example/Provider/SubCategoryprovider.dart';

import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class GetSubCategoryAPI {
  BuildContext context;
  Dio dio = Dio();
  GetSubCategoryAPI(this.context);

  getsubcategory(String namecategory) async {
    String myurl = "${global.serveryurl}/show_supCategory/$namecategory";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      SubCategoryModel model = SubCategoryModel.fromJson(response.data);
      Provider.of<SubCategoryProvider>(context, listen: false)
          .setsub(model.supCategory);
    } catch (e) {
      print('eng field ');
    }
  }
}
