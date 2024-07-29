import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/CategoryModel.dart';
import 'package:flutter_unity_widget_example/Provider/CategoryProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class GetCategoryAPI {
  BuildContext context;
  Dio dio = Dio();
  GetCategoryAPI(this.context);

  getcategory() async {
    String myurl = "${global.serveryurl}/showCategory";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      categoryModl model = categoryModl.fromJson(response.data);
      Provider.of<CategoryProvider>(context, listen: false)
          .setcategory(model.gategory);
    } catch (e) {
      print('eng field ');
    }
  }
}
