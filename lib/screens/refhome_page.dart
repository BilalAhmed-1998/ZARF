import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/ref_earningSettings.dart';
import 'package:zarf/screens/ref_notifications.dart';
import 'package:zarf/screens/ref_documents2.dart';
import 'package:zarf/screens/ref_passport.dart';
import 'package:zarf/screens/ref_payplan.dart';
import 'package:zarf/screens/ref_profile.dart';
import 'package:zarf/services/auth_service.dart';
import 'package:zarf/services/local_notifications.dart';
import 'package:zarf/services/wrapper.dart';
import '../dummydata.dart';
import 'loadingScreen.dart';
import 'ref_documents.dart';
import 'ref_earning.dart';
import 'ref_departure.dart';
import 'ref_messages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

bool _loading;
double _progressValue;


class refhome_page extends StatefulWidget {
  static const routeName = '/refhome_page';

  @override
  _refhome_pageState createState() => _refhome_pageState();
}

class _refhome_pageState extends State<refhome_page> {
  final auth_service auth = auth_service();
  String notificationMsg='400,00';
  String _name="";
  _refhome_pageState(){

    dbMain.getName().then((val) => setState(() {
      _name = val;
    }));
  }

  @override
  void initState() {
    super.initState();

    _loading = false;
    _progressValue = 0.0;
    LocalNotificationService.initialize();
    dbMain.getDocuments();
    //dbMain.getChats();


    FirebaseMessaging.instance.getInitialMessage().then((event){

      if(event!=null && event.notification!=null) {
        LocalNotificationService.showNotificationOnForeground(event);
        setState(() async{
          notificationMsg = "${event.notification.title}";
          messages.add(ChatMessage(messageContent: "Notification.\n"+"${event.notification.title}"+"${event.notification.body}",messageType: "receiver"));
          await dbMain.updateChatsAdmin("Notification.\n"+"${event.notification.title}"+"${event.notification.body}");
        });
        print("coming from terminated");
      }
      else{
        print("null recieved, terminated");
      }
      //Navigator.pushNamed(context, ref_messages.routeName);

    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {

      if(event!=null && event.notification!=null) {
        LocalNotificationService.showNotificationOnForeground(event);
        setState(() async{
          notificationMsg = "${event.notification.title}";
          messages.add(ChatMessage(messageContent: "Notification.\n"+"${event.notification.title}"+"${event.notification.body}",messageType: "receiver"));
          await dbMain.updateChatsAdmin("Notification.\n"+"${event.notification.title}"+"${event.notification.body}");
        });
        print("coming from background");
      }
      else{
        print("null recieved, background");
      }
      //Navigator.pushNamed(context, ref_messages.routeName);

    });

    FirebaseMessaging.onMessage.listen((event) {
      if(event!=null && event.notification!=null) {
        LocalNotificationService.showNotificationOnForeground(event);
        setState(() async{
          notificationMsg = "${event.notification.title}";
          messages.add(ChatMessage(messageContent: "Notification.\n"+"${event.notification.title}"+"${event.notification.body}",messageType: "receiver"));
          await dbMain.updateChatsAdmin("Notification.\n"+"${event.notification.title}"+"${event.notification.body}");
        });
        print("coming from foreground");
      }
      else{
        print("null recieved, foreground");
      }
      Navigator.pushNamed(context, ref_messages.routeName);


    });

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;


////////////////////////////// calling update progress   /////////////////////////

    if(University==false)
      _updateProgress();
    else
      _updateProgress2();
    /////////////////////////////////////////////////////////////////////////


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // endDrawer: Drawer(
        //   child: Container(
        //     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Container(
        //           height: 25,
        //           child: Image.asset("assets/images/zarf_logo.png"),
        //         ),
        //         SizedBox(
        //           height: 50,
        //         ),
        //         InkWell(
        //           onTap: () {
        //             Navigator.pushNamed(context, home_page.routeName);
        //           },
        //           child: Container(
        //             height: 50,
        //             decoration: BoxDecoration(
        //               color: Color(0xff03045e),
        //               borderRadius: BorderRadius.circular(8),
        //             ),
        //             padding: EdgeInsets.symmetric(horizontal: 20),
        //             child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Container(
        //                     height: 35,
        //                     child: Image.asset("assets/images/school1.png"),
        //                   ),
        //                   Text(
        //                     "Schools",
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 20,
        //                     ),
        //                   ),
        //                 ]),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset(
            'assets/images/zarf_logo.png',
            height: 23.h,
          ),
          actions: [
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: ImageIcon(
                      AssetImage("assets/images/ref24.png"),
                      color: Color(0xFF00FFFF),
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ref_earningSettings.routeName);
                    },
                    tooltip: MaterialLocalizations
                        .of(context)
                        .openAppDrawerTooltip,
                  ),
            ),
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(
                      Icons.mail_outline_outlined,
                      color: Color(0xFF00FFFF),
                    ),
                    onPressed: () async{
                      await dbMain.getChats();
                      Navigator.pushNamed(context, ref_messages.routeName);
                    },
                    tooltip: MaterialLocalizations
                        .of(context)
                        .openAppDrawerTooltip,
                  ),
            ),
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Color(0xFF00FFFF),
                    ),
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        bounce: true,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) =>
                            StatefulBuilder(builder: (BuildContext
                            context,
                                StateSetter setsheetState
                                /*You can rename this!*/) {
                              return Scaffold(
                                appBar: AppBar(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  centerTitle: true,
                                  leading: IconButton(
                                    onPressed: () {

                                    },
                                    icon: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,),
                                    ),
                                  ),
                                  title: Text(
                                    AppLocalizations.of(context).settings,
                                    style: TextStyle(
                                        color: Color(0xff303030),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Interbold'
                                    ),
                                  ),
                                ),
                                body: Container(
                                  height: height,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 20, 14, 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ImageIcon(
                                                    AssetImage(
                                                        "assets/images/ref25.png"),
                                                    color: Color(0xff03045E),
                                                    size: 21,
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context).profileDetails,
                                                    style: TextStyle(
                                                      color: Color(0xff03045E),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .w800,
                                                      fontFamily: 'InterBold',
                                                    ),
                                                  ),
                                                ],
                                              ),


                                              ImageIcon(
                                                AssetImage(
                                                    "assets/images/ref28.png"),
                                                color: Color(0xff03045E),
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                        enableFeedback: true,
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, ref_profile.routeName);
                                        },
                                      ),
                                      Divider(
                                        color: Color(0xffF4F4F5),
                                        height: 1,
                                        thickness: 2,
                                      ),
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 20, 14, 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ImageIcon(
                                                    AssetImage(
                                                        "assets/images/ref26.png"),
                                                    color: Color(0xff03045E),
                                                    size: 21,
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context).yourPayment,
                                                    style: TextStyle(
                                                      color: Color(0xff03045E),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .w800,
                                                      fontFamily: 'InterBold',
                                                    ),
                                                  ),
                                                ],
                                              ),


                                              ImageIcon(
                                                AssetImage(
                                                    "assets/images/ref28.png"),
                                                color: Color(0xff03045E),
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                        enableFeedback: true,
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, ref_payplan.routeName);
                                        },
                                      ),
                                      Divider(
                                        color: Color(0xffF4F4F5),
                                        height: 1,
                                        thickness: 2,
                                      ),
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 20, 14, 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ImageIcon(
                                                    AssetImage(
                                                        "assets/images/ref27.png"),
                                                    color: Color(0xff03045E),
                                                    size: 21,
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context).allowNotif,
                                                    style: TextStyle(
                                                      color: Color(0xff03045E),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .w800,
                                                      fontFamily: 'InterBold',
                                                    ),
                                                  ),
                                                ],
                                              ),


                                              ImageIcon(
                                                AssetImage(
                                                    "assets/images/ref28.png"),
                                                color: Color(0xff03045E),
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                        enableFeedback: true,
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              ref_notifications.routeName);
                                        },
                                      ),
                                      Divider(
                                        color: Color(0xffF4F4F5),
                                        height: 1,
                                        thickness: 2,
                                      ),
                                      SizedBox(
                                        height: 410.h,
                                      ),

                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 30),
                                        height: 46,
                                        width: width - 150,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff03045E)),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                5.0)
                                        ),
                                        child: InkWell(
                                          enableFeedback: true,
                                          onTap: () async {
                                            // ScaffoldMessenger.of(context)
                                            //     .showSnackBar(SnackBar(
                                            //     duration: Duration(seconds: 1),
                                            //     content: Row(
                                            //       children: [
                                            //         SizedBox(
                                            //           width: 20,
                                            //         ),
                                            //         CircularProgressIndicator.adaptive(
                                            //           backgroundColor: Color(0xff03045e),
                                            //         ),
                                            //         SizedBox(width: 20,),
                                            //         Text("Signing Out...",
                                            //           style: TextStyle(
                                            //             color: Colors.white,
                                            //             fontSize: 18.sp,
                                            //             fontFamily: "Inter",
                                            //             fontWeight: FontWeight.bold,
                                            //           ),
                                            //         ),
                                            //
                                            //       ],
                                            //     )));
                                            showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context)
                                                {
                                                  return loadingScreen();

                                                });
                                            await auth.signOut(context);
                                            resetAll();
                                            Navigator.pop(context);

                                            Navigator.pushNamedAndRemoveUntil(
                                                context, Wrapper.routeName, (
                                                route) => false);
                                          },
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context).logout,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: 'InterBold',
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff03045E),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                    tooltip: MaterialLocalizations
                        .of(context)
                        .openAppDrawerTooltip,
                  ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  _name.isEmpty?'${AppLocalizations.of(context).hi} ${_name}': '${AppLocalizations.of(context).hi} ${_name.split(" ")[0]}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: ('Interbold'),
                    color: Color(0xff1F2937),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  enableFeedback: true,
                  onTap: (){
                    if(University==false)
                      Navigator.pushNamed(context, ref_documents.routeName);
                    else if(University==true)
                      Navigator.pushNamed(context, ref_documents2.routeName);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff8a959e).withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 40,
                            offset: Offset(0, 8),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Stack(children: [
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/images/image3.png",
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              AppLocalizations.of(context).docuploadProgress,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                fontFamily: ('interbold'),
                                color: Color(0xFF03045E),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            ProgressBar(),
                            SizedBox(
                              height: 14,
                            ),
                            University==false?
                            Text('Завантажено '+counter().toString()+' із 3', //uploaded of
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: ('inter'),
                                  color: Color(0xFF00FFFF),
                                ))
                                :Text('Завантажено '+counter2().toString()+' із 5',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: ('inter'),
                                  color: Color(0xFF00FFFF),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              enableFeedback: true,
                              onTap: () {
                                if(University==false)
                                  Navigator.pushNamed(context, ref_documents.routeName);
                                else if(University==true)
                                  Navigator.pushNamed(context, ref_documents2.routeName);

                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage("assets/images/ref11.png"),
                                      size: 25,
                                      color: Color(0xFF00FFFF),
                                    ),
                                    Text(AppLocalizations.of(context).continueUpload,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: ('interbold'),
                                          color: Color(0xFF00FFFF),
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ])

                    //width: width,
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  enableFeedback: true,
                  onTap: (){
                      Navigator.pushNamed(context, ref_departure.routeName);
                  },
                  child: Container(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 16),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff8a959e).withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 40,
                            offset: Offset(0, 8),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Stack(children: [
                        Container(
                          child: Align(
                            child: Image.asset("assets/images/image4.png"),
                            alignment: Alignment.topRight,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              AppLocalizations.of(context).departure,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                fontFamily: ('interbold'),
                                color: Color(0xFF03045E),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.clock,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(DateTime.now().isBefore(Date)?"${Date.hour}:${Date.minute}:${Date.second}":"",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: ('inter'),
                                      color: Colors.grey[800],
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(DateTime.now().isBefore(Date)?"${DateFormat.yMMMMd('uk_UA')
                                    .format(Date)}":"",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: ('inter'),
                                      color: Color(0xff1F2937),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ])),
                ),
                SizedBox(height: 20),
                InkWell(
                  enableFeedback: true,
                  onTap: () async {
                    leaders.clear();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context)
                        {
                          return loadingScreen();

                        });
                    await dbMain.leaderBoard();
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ref_earning.routeName);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff8a959e).withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 40,
                            offset: Offset(0, 8),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                      child: Stack(children: [
                        Positioned(
                            right: 0,
                            child: Image.asset('assets/images/image5.png')),
                        Container(
                          height: 97.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                AppLocalizations.of(context).referralEarnings,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: ('interbold'),
                                  color: Color(0xFF03045E),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(children: [
                                Text(globalUser.ref.refEarnings.toString(),
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: ('interbold'),
                                      color: Color(0xFF03045E),
                                    )),
                                Icon(
                                  Icons.euro,
                                  color: Color(0xFF03045E),
                                )
                              ])
                            ],
                          ),
                        ),
                      ])),
                )
              ],
            ),

            //child: ProgressBar()
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp),
            currentIndex: 1,
            selectedItemColor: Color(0xff03045E),
            items: [
              BottomNavigationBarItem(
                icon: InkWell(
                  enableFeedback: true,
                  onTap: () async{
                    leaders.clear();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context)
                        {
                          return loadingScreen();

                        });
                    await dbMain.leaderBoard();
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ref_earning.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                    child: ImageIcon(
                      AssetImage("assets/images/ref10.png"),
                      size: 30.sp,
                    ),
                  ),
                ),
                label: AppLocalizations.of(context).referral,
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  enableFeedback: true,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                    child: ImageIcon(
                      AssetImage("assets/images/ref9.png"),
                      size: 30.sp,
                    ),
                  ),
                ),
                label: AppLocalizations.of(context).home,
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  enableFeedback: true,
                  onTap: () {
                    Navigator.pushNamed(context, ref_departure.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                    child: Icon(
                      Icons.airplanemode_active,
                      color: Colors.grey[400],
                      size: 30.sp,
                    ),
                  ),
                ),
                label: AppLocalizations.of(context).depButton,
              )
            ]),
      ),
    );
  }

  int counter() {
    int counter = 0;
    if (passportImage != null)
      counter++;
    if (reportCard8Image != null)
      counter++;
    if (HalfReportcard9image != null)
      counter++;
    return counter;
  }

  int counter2() {
    int counter = 0;
    if (passportImage != null)
      counter++;
    if (reportCard8Image != null)
      counter++;
    if (reportCard9Image != null)
      counter++;
    if (reportCard10Image != null)
      counter++;
    if (HalfReportCard11Image != null)
      counter++;
    return counter;
  }

  void _updateProgress() {
    setState(() {
      if (counter() == 0)
        _progressValue = 0;
      if (counter() == 1)
        _progressValue = 0.3333;
      if (counter() == 2)
        _progressValue = 0.6666;
      if (counter() == 3)
        _progressValue = 1;
      // we "finish" downloading here
    });
  }

  void _updateProgress2() {
    setState(() {
      if (counter2() == 0)
        _progressValue = 0;
      if (counter2() == 1)
        _progressValue = 0.2;
      if (counter2() == 2)
        _progressValue = 0.4;
      if (counter2() == 3)
        _progressValue = 0.6;
      if (counter2() == 4)
        _progressValue = 0.8;
      if (counter2() == 5)
        _progressValue = 1;
      // we "finish" downloading here
    });
  }
}

class ProgressBar extends StatefulWidget {
  @override
  State createState() {
    return ProgressBarState();
  }
}

class ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  // @override
  // void initState() {
  //   super.initState();
  //   controller =
  //       AnimationController(duration: const Duration(seconds: 5), vsync: this);
  //   animation = Tween(begin: 0.0, end: 1.0).animate(controller)
  //     ..addListener(() {
  //       //setState(() {});
  //     });
  //   controller.repeat();
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller.stop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: width / 1.85,
        child: LinearProgressIndicator(
          value: _progressValue,
          backgroundColor: Color(0xff00ffff),
          color: Color(0xff03045E),
          minHeight: 12,
        ),
      ),
    );
  }
}
