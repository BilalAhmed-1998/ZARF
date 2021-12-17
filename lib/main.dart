import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zarf/routes.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/ref_earning.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:zarf/screens/schooldetail_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';
import 'package:zarf/screens/signup_page.dart';
import 'package:zarf/screens/welcome_page.dart';
import 'package:zarf/screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: Size(375, 889),
        builder: () => MaterialApp(
              theme: ThemeData(

                  primaryColor: Color(0xff03045e),
                  backgroundColor: Color(0xff03045e),
                  fontFamily: 'Inter'),
              routes: routes,
              debugShowCheckedModeBanner: false,
              home: splash_screen(1,home_page.routeName),
            ));
  }
}
