import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/controllers/EngneersAPI.dart';
import 'package:flutter_unity_widget_example/controllers/OnlyModelsAPI.dart';
import 'package:flutter_unity_widget_example/controllers/companyBranschAPI.dart';
import 'package:flutter_unity_widget_example/screens/CompanyBranch.dart';
import 'package:flutter_unity_widget_example/screens/Engineers.dart';
import 'package:flutter_unity_widget_example/screens/companypersonalinfo.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/EngDesigns.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/engpersonalinfo.dart';
import 'package:flutter_unity_widget_example/screens/engineer.dart/roominformations.dart';
import 'package:flutter_unity_widget_example/screens/furnitures.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';

class MainItem {
   String title;
   String imgName;
 dynamic navigator;

  MainItem(String title, String imgName, dynamic navigator) {
    this.title = title;
    this.imgName = imgName;
    this.navigator = navigator;
  }
}

final engItems = [
  new MainItem('My Designs', 'images/mydesigns1.jpg', EngDesigns()),
  new MainItem('Add Design', 'images/adddesign.jpg', RoomInformations())
];

final compItems = [
  new MainItem('Company Branches', 'images/branches.jpg', CompanyBranch()),
  new MainItem('Engineers', 'images/engineer.jpg', Engineers()),
  new MainItem('Furnitures', 'images/furn.webp', Furnitures())
];

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   bool isCompany;
  dynamic selectedItems;
  Gradient gradient = LinearGradient(colors: [
    Color(0xfff484848),
    Color(0xfffff575e),
  ]);
  bool shadow = false;
  bool small = false;
  bool bold = false;
  int scaleIndex = -1;

  @override
  Widget build(BuildContext context) {
    isCompany = true;
    selectedItems = isCompany ? compItems : engItems;
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
            isCompany ? Container(
                height: _h / 10,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.dashboard_outlined),
                  iconSize: 30,
                  color: Color(0xfff484848),
                )) : Container(),
            !isCompany?Align(
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
                            EngAPI(context).getEngneers();
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
            ): Align(
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
                            CBAPI(context).getCBInfo();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompanyPersonalinfo()));
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

            // Container(
            //
            //   // margin: EdgeInsets.only(left: 5),
            //   height: _h/10,
            //   decoration: BoxDecoration(
            //     color: Colors.black,
            //       image: DecorationImage(
            //           image: AssetImage('images/logo.png')
            //       )
            //   ),
            // ),
            Center(
              child: Column(children: [
                SizedBox(
                  height: _h / 6,
                ),
                Container(
                  child: Container(
                      child: GradientText(
                          Provider.of<UserInfoProvider>(context,listen: true).name,
                          gradient: gradient,
                          style: TextStyle(
                            fontFamily: "SpecialElite",
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage(
                //             'images/logo.png',
                //           ))),
                // ),
                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _w < 600 ? 50 : _h / 6.5,
                ),
                Positioned(
                    height: _h / 3, width: _w / 1.4, child: getImages(_w, _h)),
              ]),
            ),

          isCompany?  Container(
              height: _h,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 50),
                  height: 70,
                  width: 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                  Provider.of<UserInfoProvider>(context,listen: true).email,
                          style: TextStyle(
                            fontFamily: "SpecialElite",
                            fontSize: 13,
                            fontWeight: FontWeight.w100,
                            //   color: Color(0xfffff575e ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 62),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<UserInfoProvider>(context,listen: true).address,
                          style: TextStyle(
                                  fontFamily: "SpecialElite",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w100,
                                  //  color: Color(0xfffff575e),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ): Container(),
          ]),
        ),
      ),
    );
  }

  getImages(_w, _h) {
    if (_w < 600)
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            selectedItems.length,
            (index) => Row(
              children: [
                AnimatedScale(
                  duration: Duration(milliseconds: 500),
                  scale: scaleIndex == index ? 1.05 : 1.0,
                  child: MouseRegion(
                    onEnter: (event) => setState(() => scaleIndex = index),
                    onExit: (event) => setState(() => scaleIndex = -1),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {

                              EngAPI(context).getEngneers();
                              CBAPI(context).getCBInfo();
                              OnlyModelsAPI(context).getOnlyModels();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          selectedItems[index].navigator));
                            },
                            child: Container(
                              height: _h / 3.5 < _w / 5 ? _h / 3.5 : _w / 5,
                              width: _h / 3.5 < _w / 5 ? _h / 3.5 : _w / 5,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        selectedItems[index].imgName),
                                    fit: BoxFit.cover),
                              ),
                            )),
                        SizedBox(
                          height: _h / 50,
                        ),
                        Text(
                          selectedItems[index].title,
                          style: TextStyle(
                              fontFamily: "SpecialElite",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: scaleIndex == index
                                  ? Color(0xfffff575e)
                                  : Color(0xfff484848)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: _w / 20,
                ),
              ],
            ),
          ),
        ),
      );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        selectedItems.length,
        (index) => Row(
          children: [
            AnimatedScale(
              duration: Duration(milliseconds: 500),
              scale: scaleIndex == index ? 1.05 : 1.0,
              child: MouseRegion(
                onEnter: (event) => setState(() => scaleIndex = index),
                onExit: (event) => setState(() => scaleIndex = -1),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          EngAPI(context).getEngneers();
                          CBAPI(context).getCBInfo();
                          OnlyModelsAPI(context).getOnlyModels();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      selectedItems[index].navigator));
                        },
                        child: Container(
                          height: _h / 3.5 < _w / 5 ? _h / 3.5 : _w / 5,
                          width: _h / 3.5 < _w / 5 ? _h / 3.5 : _w / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(selectedItems[index].imgName),
                                fit: BoxFit.cover),
                          ),
                        )),
                    SizedBox(
                      height: _h / 50,
                    ),
                    Text(
                      selectedItems[index].title,
                      style: TextStyle(
                          fontFamily: "SpecialElite",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: scaleIndex == index
                              ? Color(0xfffff575e)
                              : Color(0xfff484848)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: _w / 20,
            ),
          ],
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
