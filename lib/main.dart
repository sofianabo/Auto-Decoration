import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/Provider/BranchEngineersProvider.dart';
import 'package:flutter_unity_widget_example/Provider/CategoryProvider.dart';
import 'package:flutter_unity_widget_example/Provider/EngineerRoomsCompanyProvider.dart';
import 'package:flutter_unity_widget_example/Provider/EngneersProvider.dart';
import 'package:flutter_unity_widget_example/Provider/FurnitureProvider.dart';
import 'package:flutter_unity_widget_example/Provider/IdModelProvider.dart';
import 'package:flutter_unity_widget_example/Provider/SubCategoryprovider.dart';
import 'package:flutter_unity_widget_example/Provider/SupCategoryOnlyProvider.dart';
import 'package:flutter_unity_widget_example/Provider/add_BEProvider.dart';
import 'package:flutter_unity_widget_example/Provider/combanyBranchProvider.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> SubCategoryProvider()),
        ChangeNotifierProvider(create: (context)=> UserInfoProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>CBProvider()),
        ChangeNotifierProvider(create: (context)=> EngProvider()),
        ChangeNotifierProvider(create: (context)=> add_BEProvider()),
        ChangeNotifierProvider(create: (context)=>FurniturProvider()),
        ChangeNotifierProvider(create: (context)=>SupCategoryOnlyProvider()),
        ChangeNotifierProvider(create: (context)=>EnginnerRoomsCompanyProvider()),
        ChangeNotifierProvider(create: (context)=>BranchEngineersProvider()),
        ChangeNotifierProvider(create: (context)=>IdModelProvider()),
      ],
      child: MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: splash(),
          ),
        ),
      ),
    );
  }
}
