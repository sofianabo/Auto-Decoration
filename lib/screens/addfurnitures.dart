import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget_example/Model/SupCategoryOnlyModel.dart';
import 'package:flutter_unity_widget_example/Provider/IdModelProvider.dart';
import 'package:flutter_unity_widget_example/Provider/SupCategoryOnlyProvider.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/controllers/UnityApi.dart';
import 'package:flutter_unity_widget_example/controllers/UpdateModelAPI.dart';
import 'package:flutter_unity_widget_example/controllers/uploadFileAPI.dart';
import 'package:gradient_text/gradient_text.dart';
import 'dart:html' as html;

import 'package:provider/provider.dart';

import '../controllers/api.dart';

class AddFurnitures extends StatefulWidget {
  const AddFurnitures({Key key}) : super(key: key);

  @override
  State<AddFurnitures> createState() => _AddFurnituresState();
}

class _AddFurnituresState extends State<AddFurnitures> {
  dynamic _bitsdata;
  final reader = html.FileReader();

  startwebfilepicker() async {
    html.FileUploadInputElement uploadinput = html.FileUploadInputElement();
    uploadinput.multiple = true;
    uploadinput.draggable = true;
    uploadinput.click();

    uploadinput.onChange.listen((event) {
      final files = uploadinput.files;
      final file = files[0];
      reader.onLoadEnd.listen((event) {
        setState(() {
          _bitsdata =
              Base64Decoder().convert(reader.result.toString().split(",").last);
        });
      });
      reader.readAsDataUrl(file);
    });
  }
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),

  ];
  Gradient gradient = LinearGradient(colors: [
    Color(0xfff484848),
    Color(0xfffff575e),
  ]);
  bool shadow = false;
  bool small = false;
  bool bold = false;
  bool _obscureText = false;

  String selectedValue;

  final List<String> items1 = [
    'Floor',
    'Aerial',
    'onWall'
  ];
  String selectedValue1;
  @override
  Widget build(BuildContext context) {
    List<SupCategoryOnly> drop = Provider.of<SupCategoryOnlyProvider>(context,listen: true).SupOnlyList;
String r;
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
            // SizedBox(
            //   height: _h/5.5,
            //   width: _w*4,
            // ),
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
            Column(
                 mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: _h / 8,
                ),
                Container(
                    //   margin: const EdgeInsets.only(top:100),
                    child: GradientText(Provider.of<UserInfoProvider>(context,listen: true).name,
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
                    'Add new furniture',
                    style: TextStyle(
                        fontFamily: 'SpecialElite',
                        fontSize: 20,
                        color: Color(0xfff484848)),
                  ),
                ),

                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _h / 100 > 700 ? 700 : _h / 100,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: _h / 2.2,
                        margin: const EdgeInsets.only(
                          right: 600,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: controller[0],
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.assignment_ind_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    //  hintText: "UserName",
                                    labelText: "Name",
                                    labelStyle:
                                        TextStyle(color: Color(0xfff484848))),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (val) => val.length <1
                                    ? "this field is required!"
                                    : null,
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: controller[1],

                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.height_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    //  hintText: "UserName",
                                    labelText: "Height",
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848))),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (val) => val.length <1
                                    ? "this field is required!"
                                    : null,
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: controller[2],

                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 22),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.width_full_outlined,
                                      color: Color(0xfffff575e)),
                                  // hintText: "********",
                                  labelText: "Width",
                                  labelStyle:
                                  TextStyle(color: Color(0xfff484848)),

                                ),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (val) => val.length <1
                                    ? "this field is required!"
                                    : null,
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: controller[3],

                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.social_distance_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    //  hintText: "UserName",
                                    labelText: "Length",
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848))),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (val) => val.length <1
                                    ? "this field is required!"
                                    : null,
                              ),
                            ),

                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: controller[5],
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.price_change_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    //  hintText: "UserName",
                                    labelText: "Price",
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848))),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (val) => val.length <1
                                    ? "this field is required!"
                                    : null,
                              ),
                            ),

                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: controller[4],
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.linear_scale,
                                      color: Color(0xfffff575e),
                                    ),
                                    //  hintText: "UserName",
                                    labelText: "Scale",
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848))),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (val) => val.length <1
                                    ? "this field is required!"
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: _h /10,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                startwebfilepicker();

                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green[200].withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xfff959595),
                                          Color(0xfff484848),
                                        ],
                                      ),
                                    ),
                                    child:Center(
                                      child: Text("Browse",style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'SpecialElite-Regular',
                                          color: Color(0xfffff575e)
                                      ),),
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _h/40,
                            ),
                            GestureDetector(
                              onTap: () {

                                 setState(() {
                                   print("dddddddddddd");

                                   UpdateModelAPI(context).UpdateModel(
                                       Provider.of<IdModelProvider>(context,listen: false).id
                                       ,double.parse(controller[4].text));
                                   r=host+","+port+","+Provider.of<UserInfoProvider>(context,listen: false).token+","+"false"+","+
                                       Provider.of<IdModelProvider>(context,listen: false).id.toString();
                                   GetUnityAPI(context).getUntiy("false",r );
                                 });

                                print("sucsseful");

                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green[200].withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xfff959595),
                                          Color(0xfff484848),
                                        ],
                                      ),
                                    ),
                                    child:Center(
                                      child: Text("update",style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'SpecialElite-Regular',
                                          color: Color(0xfffff575e)
                                      ),),
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _h/40,
                            ),
                            GestureDetector(
                              onTap: () {
                                if(controller[0].text.isEmpty || controller[1].text.isEmpty ||controller[2].text.isEmpty ||controller[3].text.isEmpty ||
                                    controller[5].text.isEmpty || selectedValue1.isEmpty||selectedValue.isEmpty)
                                  return;
                                Uploadf(context).uploadfile(
                                    controller[0].text.trim(),double.parse(controller[1].text) ,double.parse(controller[2].text),
                                    double.parse( controller[3].text) ,double.parse(controller[5].text),
                                    selectedValue,selectedValue1,_bitsdata,double.parse(controller[4].text)
                                );
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green[200].withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xfff959595),
                                          Color(0xfff484848),
                                        ],
                                      ),
                                    ),
                                    child:Center(
                                      child: Text("Upload",style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'SpecialElite-Regular',
                                          color: Color(0xfffff575e)
                                      ),),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: _h/40,
                //   width: _w * 4,
                // ),
                // Container(
                //     width: _w / 2,
                //     height: _h / 2,
                //     child: Image.asset('images/circle.png')
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: _h / 13,
                        child: DropdownButtonHideUnderline(
                          child:
                             DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Select Type',
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
                              items:drop
                                  .map((SupCategoryOnly s) => DropdownMenuItem<String>(
                                        value: s.supName,
                                        child: Text(
                                         s.supName,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xfffff575e),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 10,
                                width: 160,
                                padding: const EdgeInsets.only(left: 14, right: 14),
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
                                iconSize: 16,
                                iconEnabledColor: Color(0xfffff575e),
                                iconDisabledColor: Color(0xfffff575e),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: 150,
                                padding: null,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color(0xfff484848),
                                ),
                                elevation: 8,
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 20,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                        ),
                      ),
                      SizedBox(
                        width: _w/30,
                      ),
                      Container(
                        height: _h / 13,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Floor/Aerial',
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
                            items: items1
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
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
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 10,
                              width: 160,
                              padding: const EdgeInsets.only(left: 14, right: 14),
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
                              iconSize: 16,
                              iconEnabledColor: Color(0xfffff575e),
                              iconDisabledColor: Color(0xfffff575e),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 150,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color(0xfff484848),
                              ),
                              elevation: 8,
                              offset: const Offset(0, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 20,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: _h/2,
            // ),

          ]),

        ),
      ),
    );
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

