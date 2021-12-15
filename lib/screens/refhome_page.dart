import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/home_page.dart';
import 'ref_documents.dart';
import 'ref_earning.dart';
import 'ref_departure.dart';
import 'ref_messages.dart';

class refhome_page extends StatefulWidget {
  static const routeName = '/refhome_page';

  @override
  _refhome_pageState createState() => _refhome_pageState();
}

class _refhome_pageState extends State<refhome_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 25,
                  child: Image.asset("assets/images/zarf_logo.png"),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, home_page.routeName);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff03045e),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 35,
                            child: Image.asset("assets/images/school1.png"),
                          ),
                          Text(
                            "Schools",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset('assets/images/image2.png'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: InkWell(
                  enableFeedback: true,
                  onTap: () {
                    Navigator.pushNamed(context, ref_messages.routeName);
                  },
                  child: Icon(
                    Icons.mail_outline_outlined,
                    color: Color(0xFF00FFFF),
                  ),
                ),
                onPressed: () {},
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  color: Color(0xFF00FFFF),
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                  'Hi Anita!',
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
                Container(
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
                            'Document Upload Progress',
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
                          Text('Uploaded 10 of 15',
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
                              Navigator.pushNamed(context, ref_documents.routeName);
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/ref11.png"),
                                    size: 25,
                                    color: Color(0xFF00FFFF),
                                  ),
                                  Text('Continue Upload',
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
                SizedBox(height: 20),
                Container(
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
                            'Departure',
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
                              Text('14:46pm',
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
                              Text('21st September, 2021',
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
                SizedBox(height: 20),
                Container(
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
                        right:0,

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
                              'Referral Earnigs',
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
                              Text('400,00',
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
                    ]))
              ],
            ),

            //child: ProgressBar()
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.sp
          ),
            currentIndex: 1,
            selectedItemColor: Color(0xff03045E),
            items: [
              BottomNavigationBarItem(
                icon: InkWell(
                  enableFeedback: true,
                  onTap: () {
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
                label: 'Referral',
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
                label: 'Home',
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
                label: 'Departure',
              )
            ]),
      ),
    );
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

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return ClipRRect(
       borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: width/1.85,
        child: LinearProgressIndicator(
          value: animation.value,
          backgroundColor: Color(0xff00ffff),
          color: Color(0xff03045E),
          minHeight: 12,
        ),
      ),
    );
  }
}
