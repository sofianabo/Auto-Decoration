import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget_example/Room.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/wallcolor.dart';
import 'package:gradient_text/gradient_text.dart';

import 'engpersonalinfo.dart';

class RoomInformations extends StatefulWidget {
  const RoomInformations({Key key}) : super(key: key);
  @override
  State<RoomInformations> createState() => _RoomInformationsState();

}

class _RoomInformationsState extends State<RoomInformations> {
  final _colorNotifier = ValueNotifier<Color>(Colors.green);

  Gradient gradient = LinearGradient(colors: [
    Color(0xfff484848),
    Color(0xfffff575e),
  ]);
  bool shadow = false;
  bool small = false;
  bool bold = false;
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    RegExp floating = RegExp('.');
    final TextInputFormatter FloatingPoint =FilteringTextInputFormatter.allow(floating);
    var _h;
    var _w;
    _h = MediaQuery.of(context).size.height;
    _w = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                                        EngPersonalinfo()));
                          },
                          icon: Icon(Icons.account_box_outlined),
                          iconSize: 35,
                          color: Color(0xfffff575e),
                        )),
                    Container(
                        height: _h / 5,
                        child: IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             EngPersonalinfo()));
                          },
                          icon: Icon(Icons.login_outlined),
                          iconSize: 35,
                          color: Color(0xfffff575e),
                        )),
                  ],
                ),
              ),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: _h / 8,
                ),
                Container(
                    //   margin: const EdgeInsets.only(top:100),
                    child: GradientText('Auto Decoration ',
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
                    'Room informations',
                    style: TextStyle(
                        fontFamily: 'SpecialElite',
                        fontSize: 20,
                        color: Color(0xfff484848)),
                  ),
                ),
                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _h / 60 > 700 ? 700 : _h / 60,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: _h / 4,
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
                                controller: Room.controller[0],
                                keyboardType: TextInputType.number,
                                inputFormatters: [

                                 FloatingPoint
                                ],
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
                                validator: (val) => val.length < 1
                                    ? "input error"
                                    : null,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller:Room.controller[1],
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FloatingPoint
                                ],
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
                                validator: (val) => val.length < 1
                                    ? "input error"
                                    : null,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller:Room.controller[2],
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FloatingPoint
                                ],
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
                                validator: (val) => val.length < 1
                                    ? "input error"
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Container(
                  height: _h / 15,
                  child: GestureDetector(
                    onTap: () {
                      if(Room.controller[0].text.isEmpty || Room.controller[1].text.isEmpty||Room.controller[2].text.isEmpty)
                        return;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WallColor()));

                    },
                    child: Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: const Color(0xfff484848)),
                        child: Center(
                          child: new Text(
                            "Select Color",
                            style: TextStyle(
                                fontFamily: 'SpecialElite',
                                color: Color(0xfffff575e),
                                fontSize: 15),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );

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

void _showDialog11(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Your furniture has been added"),
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
