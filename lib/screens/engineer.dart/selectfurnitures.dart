import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:flutter_unity_widget_example/Model/CategoryModel.dart';
import 'package:flutter_unity_widget_example/Model/GetFurnitureInfoModel.dart';
import 'package:flutter_unity_widget_example/Model/SubCategoryModel.dart';
import 'package:flutter_unity_widget_example/Provider/CategoryProvider.dart';
import 'package:flutter_unity_widget_example/Provider/FurnitureProvider.dart';
import 'package:flutter_unity_widget_example/Provider/SubCategoryprovider.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/Room.dart';
import 'package:flutter_unity_widget_example/controllers/EngneersAPI.dart';
import 'package:flutter_unity_widget_example/controllers/GetFurnitureInfoAPI.dart';
import 'package:flutter_unity_widget_example/controllers/GetSubCategoryAPI.dart';
import 'package:flutter_unity_widget_example/controllers/UnityApi.dart';
import 'package:flutter_unity_widget_example/controllers/api.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/Suggestion.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/engpersonalinfo.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/selectdesign.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';
int i=0;
int j=1;
String f='s';
int x;
class SelectFurnitures extends StatefulWidget {
  const SelectFurnitures({Key key}) : super(key: key);

  @override
  State<SelectFurnitures> createState() => _SelectFurnituresState();
}

class _SelectFurnituresState extends State<SelectFurnitures> {
  Gradient gradient = LinearGradient(colors: [
    Color(0xfff484848),
    Color(0xfffff575e),
  ]);
  bool shadow = false;
  bool small = false;
  bool bold = false;

  String selectedValue1;
  String selectedValue2;
  String selectedValue3;

  int scaleIndex = 0;
  UnityWidgetController _unityWidgetController;




  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded scene) {
    print('Received scene loaded from unity: ${scene.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

// Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    controller.resume();
    _unityWidgetController = controller;
    _unityWidgetController.postMessage(
        'Capsule',
        'begin',
         f,
    );
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unityWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<SupCategory> drop=Provider.of<SubCategoryProvider>(context,listen: true).subcatlist;
    List<Gategory> drop1=Provider.of<CategoryProvider>(context,listen: true).categorylist;
    List<Models> drop2=Provider.of<FurniturProvider>(context,listen: true).FurnitureList;
    Map<String,int> map=new Map();



    var _h;
    var _w;
    _h = MediaQuery.of(context).size.height;
    _w = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Stack(children: [
            Container(
              color: Colors.white,
              child: CustomPaint(
                size: Size(size.width, size.height),
                painter: Curved(),
              ),
            ),
            Container(
                height: _h / 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                  iconSize: 30,
                  color: Color(0xfff484848),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: _h / 5,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Suggestion()));
                          },
                          icon: Icon(Icons.list_alt),
                          iconSize: 35,
                          color: Color(0xfffff575e),
                        )),

                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: _h / 8,
                ),
                Container(
                    //   margin: const EdgeInsets.only(top:100),
                    child: GradientText('Auto Decoration',
                        gradient: gradient,
                        style: TextStyle(
                          fontFamily: "SpecialElite",
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ))),
                SizedBox(
                  height: _h / 5.5,
                  width: _w * 4,
                ),
                Container(
                  width: _w / 1.2,
                  height: _h / 25,
                  child: Text(
                    'Select Furnitures',
                    style: TextStyle(
                        fontFamily: 'SpecialElite',
                        fontSize: 20,
                        color: Color(0xfff484848)),
                  ),
                ),
                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _h / 80> 700 ? 700 : _h / 80,
                ),
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 90),
                        child: Container(
                          height: _h / 2.4,
                          width: _w,
                          margin: const EdgeInsets.only(
                            right: 70,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                      fontFamily: 'SpecialElite',
                                      fontSize: 20,
                                      color: Color(0xfff484848),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: _h / 85,
                              ),
                              Container(
                                height: _h / 12,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: const [
                                        Icon(
                                          Icons.list,
                                          size: 16,
                                          color: Color(0xfffff575e),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select Category',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xfffff575e),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: drop1
                                        .map((Gategory g) => DropdownMenuItem<String>(
                                              value: g.name,
                                              child: Text(
                                                  g.name,

                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xfffff575e),
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue1,

                                    onChanged: (value) {

                                      setState(() {
                                        selectedValue1 = value as String;
                                        GetSubCategoryAPI(context).getsubcategory(selectedValue1);
                                      });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 20,
                                      width: 350,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                        color: Color(0xfff484848),
                                      ),
                                      elevation: 2,
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_downward_outlined,
                                      ),
                                      iconSize: 18,
                                      iconEnabledColor: Color(0xfffff575e),
                                      iconDisabledColor: Color(0xfffff575e),
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 320,
                                      padding: null,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xfff484848),
                                      ),
                                      elevation: 8,
                                      offset: const Offset(15, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 20,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _h / 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90),
                                child: Container(
                                  child: Text(
                                    'Sub Catrgory',
                                    style: TextStyle(
                                        fontFamily: 'SpecialElite',
                                        fontSize: 20,
                                        color: Color(0xfff484848),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _h / 85,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90),
                                child: Container(
                                  height: _h / 12,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: const [
                                          Icon(
                                            Icons.list,
                                            size: 16,
                                            color: Color(0xfffff575e),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Select Sub Category',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xfffff575e),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: drop
                                          .map((SupCategory s) =>
                                              DropdownMenuItem<String>(
                                                value: s.supName,
                                                child: Text(
                                                  s.supName,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xfffff575e),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue2,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue2 = value;
                                          GetFurnitureInfoAPI(context).GetFurnitureInfo(selectedValue2);

                                        });
                                      },
                                      buttonStyleData: ButtonStyleData(
                                        height: 20,
                                        width: 350,
                                        padding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          color: Color(0xfff484848),
                                        ),
                                        elevation: 2,
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_downward_outlined,
                                        ),
                                        iconSize: 18,
                                        iconEnabledColor: Color(0xfffff575e),
                                        iconDisabledColor: Color(0xfffff575e),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        maxHeight: 200,
                                        width: 320,
                                        padding: null,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: Color(0xfff484848),
                                        ),
                                        elevation: 8,
                                        offset: const Offset(15, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(40),
                                          thickness:
                                              MaterialStateProperty.all<double>(
                                                  6),
                                          thumbVisibility:
                                              MaterialStateProperty.all<bool>(
                                                  true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 20,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _h / 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 180),
                                child: Container(
                                  child: Text(
                                    'Models',
                                    style: TextStyle(
                                        fontFamily: 'SpecialElite',
                                        fontSize: 20,
                                        color: Color(0xfff484848),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _h / 85,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 170),
                                child: Container(
                                  height: _h / 12,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: const [
                                          Icon(
                                            Icons.list,
                                            size: 16,
                                            color: Color(0xfffff575e),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Select Model',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xfffff575e),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                     items: drop2
                                          .map((Models m) =>
                                              DropdownMenuItem<String>(

                                                value: m.modelName,
                                                child: Text(
                                                  m.modelName,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xfffff575e),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue3,
                                      onChanged: (value) {
                                        setState(()  {
                                          selectedValue3 = value as String;
                                          for (Models m in drop2){
                                            map[m.modelName]=m.id;
                                          }
                                        x= map[selectedValue3];
                                          f =host+","+port+","+Provider.of<UserInfoProvider>(context,listen: false).token+","+"false"+","+x.toString();
                                              GetUnityAPI(context).getUntiy("false", f);
                                          _showDialog(context,selectedValue3,x);

                                        });


                                      },
                                      buttonStyleData: ButtonStyleData(
                                        height: 20,
                                        width: 350,
                                        padding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          color: Color(0xfff484848),
                                        ),
                                        elevation: 2,
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_downward_outlined,
                                        ),
                                        iconSize: 18,
                                        iconEnabledColor: Color(0xfffff575e),
                                        iconDisabledColor: Color(0xfffff575e),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        maxHeight: 200,
                                        width: 320,
                                        padding: null,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: Color(0xfff484848),
                                        ),
                                        elevation: 8,
                                        offset: const Offset(15, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(40),
                                          thickness:
                                              MaterialStateProperty.all<double>(
                                                  6),
                                          thumbVisibility:
                                              MaterialStateProperty.all<bool>(
                                                  true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 20,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: _w / 1.2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: _h / 4,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectDesign()));
                                },
                                child: Container(
                                  height: _h / 4.7,
                                  child: AnimatedScale(
                                    duration: Duration(milliseconds: 500),
                                    scale: scaleIndex == 1 ? 1.05 : 1.0,
                                    child: MouseRegion(
                                      onEnter: (event) =>
                                          setState(() => scaleIndex = 1),
                                      onExit: (event) =>
                                          setState(() => scaleIndex = 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          GetUnityAPI(context).getUntiy("false",new Room(context).toString());
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SelectDesign()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: _h / 5,
                                                width: _w / 7,
                                                child: Image.asset(
                                                  "images/suggestion6.jpg",
                                                  fit: BoxFit.fitHeight,
                                                )),
                                            SizedBox(
                                              height: _h / 60,
                                            ),
                                            Text(
                                              'Show Design',
                                              style: TextStyle(
                                                  fontFamily: "SpecialElite",
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: scaleIndex == 1
                                                      ? Color(0xfffff575e)
                                                      : Color(0xfff484848)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
  void _showDialog(BuildContext context,String name,int id) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            titleTextStyle: TextStyle(
              fontFamily: "SpecialElite",
              fontSize: 20,
              color: Color(0xfff484848),
              fontWeight: FontWeight.bold,
            ),
            title: Center(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color(0xfffff575e),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset('images/logo.png', scale: 6),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                )),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontFamily: "SpecialElite",
                          fontSize: 15,
                          color: Color(0xfff484848),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Text(
                        "Price: 200.5 ",
                        style: TextStyle(
                          fontFamily: "SpecialElite",
                          fontSize: 15,
                          color: Color(0xfff484848),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        child: UnityWidget(
                          onUnityCreated: _onUnityCreated,
                          onUnitySceneLoaded: onUnitySceneLoaded,
                          onUnityMessage: onUnityMessage,

                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Room.ids.add(id);
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xfff484848),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                topLeft: Radius.circular(100),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                    color: Color(0xfffff575e),
                                    fontFamily: "SpecialElite",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });


  }

  void setRotationSpeed(String speed) {

  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewporChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Curved extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    // Path rectPathThree = Path();
    Paint paint = Paint();
    paint.shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [.01, .25],
      colors: [
        Color(0xfff8a55f),
        Color(0xfffff585d),
      ],
    ).createShader(rect);

    Paint paint2 = Paint();
    paint2.shader = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [.05, 1],
      colors: [
        Color(0xfff959595),
        Color(0xfff484848),
      ],
    ).createShader(rect);

    var path = Path();
    var path2 = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width * 0.6,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.1,
      size.width * 0.1,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.06,
      size.height * 0.4,
      size.width * 0,
      size.height * 0.4,
    );
    path.close();
    //
    path2.moveTo(size.width, size.height);
    path2.lineTo(size.width, size.height * 0.7);
    path2.quadraticBezierTo(
      size.width,
      size.height * .65,
      size.width,
      size.height * 0.7,
    );
    path2.quadraticBezierTo(
      size.width * .9,
      size.height * .95,
      size.width * 0.2,
      size.height * 0.97,
    );
    path2.quadraticBezierTo(
      size.width * .1,
      size.height * .98,
      size.width * 0.1,
      size.height,
    );
    //
    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// FOR PAINTING THE CIRCLE
class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}





