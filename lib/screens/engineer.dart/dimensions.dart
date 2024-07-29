import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget_example/Room.dart';
import 'package:flutter_unity_widget_example/controllers/GetCategoryAPI.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/selectfurnitures.dart';
import 'package:gradient_text/gradient_text.dart';

class Dimensions extends StatefulWidget {
  const Dimensions({Key key}) : super(key: key);

  @override
  State<Dimensions> createState() => _DimensionsState();
}

class _DimensionsState extends State<Dimensions> {
  Gradient gradient = LinearGradient(colors: [
    Color(0xfff484848),
    Color(0xfffff575e),
  ]);
  bool shadow = false;
  bool small = false;
  bool bold = false;
  final List<String> items1 = [
    'left',
    'right',
    'forword',
    'backword',
  ];
  final List<String> items2 = [
    'left',
    'right',
    'forword',
    'backword',
  ];
  String selectedValue1;
  String selectedValue2;

  @override
  Widget build(BuildContext context) {
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
                    'Detrmine the dimensions',
                    style: TextStyle(
                        fontFamily: 'SpecialElite',
                        fontSize: 20,
                        color: Color(0xfff484848)),
                  ),
                ),
                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _h / 40 > 700 ? 700 : _h / 40,
                ),
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: _h / 2.5,
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
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Door coordinates',
                                    style: TextStyle(
                                        fontFamily: 'SpecialElite',
                                        fontSize: 20,
                                        color: Color(0xfff484848),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: _h / 60,
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
                                              'Select Side',
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
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
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
                                      value: selectedValue1,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue1 = value;
                                          Room.doorS=selectedValue1;
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
                                        padding: EdgeInsets.only(left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: _h / 15,
                                ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                height: _h / 5,
                                margin: const EdgeInsets.only(
                              right: 70,
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
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                              ],
                                ),
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                  Container(
                                    width: _w/5,
                                    margin:
                                    const EdgeInsets.only(left: 16, right: 32),
                                    child: TextFormField(
                                   controller: Room.controller[3],
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 20),
                                          border: InputBorder.none,

                                          // hintText: "UserName",
                                          labelText: "Door Width",
                                          labelStyle:
                                          TextStyle(color: Color(0xfff484848))),
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (val) => val.length <1
                                          ? "input error"
                                          : null,
                                    ),
                                  ),
                                  Container(
                                    width: _w/5,
                                    margin:
                                    const EdgeInsets.only(left: 16, right: 32),
                                    child: TextFormField(
                                    controller: Room.controller[4],

                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 20),
                                          border: InputBorder.none,

                                          labelText: "Door Postion",
                                          labelStyle:
                                          TextStyle(color: Color(0xfff484848))),
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (val) => val.length < 1
                                          ? "input error"
                                          : null,
                                    ),
                                  ),])),
                            ),

                                ],
                              ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 300.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Window coordinates',
                                  style: TextStyle(
                                      fontFamily: 'SpecialElite',
                                      fontSize: 20,
                                      color: Color(0xfff484848),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: _h / 60,
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
                                            'Select Side',
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
                                    items: items2
                                        .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
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
                                        Room.windowS=selectedValue2;
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
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _h / 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:80.0),
                                child: Container(
                                    height: _h / 5,
                                    margin: const EdgeInsets.only(
                                      right: 70,
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
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: _w/5,
                                            margin:
                                            const EdgeInsets.only(left: 16, right: 32),
                                            child: TextFormField(
                                                  controller: Room.controller[5],
                                              decoration: InputDecoration(
                                                  hintStyle: TextStyle(fontSize: 20),
                                                  border: InputBorder.none,

                                                  // hintText: "UserName",
                                                  labelText: "Window width",
                                                  labelStyle:
                                                  TextStyle(color: Color(0xfff484848))),
                                              autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                              validator: (val) => val.length < 1
                                                  ? "input error"
                                                  : null,
                                            ),
                                          ),
                                          Container(
                                            width: _w/5,
                                            margin:
                                            const EdgeInsets.only(left: 16, right: 32),
                                            child: TextFormField(

                                               controller: Room.controller[6],
                                              decoration: InputDecoration(
                                                  hintStyle: TextStyle(fontSize: 20),
                                                  border: InputBorder.none,

                                                  labelText: "Window Postion",
                                                  labelStyle:
                                                  TextStyle(color: Color(0xfff484848))),
                                              autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                              validator: (val) => val.length < 1
                                                  ? "input error"
                                                  : null,
                                            ),
                                          ),])),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: _h / 4,
                        child: GestureDetector(
                          onTap: () {
                            if(selectedValue1.isEmpty || selectedValue2.isEmpty || Room.controller[3].text.isEmpty||
                            Room.controller[4].text.isEmpty ||  Room.controller[5].text.isEmpty ||  Room.controller[6].text.isEmpty
                            ){
                              return;

                            }
                           GetCategoryAPI(context).getcategory();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectFurnitures()));
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              height: 70,
                              width: 70,
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
                              child: const Icon(
                                Icons.arrow_forward_outlined,
                                color: Color(0xfffff575e),
                                size: 32,
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

void _showDialog1(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Your request has been sent"),
          titleTextStyle: TextStyle(
            fontFamily: "SpecialElite",
            fontSize: 15,
            color: Color(0xfff484848),
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK")),
          ],
        );
      });
}

void _showDialog2(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("completed successfully"),
          titleTextStyle: TextStyle(
            fontFamily: "SpecialElite",
            fontSize: 15,
            color: Color(0xfff484848),
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK")),
          ],
        );
      });
}

