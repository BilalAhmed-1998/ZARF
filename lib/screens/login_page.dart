import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';


class login_page extends StatefulWidget {
  static const routeName = '/login_page';

  const login_page({Key key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double zarf_container_height =  (height/2.75);

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff03045e),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: zarf_container_height,
                  child: Center(
                    child: Image(
                      height: 35.h,
                      width: 132.w,
                      image: AssetImage("assets/images/zarf_logo.png"),
                    ),
                  ),
                ),
                Container(
// padding: EdgeInsets.symmetric(vertical: 300,horizontal: 0.0),
                  alignment: Alignment.centerLeft,
                  height: height - zarf_container_height,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      )),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20.w,60.h,20.w,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //SizedBox(height: 40),
                        Container(
                         // height: height / 8,

                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Log In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 14.h),
                                Text(
                                  'Hey! Welcome back!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.sp,
//fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter'),
                                ),
                              ]),
                        ),
                        SizedBox(height: 24.h),

                        Container(
                          height: 90.h,
                          width: 335.w,
                          //margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
//textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'InterBold'),
                              ),
                              SizedBox(height: 6.h),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
//contentPadding: EdgeInsets.symmetric(horizontal: 0),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    hintText: 'example@gmail.com',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Container(
                          height: 90.h,
                          width: 335.w,
                          //margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
//textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'InterBold'),
                              ),
                              SizedBox(height: 6.h),
                              TextField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                             contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    hintText: '************',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                          Container(
                             // margin: EdgeInsets.symmetric(horizontal: 25),
                              child: TextButton(
                            onPressed: () {
                            },
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                        ]),
                        SizedBox(height: 18.h),
                        Center(
                          child: SizedBox(
                            height: 46.h,
                            width: 335.w,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, home_page.routeName);
                                },
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "InterBold",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff03045e),
                                    //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "I don't have an account,",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16.sp,
                              ),
                            ),
                            InkWell(
                              enableFeedback: true,
                              onTap: () {
                                Navigator.pushNamed(context, schoollevel_page.routeName);

                              },
                              child: Text(
                                ' Sign Up',
                                style: TextStyle(
                                  color: Color(0xff03045e),
                                  fontSize: 16.sp,
                                 fontWeight: FontWeight.w800,
                                  fontFamily: "InterBold"
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Container(
              height: zarf_container_height,
             alignment: Alignment.centerRight,
             color: Colors.transparent,
              child: Image.asset("assets/images/element1.png"),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(60.w, 0, 0, 29.h),
              height: zarf_container_height,
              alignment: Alignment.bottomLeft,
              color: Colors.transparent,
              child: Image.asset("assets/images/element2.png"),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(41.w, 0, 0, 29.h),
              height: zarf_container_height,
              alignment: Alignment.topLeft,
              color: Colors.transparent,
              child: Image.asset("assets/images/element4.png"),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(41.w, 0, 0, 29.h),
              height: zarf_container_height+100.h,
              alignment: Alignment.bottomLeft,
              color: Colors.transparent,
              child: Image.asset("assets/images/element3.png"),
            ),
          ]),
        ),
      ),
    );
  }
}
