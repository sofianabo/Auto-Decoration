import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:flutter_unity_widget_example/Provider/EngineerRoomsCompanyProvider.dart';
import 'package:flutter_unity_widget_example/Provider/FurnitureProvider.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/controllers/SupCategoryOnlyAPI.dart';
import 'package:flutter_unity_widget_example/controllers/UnityApi.dart';
import 'package:flutter_unity_widget_example/screens/addfurnitures.dart';
import 'package:flutter_unity_widget_example/screens/browsefurnitures.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/api.dart';
String f;
class Furnitures extends StatefulWidget {
  const Furnitures({Key key}) : super(key: key);

  @override
  State<Furnitures> createState() => _FurnituresState();
}

class _FurnituresState extends State<Furnitures> {
  Gradient gradient = LinearGradient(colors: [
    Color(0xfff484848),
    Color(0xfffff575e),
  ]);
  bool shadow = false;
  bool small = false;
  bool bold = false;
  bool _obscureText = false;
  dynamic arr = null;

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
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        arr = [
          "https://th.bing.com/th?id=OIP.KAiaTz6YUy3R7miXRLbvBgHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.74E5QpGvqWU3wjXp_WV46gHaFh&w=289&h=216&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.BZTwL_zQXxzdiO9l1F11twHaEc&w=322&h=193&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.3KdpvlgO6j9wGmMfzk8YQwHaE0&w=309&h=201&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.kmGSapuZGJHvCHpCG-cZagHaD5&w=344&h=181&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.KAiaTz6YUy3R7miXRLbvBgHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.74E5QpGvqWU3wjXp_WV46gHaFh&w=289&h=216&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.BZTwL_zQXxzdiO9l1F11twHaEc&w=322&h=193&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.KAiaTz6YUy3R7miXRLbvBgHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.74E5QpGvqWU3wjXp_WV46gHaFh&w=289&h=216&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.BZTwL_zQXxzdiO9l1F11twHaEc&w=322&h=193&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.3KdpvlgO6j9wGmMfzk8YQwHaE0&w=309&h=201&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.kmGSapuZGJHvCHpCG-cZagHaD5&w=344&h=181&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.KAiaTz6YUy3R7miXRLbvBgHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.74E5QpGvqWU3wjXp_WV46gHaFh&w=289&h=216&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.BZTwL_zQXxzdiO9l1F11twHaEc&w=322&h=193&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.KAiaTz6YUy3R7miXRLbvBgHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.74E5QpGvqWU3wjXp_WV46gHaFh&w=289&h=216&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.BZTwL_zQXxzdiO9l1F11twHaEc&w=322&h=193&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.3KdpvlgO6j9wGmMfzk8YQwHaE0&w=309&h=201&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.kmGSapuZGJHvCHpCG-cZagHaD5&w=344&h=181&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.KAiaTz6YUy3R7miXRLbvBgHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.74E5QpGvqWU3wjXp_WV46gHaFh&w=289&h=216&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "https://th.bing.com/th?id=OIP.BZTwL_zQXxzdiO9l1F11twHaEc&w=322&h=193&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
        ];
      });
    });
    var _h;
    var _w;
    _h = MediaQuery.of(context).size.height;
    _w = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    String r;
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
              //    mainAxisAlignment: MainAxisAlignment.center,
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
                    'Furnitures',
                    style: TextStyle(
                        fontFamily: 'SpecialElite',
                        fontSize: 20,
                        color: Color(0xfff484848)),
                  ),
                ),

                SizedBox(
                  width: _w / 5.5 > 700 ? 700 : _w / 5.5,
                  height: _h / 30 > 700 ? 700 : _h / 30,
                ),
                Stack(children: [
                  Container(
                    height: _h / 2,
                    width: _w / 1.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: _h / 1.05,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: _h / 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 BrowseFurnintures()));
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 50),
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.green[200]
                                                  .withOpacity(0.5),
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
                                          Icons.add,
                                          color: Color(0xfffff575e),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: _h / 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      SupCategoryOnlyAPI(context).SupCategoryOnly();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddFurnitures()));
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 50),
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.green[200]
                                                  .withOpacity(0.5),
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
                                          Icons.browser_updated_outlined,
                                          color: Color(0xfffff575e),
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: _w / 8,
                        ),
                        SingleChildScrollView(
                          child: Center(
                            child: Container(
                                height: _h / 2.5,
                                width: _w / 2,
                                child:  GridView.count(
                                    crossAxisCount: 3,
                                    // shrinkWrap: true,
                                    children: <Widget>[
                                      ...List.generate(
                                        Provider.of<FurniturProvider>(context,listen: true).FurnitureList.length,
                                            (i) => GestureDetector(
                                          onTap: () =>
                                          {
                                             r=host+","+port+","+Provider.of<UserInfoProvider>(context,listen: false).token+","+"false"+","+
                                              Provider.of<FurniturProvider>(context,listen: false).FurnitureList.elementAt(i).id.toString(),
                                            GetUnityAPI(context).getUntiy("false",r ),
                                            _showDialog(context)},
                                          child: GridAnimatorWidget(
                                            child: arr != null
                                                ? Container(
                                              height: _h / 1.6 / 2,
                                              width: _w / 1.5 / 4,
                                              child: Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: ClipRRect(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                    child: Container(
                                                      color: Color(0xfff9f9f9),
                                                      child: Container(
                                                        height: _h/4,
                                                        width: _w/8,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Text(Provider.of<FurniturProvider>(context,listen: true).FurnitureList.elementAt(i).modelName,
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                  "SpecialElite",
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xfffff575e),
                                                                )),
                                                            SizedBox(
                                                              height: _h/40,
                                                              width: _w/8,
                                                            ),
                                                            Text(Provider.of<FurniturProvider>(context,listen: true).FurnitureList.elementAt(i).price.toString(),
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                  "SpecialElite",
                                                                  fontSize: 15,
                                                                  color: Color(
                                                                      0xfffff575e),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            )
                                                : SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                lines: 3,
                                                lineStyle: SkeletonLineStyle(
                                                  borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                                  height: _h / 1.6 ,
                                                  width: _w / 1.5 ,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).toList()
                                    ])),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),


              ],
            ),
          ]),
        ),
      ),
    );
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

                    SizedBox(
                      width: 50,
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
                          height: 300,
                          width: 300,
                          child:UnityWidget(
                            onUnityCreated: _onUnityCreated,
                          )
                      ),
                      SizedBox(
                        height: 50,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        });
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

