import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/EngneersModel.dart';
import 'package:flutter_unity_widget_example/Provider/EngneersProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class EngAPI {
  BuildContext context;
  Dio dio = Dio();
  EngAPI(this.context);

  getEngneers() async {
    String myurl = "${global.serveryurl}/showUser";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      Engmodel model = Engmodel.fromJson(response.data);
      // ignore: use_build_context_synchronously
      Provider.of<EngProvider>(context, listen: false).setengneers(model);
      // ignore: use_build_context_synchronously
    } catch (e) {
      print('eng field ');
    }
  }
}
