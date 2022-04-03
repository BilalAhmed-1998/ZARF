

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';
import 'package:zarf/services/my_shared_preferences.dart';
import 'package:zarf/services/wrapper.dart';

import '../dummydata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height/2.5),
                        Padding(
                          padding:  EdgeInsets.only(left:20.w),
                          child: Text(AppLocalizations.of(context).welcometoZARFStudy,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'InterBold'
                            ),
                          ),
                        ),
                        SizedBox(height: 9.h),

                        Padding(
                          padding: EdgeInsets.only(left:20.h),
                          child: Text(AppLocalizations.of(context).whatareyouwaitingfor,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 16.sp,
                                fontFamily: 'Inter'
                            ),
                          ),
                        ),

                        SizedBox(height: 5.h),
                        Padding(
                          padding:  EdgeInsets.only(left:20.0),
                          child: Text(AppLocalizations.of(context).letsfindyouaschoolyoulllove,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Center(
                          child: SizedBox(
                            height: 46.h,
                            width: 335.w,
                            child: ElevatedButton(
                                onPressed: () async{
                                  MySharedPreferences.instance
                                      .setBooleanValue("isfirstRun", true);
                                  Navigator.pushNamed(context, schoollevel_page.routeName);



                                  // if(dormitories.length==0)
                                  //   await dbMain.getDormitories();

                                },
                                child: Text(
                                  AppLocalizations.of(context).letsgo,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context).alreadystudyingthroughZARFStudy,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                       fontFamily: 'Inter',
                      ),
                    ),
                    //SizedBox(height: 5.h,),
                    Center(
                      child: InkWell(
                        enableFeedback: true,
                        onTap: (){

                          MySharedPreferences.instance
                              .setBooleanValue("isfirstRun", true);

                        Navigator.pushNamed(context, Wrapper.routeName);
                      },
                        child: Text('\n'+AppLocalizations.of(context).login,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "InterBold",
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
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
