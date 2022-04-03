import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';
import 'package:zarf/services/auth_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dummydata.dart';

class login_page extends StatefulWidget {
  static const routeName = '/login_page';

  const login_page({Key key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final auth_service auth = auth_service();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String Emailtext = "";
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double zarf_container_height = (height / 2.75);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                      margin: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 0),
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
                                    AppLocalizations.of(context).login1,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'InterBold'),
                                  ),
                                  SizedBox(height: 14.h),
                                  Text(
                                    AppLocalizations.of(context).heyWelcomeBack,
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
                                  controller: emailController,

                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
//contentPadding: EdgeInsets.symmetric(horizontal: 0),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      hintText: 'adam.white@gmail.com',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200),
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
                                  AppLocalizations.of(context).password,
//textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 6.h),
                                TextFormField(

                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: obscure,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            obscure = !obscure;
                                          });

                                        },
                                        icon: !obscure?Icon(Icons.visibility):Icon(Icons.visibility_off_outlined),
                                      ),
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: '************',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                ),
                                // TextField(
                                //   controller: passwordController,
                                //   keyboardType: TextInputType.visiblePassword,
                                //   obscureText: obscure,
                                //   decoration: InputDecoration(
                                //       suffixIcon: IconButton(
                                //         onPressed: (){
                                //           setState(() {
                                //             obscure = !obscure;
                                //           });
                                //
                                //         },
                                //         icon: !obscure?Icon(Icons.visibility):Icon(Icons.visibility_off_outlined),
                                //       ),
                                //       contentPadding: EdgeInsets.symmetric(
                                //           horizontal: 16.w),
                                //       fillColor: Colors.grey.shade200,
                                //       filled: true,
                                //       hintText: '************',
                                //       enabledBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //             color: Colors.grey.shade200),
                                //         borderRadius: BorderRadius.circular(10),
                                //       )),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async{
                                   Emailtext = emailController.text;
                                   bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Emailtext);

                                    if (Emailtext!="" && emailValid) {
                                      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(Emailtext);
                                      if(list.isNotEmpty){
                                        try {
                                         FirebaseAuth.instance
                                              .sendPasswordResetEmail(
                                              email:emailController.text);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text("A link has been sent to your email successfully!")));

                                        } on Exception catch (e) {

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(e.toString())));
                                        }
                                      }
                                      else{
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text(
                                                "User not found!")));
                                      }

                                      }

                                     else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Email Field is empty/invalid!")));
                                    }
                                  },
                                  child: Container(
                                      // margin: EdgeInsets.symmetric(horizontal: 25),
                                      child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.grey.shade700,
                                        size: 20.sp,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)
                                            .forgotPassword,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                              ]),
                          SizedBox(height: 28.h),
                          Center(
                            child: SizedBox(
                              height: 46.h,
                              width: 335.w,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    //showDialog(context: context, builder: (context)=>SizedBox(height: 100,width: width-50,child: CircularProgressIndicator.adaptive()));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Row(
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                CircularProgressIndicator
                                                    .adaptive(
                                                  backgroundColor:
                                                      Color(0xff03045e),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Signing In...",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontFamily: "Inter",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )));

                                    await auth.signInWithEmailPassword(
                                        context,
                                        emailController.text,
                                        passwordController.text);


                                    if (FirebaseAuth.instance.currentUser != null) {
                                      await dbMain.updatePassword(passwordController.text);
                                      // await dbMain.getDocuments();
                                      // await dbMain.getDate().then((val){
                                      //   Date=val;
                                      // });
                                      // if (reservedInstitute[0]==null && !paymentStatus ){
                                      //   await dbMain.getInstitutes();
                                      //   await dbMain.getDormitories();
                                      //   await dbMain.getCheckoutData(reservedInstitute,reservedDormitory);
                                      // }
                                      // await dbMain.getChats();
                                      //await dbMain.updatePassword(passwordController.text);
                                    }
                                    //await auth.signInAnon(context);
                                  },
                                  child: Text(
                                    AppLocalizations.of(context).login,
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
                                  )),
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
                                AppLocalizations.of(context).idonthaveanaccount,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16.sp,
                                ),
                              ),
                              InkWell(
                                enableFeedback: true,
                                onTap: () {
                                  resetAll();
                                  Navigator.pushNamed(
                                      context, schoollevel_page.routeName);

                                },
                                child: Text(
                                  AppLocalizations.of(context).signup,
                                  style: TextStyle(
                                      color: Color(0xff03045e),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "InterBold"),
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
                height: zarf_container_height + 100.h,
                alignment: Alignment.bottomLeft,
                color: Colors.transparent,
                child: Image.asset("assets/images/element3.png"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
