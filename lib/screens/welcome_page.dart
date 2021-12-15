

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';

class welcome_page extends StatelessWidget {

  static const routeName = '/welcome_page';


  const welcome_page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        //color:Color(0xff03045e),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Color(0xff03045e),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff03045e).withOpacity(0.6),
                    Color(0xff03045f),

                  ]
                )
              ),
            ),
            Positioned.fill(
                child: Image(image: AssetImage('assets/images/welcome_01.png',),
                    fit: BoxFit.cover,
                ),
            ),
           Positioned.fill(

              child: Opacity(
                opacity: 0.2,
                child: Image(image: AssetImage('assets/images/welcome_02.png',),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height/9),
                Container(
                  height: 35.h,
                  child: Center(
                    child:  Image(image: AssetImage("assets/images/zarf_logo.png"),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height/2.5),
                        Text('Welcome to ZARF Study',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterBold'
                          ),
                        ),
                        SizedBox(height: 9.h),

                        Text('What are you waiting for?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16.sp,
                              fontFamily: 'Inter'
                          ),
                        ),

                        SizedBox(height: 5.h),
                        Text('Let’s find you a school you’ll love.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Center(
                          child: SizedBox(
                            height: 46.h,
                            width: 335.w,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, schoollevel_page.routeName);
                                },
                                child: Text(
                                  "Let's go",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff03045e),
                                    fontFamily: "InterBold"
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                )
                            ),
                          ),
                        ),

                      ]),
                SizedBox(height: 43.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already studying through ZARF Study?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                       fontFamily: 'Inter',
                      ),
                    ),
                    InkWell(
                      enableFeedback: true,
                      onTap: (){
                      Navigator.pushNamed(context, login_page.routeName);
                    },
                      child: Text(' Login',
                        style: TextStyle(
                          fontFamily: "InterBold",
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    )

                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
