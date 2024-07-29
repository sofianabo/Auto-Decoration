import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Provider/combanyBranchProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;
import '../Model/CompanyBranchModel.dart';
import '../Provider/userProvider.dart';

class CBAPI {
  BuildContext context;
  Dio dio = Dio();
  CBAPI(this.context);

  getCBInfo() async {
    // bool = true
    String myurl = "${global.serveryurl}/showCompany";
    String token = Provider.of<UserInfoProvider>(context, listen: false).token;
    try {
      var response = await dio.get(
        myurl,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      CBmodel model = CBmodel.fromJson(response.data);
      Provider.of<CBProvider>(context, listen: false).setCBInfo(model.user);
    } catch (e) {
      print('get category field ');
    }
    // bool = false
  }
}
