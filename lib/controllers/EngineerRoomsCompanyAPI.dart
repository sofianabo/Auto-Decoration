import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Model/EngineerRoomsCompanyModel.dart';
import 'package:flutter_unity_widget_example/Provider/EngineerRoomsCompanyProvider.dart';

import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Provider/userProvider.dart';

class EnginnerRoomsCompanyAPI {
  BuildContext context;
  Dio dio = Dio();
  EnginnerRoomsCompanyAPI(this.context);

  EnginnerRoomsCompany(String username) async {
    String myurl = "${global.serveryurl}/showdesignDisplay/$username";
    String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(
          headers: {'Authorization': 'Bearer $tokens'},
        ),
      );
      EngineerRoomsCompanyModel model =EngineerRoomsCompanyModel.fromJson(response.data);
      Provider.of<EnginnerRoomsCompanyProvider>(context,listen: false).setengRoomsCompany(model.room);
    } catch (e) {
      print('eng field ');
    }
  }
}
