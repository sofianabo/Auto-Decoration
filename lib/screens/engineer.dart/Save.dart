import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget_example/controllers/login_Register.dart';
import 'package:flutter_unity_widget_example/screens/register.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';

class Save extends StatefulWidget {
  const Save({Key key}) : super(key: key);

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Gradient gradient = LinearGradient(colors: [
    Color(0xfff484848),
    Color(0xfffff575e),
  ]);
  bool shadow = false;
  bool small = false;
  bool bold = false;
  bool _obscurefield = false;

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
            // SizedBox(
            //   height: _h/5.5,
            //   width: _w*4,
            // ),

            Column(
              //    mainAxisAlignment: MainAxisAlignment.center,
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
                    'Save The Design',
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
                                controller: username,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    //  hintText: "UserName",
                                    labelText: "Room Name",
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848))),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: password,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                obscureText: _obscurefield,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 22),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.vpn_key_outlined,
                                      color: Color(0xfffff575e)),
                                  // hintText: "********",
                                  labelText: "Rate",
                                  labelStyle:
                                  TextStyle(color: Color(0xfff484848)),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscurefield = !_obscurefield;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 40, bottom: 5),
                                      // child: Icon(
                                      //   color: Color(0xfffff575e),
                                      //   _obscurefield
                                      //       ? Icons.visibility_outlined
                                      //       : Icons.visibility_off_outlined,
                                      // ),
                                    ),
                                  ),
                                ),
                                validator: (val) => val.length < 1
                                    ? "this field is required "
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: _h / 4,
                      child: GestureDetector(
                        onTap: () {

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
