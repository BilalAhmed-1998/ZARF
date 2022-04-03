import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class fullscreen_page extends StatelessWidget  {

  dynamic image;

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
           // height: height,
            width: width,
            alignment: Alignment.center,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:this.image.runtimeType!=String?
                FutureBuilder(
                    future: this.image,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Image.network(
                          snapshot.data,
                          width : width,
                          fit: BoxFit.fill,
                        );
                      }

                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Container(
// width: 100,
                          height: 400,
                          child: CircularProgressIndicator
                              .adaptive(),
                        );
                      }
                      return Container();
                    }):
                Image.network(
                  this.image,
                  width : width,
                  fit: BoxFit.fill,
                )
              ),
            ),
        ),
      ),


    );




  }
}
