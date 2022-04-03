import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';


class successfulScreenshot extends StatefulWidget {
 // const successfulScreenshot({Key? key}) : super(key: key);
  static const routeName = '/successfulScreenshot';

  @override
  _successfulScreenshotState createState() => _successfulScreenshotState();
}

class _successfulScreenshotState extends State<successfulScreenshot> {
  void launchViber() async {
    if (!await launch('https://viber.click/421951378595'))
      throw 'Could not launch "Viber"';
  }

  void launchTelegram() async {
    if (!await launch('https://t.me/ZARFstudy'))
      throw 'Could not launch "Telegram"';
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          // IconButton(onPressed: (){
          //
          // }, icon: Icon(CupertinoIcons.clear),color: Colors.black,)
        ],
      ),
      body: Container(
        color: Colors.white,
        width: width,
        //margin: EdgeInsets.symmetric(vertical: 50.h),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image:AssetImage("assets/images/successfulTick.png"),
            ),
            SizedBox(height: 20.h,),
            Text("Чудово! Все готово!",
              style: TextStyle(
                  color: Color(0xff03045e),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'InterBold'),
            ),
            SizedBox(height: 25.h,),
            Container(
              width: 283.w,
              child: Text("Зараз наші співробітники перевіряють ваш знімок екрана. Ми надішлемо вам сповіщення, коли він буде підтверджений.Дякуємо за ваше терпіння!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 2.h,
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Є запитання?",style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13.sp,

                ),),
                InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, login_page.routeName);
                    showMaterialModalBottomSheet(
                      bounce: true,
                      context: context,
                      builder: (context) => StatefulBuilder(builder:
                          (BuildContext context,
                          StateSetter setsheetState) {
                        return Container(
                            height: 177.h,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50.w, vertical: 42.h),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                //telegram
                                InkWell(
                                  onTap: () {
                                    launchTelegram();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/telegram.png',
                                          width: 52.h,
                                          height: 47.h),
                                      SizedBox(
                                        height: 16.sp,
                                      ),
                                      Text(
                                        'Telegram',
                                        style: TextStyle(
                                          color: Color(0xff6b7280),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //telephone
                                // Column(
                                //   children: [
                                //     Image.asset(
                                //         'assets/images/telephone.png'),
                                //     SizedBox(
                                //       height: 16.sp,
                                //     ),
                                //     Text(
                                //       'Telephone',
                                //       style: TextStyle(
                                //         color: Color(0xff6b7280),
                                //         fontSize: 14.sp,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                //viber
                                InkWell(
                                  onTap: () {
                                    launchViber();
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/viber.png'),
                                      SizedBox(
                                        height: 16.sp,
                                      ),
                                      Text(
                                        'Viber',
                                        style: TextStyle(
                                          color: Color(0xff6b7280),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      }),
                    );
                  },
                  child: Text("Зв’яжіться з нами",style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff03045e),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold

                  ),),
                )

              ],)

            
          ],
        ),
      ),

    );
  }
}
