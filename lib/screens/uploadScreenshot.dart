import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zarf/screens/successfulScreenshot.dart';
import 'package:zarf/screens/thankyou_page.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../dummydata.dart';

class uploadScreenshot extends StatefulWidget {
  static const routeName = '/uploadScreenshot';
  @override
  _uploadScreenshotState createState() => _uploadScreenshotState();
}

class _uploadScreenshotState extends State<uploadScreenshot> {
  final ImagePicker _picker = ImagePicker();
  dynamic myimage;
  _imageCamera() async {
    final XFile photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        myimage = File(photo.path);
      });
    }
  }

  _imageGallery() async {
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        myimage = File(image.path);
      });
    }
  }
  void launchViber() async {
    if (!await launch('https://viber.click/421951378595'))
      throw 'Could not launch "Viber"';
  }

  void launchTelegram() async {
    if (!await launch('https://t.me/ZARFstudy'))
      throw 'Could not launch "Telegram"';
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: Text(AppLocalizations.of(context).chooseFromLibrary),
                      onTap: () {
                        _imageGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text(AppLocalizations.of(context).camera),
                    onTap: () {
                      _imageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: .5,
        backgroundColor: Colors.white,
        title: Text("Останній крок",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
        ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:
      Container(
        padding: EdgeInsets.symmetric(vertical: 32,horizontal: 20),
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Дякуємо!",
                style: TextStyle(
                    color: Color(0xff03045e),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'InterBold'),
              ),
              SizedBox(height: 32),
              Container(
                width: 283.w,
                child: Text("Щоб підтвердити ваш платіж і негайно надати вам доступ до всіх переваг, нам потрібен знімок екрана з повідомленням про підтвердження платежу.",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2.h,
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                ),
                ),
              ),
              Text("Будь ласка, завантажте його нижче.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 2.h,
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: myimage != null?Container(
                  //margin: EdgeInsets.symmetric(horizontal: 40),

                  // width: width,
                  // height: height / 6,

                    child:
                    Image.file(
                      myimage,
                      // height: 120.h,
                      //width: 295.w,
                      fit: BoxFit.fill,
                    )

                ):
                Container(
                  //margin: EdgeInsets.symmetric(horizontal: 40),

                  width: width,
                  height: height / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 27,
                      ),
                      Transform.rotate(
                        angle: 270 * 3.14 / 180,
                        child: Icon(
                          Icons.logout,
                          size: 41,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        'Click to upload image',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height:30),
              SizedBox(
                width: 177.w,
                height: 46.h,
                child: ElevatedButton(

                    onPressed: myimage==null?null:() async {
                      await dbMain.updateInvoice(myimage);
                      Navigator.pushNamed(context, successfulScreenshot.routeName);
                    },
                    child: Text(
                      "Відправити",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'InterBold'),
                    ),

                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff03045e),
                     // padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10)
                    )),
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
      ),
    );
  }
}
