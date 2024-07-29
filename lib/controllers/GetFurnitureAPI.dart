// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'api.dart' as global;
// import '../Provider/userProvider.dart';
//
// class GetFurnitureAPI {
//   BuildContext context;
//   Dio dio = Dio();
//   GetFurnitureAPI(this.context);
//
//   GetFurniture(int Furnitureid) async {
//     String myurl = "${global.serveryurl}/get_model/$Furnitureid";
//     String tokens = Provider.of<UserInfoProvider>(context, listen: false).token;
//     try {
//       var response = await dio.get(
//         myurl,
//         options: Options(
//           headers: {'Authorization': 'Bearer $tokens'},
//         ),
//       );
//       // GetFurinutreInfoModel model =
//       //     GetFurinutreInfoModel.fromJson(response.data);
//       // Provider.of<FurniturProvider>(context, listen: false)
//       //     .setfurniture(model.model);
//     } catch (e) {
//       print('eng field ');
//     }
//   }
// }
