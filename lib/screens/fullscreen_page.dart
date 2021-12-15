import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class fullscreen_page extends StatelessWidget  {

  String image;

  fullscreen_page({this.image});

  //const fullscreen_page({Key? key}) : super(key: key);

  // void _LandscapeModeOnly() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.landscapeRight,
  //   ]);
  // }
  // void _portraitModeOnly() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //
  //   @override
  //   void dispose() {
  //     _LandscapeModeOnly();
  //   }
  // }
  @override
  Widget build(BuildContext context) {
        // SystemChrome.setPreferredOrientations([
        //   DeviceOrientation.landscapeLeft,
        //   DeviceOrientation.landscapeRight,
        // ]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
        tag: "wow",
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                    this.image,
                    fit: BoxFit.fill
                ),
              ),
            ),
        ),
      ),


    );




  }
}
