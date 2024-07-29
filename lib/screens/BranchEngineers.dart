import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/Provider/BranchEngineersProvider.dart';
import 'package:flutter_unity_widget_example/Provider/EngneersProvider.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/controllers/EngineerRoomsCompanyAPI.dart';
import 'package:flutter_unity_widget_example/screens/AddEngineers.dart';
import 'package:flutter_unity_widget_example/screens/EngineerDesigns.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';

class BranchEngineers extends StatefulWidget {
  const BranchEngineers({Key key}) : super(key: key);

  @override
  State<BranchEngineers> createState() => _BranchEngineersState();
}

class _BranchEngineersState extends State<BranchEngineers> {
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
                      'Engineers',
                      style: TextStyle(
                          fontFamily: 'SpecialElite',
                          fontSize: 20,
                          color: Color(0xfff484848)),
                    )),
                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _h / 30 > 700 ? 700 : _h / 30,
                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Center(
                        child: Container(
                          height: _h / 2.5,
                          width: _w / 2,
                          child: AnimatedListView(
                              duration: 100,
                              extendedSpaceBetween: 30,
                              spaceBetween: 10,
                              children: List.generate(
                                  Provider.of<BranchEngineersProvider>(context,listen: true).branchengineeers.length,
                                      (index) => GestureDetector(
                                    onTap: (){
                                      EnginnerRoomsCompanyAPI(context).EnginnerRoomsCompany(Provider.of<BranchEngineersProvider>(context,listen: false).branchengineeers.elementAt(index).userName);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EngineerDesigns()));
                                    },
                                    child: Card(
                                      //       elevation: 50,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      //  shadowColor: Colors.black,
                                      color: Colors.white,
                                      child: SizedBox(
                                        height: 220,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                Color(0xfff484848),
                                                radius: 60,
                                                child: const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'images/engi.jpg'),
                                                  radius: 50,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                Provider.of<BranchEngineersProvider>(context,listen: true).branchengineeers.elementAt(index).name,
                                                style: TextStyle(
                                                  fontFamily: 'SpecialElite',
                                                  fontSize: 30,
                                                  color: Color(0xfff484848),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))),
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
