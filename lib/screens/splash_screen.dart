import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splash_screen extends StatelessWidget {

  //const splash_screen({Key key}) : super(key: key);
  static const routeName = '/splash_screen';
  int duration = 0;
  String goTopage;

  splash_screen(int duration, String goTopage){
    this.duration = duration;
    this.goTopage = goTopage;

  }





  @override
  Widget build(BuildContext context) {


    Future.delayed(Duration(seconds: this.duration),(){
      Navigator.pushNamed(context, goTopage);


    });


    return Scaffold(backgroundColor: Color(0xff03045e),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(
    // width: 200,
     height: 35.h,
    color: Color(0xff03045e),
    alignment: Alignment.center,
    child: Image(image: AssetImage("assets/images/zarf_logo.png"),),
    ),
  ]),
    ),
    );
  }
}
