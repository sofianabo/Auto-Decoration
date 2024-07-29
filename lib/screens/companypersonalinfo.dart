import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';

class CompanyPersonalinfo extends StatefulWidget {
  const CompanyPersonalinfo({Key key}) : super(key: key);

  @override
  State<CompanyPersonalinfo> createState() => _CompanyPersonalinfoState();
}

class _CompanyPersonalinfoState extends State<CompanyPersonalinfo> {
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
                      'Personal info',
                      style: TextStyle(
                          fontFamily: 'SpecialElite',
                          fontSize: 20,
                          color: Color(0xfff484848)),
                    )),
                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _h / 80 > 700 ? 700 : _h / 80,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Container(
                        height: _h / 2.5,
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
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 15),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    labelText: Provider.of<UserInfoProvider>(context,listen: true).username,
                                    hintText: 'Name',
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848),fontSize: 15)),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'this field is required';
                                  }
                                  if ((!value.endsWith('@gmail.com'))) {
                                    return 'it is not a correct input';
                                  }
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 15),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.email_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    labelText: Provider.of<UserInfoProvider>(context,listen: true).email,
                                    hintText: 'Email',
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848),fontSize: 15)),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 15),
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xfffff575e),
                                    ),
                                    labelText: Provider.of<UserInfoProvider>(context,listen: true).address,
                                    hintText: 'Address',
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848),fontSize: 15)),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (val) => val.length < 6
                                    ? "Password too short"
                                    : null,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 15),
                                    border: InputBorder.none,
                                    icon: Icon(Icons.vpn_key_outlined,
                                        color: Color(0xfffff575e)),
                                    labelText: "Password",
                                    hintText: 'Pssword',
                                    labelStyle:
                                    TextStyle(color: Color(0xfff484848),fontSize: 15),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 40, bottom: 30),
                                        // child: Icon(
                                        //   color: Color(0xfffff575e),
                                        //   _obscureText
                                        //       ? Icons.visibility_outlined
                                        //       : Icons.visibility_off_outlined,
                                        // ),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _showEdittingInformations(context);
                      },
                      child: Container(
                        height: _h / 2.4,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              height: 100,
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
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontFamily: 'SpecialElite',
                                        fontSize: 16,
                                        color: Color(0xfffff575e)),
                                  ))
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
void _showEdittingInformations(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("the informations is editted successfuly"),
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