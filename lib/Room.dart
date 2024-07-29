import 'package:flutter/cupertino.dart';
import 'package:flutter_unity_widget_example/Provider/userProvider.dart';
import 'package:flutter_unity_widget_example/controllers/api.dart';
import 'package:provider/provider.dart';

class Room{
  static List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),

  ];


  static  double length=0.0,width=0.0,height=0.0,doorP=0.0,doorW=0.0,windowW=0.0,windowP=0.0;
  static  String color="ff4caf50",doorS="",windowS="";
  static  List<int> ids=[];
 BuildContext context;
Room(this.context);

  @override
  String toString() {
    height=double.parse(controller[0].value.text);
    width=double.parse(controller[1].value.text);
    length=double.parse(controller[2].value.text);
    doorW=double.parse(controller[3].value.text);
    doorP=double.parse(controller[4].value.text);
    windowW=double.parse(controller[5].value.text);
    windowP=double.parse(controller[6].value.text);
    String s="";
    s+="$host,";
    s+="$port,";
    s+="${Provider.of<UserInfoProvider>(context,listen: false).token},";
    s+="${Room.length.toString()},";
    s+="${Room.width.toString()},";
    s+="${Room.height.toString()},";
    s+="${Room.color},";
    s+="[";
    s+="${Room.doorS},";
    s+="${Room.doorW.toString()},";
    s+="${Room.doorP.toString()},";
    s+="[";
    s+="${Room.windowS},";
    s+="${Room.windowW.toString()},";
    s+="${Room.windowP.toString()},";
    s+="[";
    if(ids.isNotEmpty)
      {
        s+=ids[0].toString();
      }
    for (int i=1;i<ids.length;i++) {
      s+=",${ids[i].toString()}" ;
    }
    return s;
  }
}