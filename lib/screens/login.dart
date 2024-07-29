import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget_example/controllers/login_Register.dart';
import 'package:flutter_unity_widget_example/screens/register.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    'Login to your account',
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
                                    labelText: "UserName",
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
                                  labelText: "Password",
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
                                validator: (val) => val.length < 6
                                    ? "Password too short"
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
                          if(username.text.trim().isNotEmpty && password.text.trim().isNotEmpty)
                            {
                              login(context).loginn(username.text.trim(), password.text.trim());

                                  //if(Provider.of<UserInfoProvider>(context,listen: true).role=='engineer')
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => RoomInformations()));
                                  // else
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MainScreen()));

                            }

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
                Container(
                  height: _h / 10,
                  child: Row(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 16, top: 15, bottom: 1),
                        child: GestureDetector(
                          onTap: () {
                            _showDialog(context);
                          },
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              fontFamily: "SpecialElite",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfffff575e),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: _h / 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: _h / 10,
                          margin: const EdgeInsets.only(left: 16, top: 20),
                          child: Row(
                            children: [
                              Text(
                                'Dont have an account ?  ',
                                style: TextStyle(
                                  fontFamily: "SpecialElite",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xfff484848),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()));
                                },
                                child: Text(
                                  'Create an account !',
                                  style: TextStyle(
                                    fontFamily: "SpecialElite",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xfffff575e),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: _w / 1.5,
              width: _w / 2,
              height: _h / 4,
              child: Container(
                height: _h / 20,
                width: _w / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/light-1.png'))),
              ),
            ),
            Positioned(
              left: _w / 1.8,
              width: _w / 2,
              height: _h / 5,
              child: Container(
                height: _h / 20,
                width: _w / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/light-1.png'))),
              ),
            ),

            Positioned(
              left: _w / 2.2,
              width: _w / 2,
              height: _h / 3.3,
              child: Container(
                height: _h / 20,
                width: _w / 2,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/clock.png'))),
              ),
            )
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

void _showDialog(BuildContext context) {
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
                height: 15,
              ),
              Image.asset('images/logo.png', scale: 2.5),
              SizedBox(
                height: 5,
              ),
              Text("Forgot Password"),
            ],
          )),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Please enter your email",
                style: TextStyle(
                  fontFamily: "SpecialElite",
                  fontSize: 15,
                  color: Color(0xfff484848),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff484848))),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xfffff575e)),
                    ),
                    hintStyle: TextStyle(fontSize: 20),
                    icon: Icon(
                      Icons.email_outlined,
                      color: Color(0xfffff575e),
                      size: 25,
                    ),
                    //  hintText: "UserName",
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Color(0xfff484848),
                        fontFamily: "SpecialElite",
                        fontSize: 12),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                    if ((!value.endsWith('@gmail.com'))) {
                      return 'it is not a correct input';
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showDialog1(context);
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
                        'Send',
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
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please enter the code",
                    style: TextStyle(
                      fontFamily: "SpecialElite",
                      fontSize: 15,
                      color: Color(0xfff484848),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff484848))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfffff575e)),
                      ),
                      hintStyle: TextStyle(fontSize: 20),
                      icon: Icon(
                        Icons.code,
                        color: Color(0xfffff575e),
                        size: 25,
                      ),
                      //  hintText: "UserName",
                      labelText: "Code",
                      labelStyle: TextStyle(
                          color: Color(0xfff484848),
                          fontFamily: "SpecialElite",
                          fontSize: 12),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _showDialog2(context);
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
                            'Send',
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
            ],
          ),
        );
      });
}
