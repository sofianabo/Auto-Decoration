import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/screens/login.dart';
import 'package:splashscreen/splashscreen.dart' as prefix0;

class splash extends StatefulWidget {
  const splash({Key key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(
    //     Duration(seconds: 5),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    var _h;
    var _w;
    _h = MediaQuery.of(context).size.height;
    _w = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    // return Scaffold(
    //     body: Container(
    //         color: Colors.white,
    //         height: _h * 2,
    //         width: _w * 4,
    //         child: Image.asset("images/splash-3.gif")));
    return Container(
      color: Colors.white,
      child: prefix0.SplashScreen(
        seconds: 7,
        image: Image.asset(
          "images/splash-3.gif",
        ),
        navigateAfterSeconds: Login(),
        photoSize: 200,
        useLoader: false,
        onClick: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())),
      ),
    );
  }
}
