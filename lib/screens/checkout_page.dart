import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/dormitorydetail_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/schooldetail_page.dart';
import 'package:zarf/screens/thankyou_page.dart';
import 'package:zarf/screens/contract_page.dart';
import 'package:zarf/screens/uploadScreenshot.dart';
import 'package:zarf/services/app_user.dart';

import '../dormitory.dart';
import '../school.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zarf/services/api_service.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'loadingScreen.dart';

class checkout_page extends StatefulWidget {
  static const routeName = '/checkout_page';
  Institute institute;

  bool seatsFull = false;

  checkout_page() {
    if (seatsLeft == 0) {
      seatsFull = true;
    }
  }

  @override
  _checkout_pageState createState() => _checkout_pageState();
}

class _checkout_pageState extends State<checkout_page> {
  @override
  void initState() {
    super.initState();
    print(globalInvoiceID);
  }

  String summaryTotal(double premiumTotal, double promoSaving) {
    sumTotal = premiumTotal - promoSaving;
    return sumTotal.toString();
  }

  InvoiceData inv = InvoiceData();

  void launchViber() async {
    if (!await launch('https://viber.click/421951378595'))
      throw 'Could not launch "Viber"';
  }

  void launchTelegram() async {
    if (!await launch('https://t.me/ZARFstudy'))
      throw 'Could not launch "Telegram"';
  }

  String _local;
  Future<String> _createPDF(String id) async {
    if (_local == null) {
      //Get external storage directory
      final directory = await getApplicationDocumentsDirectory();

      List<int> bytes = await ApiService().getPDF(id);
      //Get directory path
      final path = directory.path;

      //Create an empty file to write PDF data
      File file = File('${path}/Zarf Invoice.pdf');

      //Write PDF data
      await file.writeAsBytes(bytes, flush: true);
      //Open the PDF document in mobile
      //OpenFile.open('$path/Zarf Invoice.pdf');
      return path + "/Zarf Invoice.pdf";
    } else {
      return _local;
    }
  }

  List<double> _payonce = [1699, 1699];
  List<double> _threepayments = [1749, 600, 549, 600];
  List<double> _fivepayments = [1799, 500, 400, 350, 300, 249];

  Signee _signee = Signee();
  List<ImageIcon> radios = [
    ImageIcon(
      AssetImage('assets/images/Group.png'),
      size: 22,
      color: Colors.white,
    ),
    ImageIcon(
      AssetImage('assets/images/circleradiooff.png'),
      size: 22,
      color: Colors.grey.shade400,
    ),
    ImageIcon(
      AssetImage('assets/images/circleradiooff.png'),
      size: 22,
      color: Colors.grey.shade400,
    ),
  ];
  String catTemp(Institute institute) {
    String cat = "";
    for (int j = 0; j < institute.category.length; j++)
      institute.category.length == institute.category.length - 1
          ? cat += institute.category[j] + ""
          : cat += institute.category[j] + ",";
    return cat;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  String birthDateInString = '25 квітня 1990 року';
  bool promo = false;
  double tablelastwidth=200;
  double dis; //if promo code is in discount it recieves sum;
  bool pnot = true; //check if no promo entered;
  bool previewContract = globalInvoiceID != null;
  double promoSaving = 0;
  double premiumTotal = 1699;
  double sumTotal = 1699;
  List<bool> _isopen = [true, false, false];
  String invoiceID = globalInvoiceID;
  int downloading = 0;
  String downloadButtonMessage = "Show Invoice";
  void downloadTrue() async {
    _local = await _createPDF(invoiceID);
    setState(() {
      downloading = 1;
      downloadButtonMessage = "Send via email";
      _local = _local;
    });
  }

  void downloadPDF() async {
    bool sent=await ApiService()
        .sendPDFtoEmail(invoiceID, globalUser.userData.email);

    if (sent) {
      setState(() {
        downloading = 3;
        downloadButtonMessage = "Email sent";
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  //margin: EdgeInsets.only(top:20),
                  height: 60.sp,
                    width:width,
                  color: Colors.yellowAccent,
                  child: Center(
                    child: Text(
                      "${AppLocalizations.of(context).hurryupThereareonly}$seatsLeft${AppLocalizations.of(context).spotsLeft}",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right:20),
                  padding: EdgeInsets.only(top:80.h),
                  // color: Colors.green,
                  child: SingleChildScrollView(
                    child: widget.seatsFull?AlertDialog(
                      title: Center(
                        child: Text(
                          "Reminder",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: Container(
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Text(
                              "oh no! It looks like all 150 spots for this year are already taken!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff03045e),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text:
                                  'There is a chance, however that some spots will free up in the upcoming days. Click on ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'notify me',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                        ", and we'll send you a notification when a spot opens up! ")
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(height: 20),
                            ElevatedButton(
                                onPressed: () {},
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      "Notify me",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff03045e),
                                      ),
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 0,
                                  side: BorderSide(
                                      color: Color(0xff03045e),
                                      style: BorderStyle.solid),

                                  //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(height: 20),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                  "Or don't leave your future to chance and visit\n",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                      "www.zarfstudy.com/last-minute-future\n",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff03045e),
                                        fontSize: 15,
                                        fontFamily: "InterBold",
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          final url = 'https://www.zarfstudy.com';
                                          if (await canLaunch(url)) {
                                            await launch(
                                              url,
                                              forceSafariVC: false,
                                            );
                                          }
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                      "to book one of our amazing alernative services that will help you get to the schoool of your dreams in Slovakia without any difficulties.\n\n",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontFamily: "InterBold",
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                      "Have Questions? ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontFamily: "Inter",
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                      "Contact us",
                                      style: TextStyle(
                                        decoration:TextDecoration.underline,
                                        color: Color(0xff03045e),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Inter",
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
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

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ):
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        Text(
                          "\n\n"+AppLocalizations.of(context).primarySchool,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'InterBold'),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          AppLocalizations.of(context).school,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            hideCheckOut = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => schooldetail_page(
                                  institute: reservedInstitute[0],
                                  context: context,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            //height: 170.h,
                            child: InstituteCard(
                              width: 335.w,
                              height: 170.h,
                              institute: reservedInstitute[0],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                catTemp(reservedInstitute[0]),
                                style: TextStyle(
                                    color: Color(0xff1F2937),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'InterBold'),
                              ),
                              TextButton(
                                onPressed: () async{
                                  checkChange = 0;
                                  fromCheckout = true;
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context)
                                      {
                                        return loadingScreen();

                                      });

                                  if(Allinstitutes.length==0 ) {
                                    await dbMain.getPopularandTopInstitutes(
                                        globalisUniversity?"Popular Schools":"Popular HighSchools");
                                    await dbMain.getPopularandTopInstitutes(
                                        globalisUniversity?"Top Schools":"Top HighSchools");
                                    await dbMain.getInstitutes(globalisUniversity?"Schools":"HighSchools");
                                    if(globalisUniversity)
                                      await dbMain.getCollegeDormitories();
                                    else
                                      await dbMain.getSchoolDormitories();

                                  }
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, home_page.routeName);

                                  // Navigator.pushNamedAndRemoveUntil(
                                  //     context, home_page.routeName, (route) => false);
                                },
                                child: Text(
                                  AppLocalizations.of(context).changeSchool,
                                  style: TextStyle(
                                    color: Color(0xff03045e),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context).dormitory,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 8,
                        ),

                        InkWell(
                          onTap: () {
                            hideCheckOut = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dormitorydetail_page(
                                  dormitory: reservedDormitory[0],
                                ),
                              ),
                            );
                          },
                          child: Stack(children: [
                            Container(
                              //height: 170.h,
                              child: DormitoryCard1(
                                //width: width-30,
                                height: 170.h,
                                dormitory: reservedDormitory[0],
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.only(top:155),
                              alignment: Alignment.bottomRight,
                              height: 220.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () async{
                                      fromCheckout = true;

                                      checkChange = 0;
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context)
                                          {
                                            return loadingScreen();

                                          });

                                        if(Allinstitutes.length==0 ) {
                                          await dbMain.getPopularandTopInstitutes(
                                              globalisUniversity?"Popular Schools":"Popular HighSchools");
                                          await dbMain.getPopularandTopInstitutes(
                                              globalisUniversity?"Top Schools":"Top HighSchools");
                                          await dbMain.getInstitutes(globalisUniversity?"Schools":"HighSchools");
                                          if(globalisUniversity)
                                          await dbMain.getCollegeDormitories();
                                          else
                                            await dbMain.getSchoolDormitories();
                                        }
                                        Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                dormitorySearch_page(
                                              distanceCalculatedList:
                                                  dormitories,
                                            ),
                                          ));

                                      // Navigator.pushNamedAndRemoveUntil(
                                      //     context,
                                      //     dormitorySearch_page.routeName,
                                      //     (route) => false);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context).changeDorm,
                                      style: TextStyle(
                                        color: Color(0xff03045e),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 85.h,
                        ),
                        Text(
                          AppLocalizations.of(context).alternativeSchool,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'InterBold'),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          AppLocalizations.of(context).school,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            hideCheckOut = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => schooldetail_page(
                                  institute: reservedInstitute[1],
                                  context: context,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            //height: 170.h,
                            child: InstituteCard(
                              width: 335.w,
                              height: 170.h,
                              institute: reservedInstitute[1],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                catTemp(reservedInstitute[1]),
                                style: TextStyle(
                                    color: Color(0xff1F2937),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'InterBold'),
                              ),
                              TextButton(
                                onPressed: () async{
                                  fromCheckout = true;
                                  checkChange = 1;
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context)
                                      {
                                        return loadingScreen();

                                      });

                                  if(Allinstitutes.length==0 ) {
                                    await dbMain.getPopularandTopInstitutes(
                                        globalisUniversity?"Popular Schools":"Popular HighSchools");
                                    await dbMain.getPopularandTopInstitutes(
                                        globalisUniversity?"Top Schools":"Top HighSchools");
                                    await dbMain.getInstitutes(globalisUniversity?"Schools":"HighSchools");
                                    if(globalisUniversity)
                                      await dbMain.getCollegeDormitories();
                                    else
                                      await dbMain.getSchoolDormitories();
                                  }
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, home_page.routeName);

                                  // Navigator.pushNamedAndRemoveUntil(
                                  //     context, home_page.routeName, (route) => false);
                                },
                                child: Text(
                                  AppLocalizations.of(context).changeSchool,
                                  style: TextStyle(
                                    color: Color(0xff03045e),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context).dormitory,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 8,
                        ),

                        InkWell(
                          onTap: () {
                            hideCheckOut = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dormitorydetail_page(
                                  dormitory: reservedDormitory[1],
                                ),
                              ),
                            );
                          },
                          child: Stack(children: [
                            Container(
                              //height: 170.h,
                              child: DormitoryCard1(
                                //width: width-30,
                                height: 170.h,
                                dormitory: reservedDormitory[1],
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.only(top:155),
                              alignment: Alignment.bottomRight,
                              height: 220.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: ()async {
                                      fromCheckout = true;
                                      checkChange = 1;
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context)
                                          {
                                            return loadingScreen();

                                          });

                                      if(Allinstitutes.length==0 ) {
                                        await dbMain.getPopularandTopInstitutes(
                                            globalisUniversity?"Popular Schools":"Popular HighSchools");
                                        await dbMain.getPopularandTopInstitutes(
                                            globalisUniversity?"Top Schools":"Top HighSchools");
                                        await dbMain.getInstitutes(globalisUniversity?"Schools":"HighSchools");
                                        if(globalisUniversity)
                                          await dbMain.getCollegeDormitories();
                                      else
                                        await dbMain.getSchoolDormitories();
                                    }
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                dormitorySearch_page(
                                              distanceCalculatedList:
                                                  dormitories,//alternativeDistanceCalculatedDormitories,
                                            ),
                                          ));
                                      // Navigator.pushNamedAndRemoveUntil(
                                      //     context,
                                      //     dormitorySearch_page.routeName,
                                      //     (route) => false);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context).changeDorm,
                                      style: TextStyle(
                                        color: Color(0xff03045e),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 31.h,
                        ),

                        /////////////////////////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.check_circle,
                                color: Color(0xff03045e),
                                size: 40.sp,
                              ),
                            ),
                            Container(
                              child: Text(
                                AppLocalizations.of(context).greatYouAreAllset,
                                style: TextStyle(
                                    color: Color(0xff374151),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                CupertinoIcons.question_circle,
                                color: Color(0xff03045e),
                                size: 18.sp,
                              ),
                              InkWell(
                                enableFeedback: true,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ref_faq(
                                        toshow: AppLocalizations.of(context).checkout,
                                        FAQs: FAQs,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context)
                                      .frequentlyaskedquestions,
                                  style: TextStyle(
                                    color: Color(0xff03045e),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 55.h,
                            child: Divider(
                              thickness: 2,
                              color: Color(0xfff4f4f5),
                            )),
                        //referral
                        Text(
                          AppLocalizations.of(context).referralCode,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          AppLocalizations.of(context).cameFromFriend,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(height: 2.h),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: AppLocalizations.of(context).enterPromoandGet,
                              style: TextStyle(
                                color: Color(0xff6B7280),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Inter',
                              ),
                              children: [
                                TextSpan(
                                  text: ' ' +
                                      AppLocalizations.of(context).off +
                                      "50" +
                                      '€!',
                                  style: TextStyle(
                                    color: Color(0xff03045e),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Inter',
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(height: 18.h),
                        Container(
                          child: Stack(
                            children: [
                              TextField(
                                controller: referralController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                    fillColor: Color(0xffF8FAFC),
                                    filled: true,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: AppLocalizations.of(context)
                                        .enterPromoCodeHere,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    )),
                              ),
                              //promo code check
                              Positioned(
                                child: InkWell(
                                  onTap: () async {
                                    pnot = false;
                                    if (referralController.text != globalUser.uid) {
                                      promo = await dbMain
                                          .checkExist(referralController.text);
                                      dis= await dbMain.getDiscount(referralController.text);
                                      setState(() {
                                        promo = promo;
                                        if (promo == true) {
                                          promoSaving = 50;
                                        }
                                        else if (dis!=null){
                                          promoSaving = dis;
                                          promo=true;
                                        }
                                        else
                                          promoSaving=0;
                                      });
                                    } else {
                                      promo = false;
                                    }
                                  },
                                  child: Container(
                                      height: 52.sp,
                                      width: 118.sp,
                                      child: Center(
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                size: 28.sp.sp,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                AppLocalizations.of(context).apply,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xff03045e),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                        ),
                                      )),
                                ),
                                right: 0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //print when the promo code in valid
                        promo
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                    Icon(
                                      Icons.check,
                                      size: 28.sp.sp,
                                      color: Color(0xff03045e),
                                    ),
                                    Text(
                                      AppLocalizations.of(context).promoCodeActivated,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter',
                                        color: Color(0xff03045e),
                                      ),
                                    ),
                                  ])
                            : (pnot == false)
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                        Icon(
                                          Icons.info_outline,
                                          size: 28.sp.sp,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'Enter a valid Promo Code',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter',
                                            color: Colors.red,
                                          ),
                                        ),
                                      ])
                                : Container(),

                        SizedBox(
                          height: 30.h,
                        ),
                        Divider(color: Color(0xffF4F4F5), thickness: 1.sp),
                        SizedBox(
                          height: 30.h,
                        ),
                        //summary
                        Text(
                          AppLocalizations.of(context).summary,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).zarfPremium,
                                style: TextStyle(
                                    color: Color(0xff4B5563),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                premiumTotal.toString() + "€",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).referralCode,
                                style: TextStyle(
                                    color: Color(0xff4B5563),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                promo ? promoSaving.toString() : '-',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: Color(0xfff8fafc),
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).total,
                                style: TextStyle(
                                  color: Color(0xff03045E),
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                summaryTotal(premiumTotal, promoSaving) + '€',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 88.h,
                        ),
                        Text(
                          AppLocalizations.of(context).splitPayment,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xfff4f4f5),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        //*********************?????????????????????????/////////////////////////
                        Container(
                          width: 335.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            border: Border.all(
                              color: _isopen[0] ? Color(0xff03045e) : Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff8a959e).withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 40,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                          child: ExpansionTile(
                            onExpansionChanged: (bool a) {
                              premiumTotal=1699;
                              final temp=summaryTotal(premiumTotal, promoSaving);
                              setState(() {
                                _isopen[0] = true;
                                _isopen[1] = false;
                                _isopen[2] = false;
                              });
                            },
                            tilePadding: EdgeInsets.fromLTRB(14.w, 16.h, 17.w, 14.h),
                            leading: Container(
                              width: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      _isopen[0]
                                          ? Icon(
                                              CupertinoIcons
                                                  .smallcircle_fill_circle_fill,
                                              color: Color(0xff03045e),
                                            )
                                          : Icon(
                                              CupertinoIcons.circle,
                                              color: Color(0xff9fa6b2),
                                            ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        AppLocalizations.of(context).payOnce,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 30.w),
                                      Text(
                                        AppLocalizations.of(context).saveBig,
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14.sp,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            trailing: Container(
                              width: 100.w,
                              child: Column(
                                children: [
                                  Align(
                                    child: Text(
                                      _payonce[0].toString() + '€',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                  ),
                                  SizedBox(height: 4.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      AppLocalizations.of(context).discount + ' 50€',
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterBold'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            title: SizedBox(height: 0, width: 0),
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 15.h, left: 20.w, right: 157.w, bottom: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //color: Color(0xfff1f5f9),
                                    border: Border(
                                      top: BorderSide(color: Color(0xff030454e)),
                                    )),
                                child: Table(
                                  columnWidths: {
                                    0: FixedColumnWidth(75),
                                    1: FixedColumnWidth(100),
                                    2: FixedColumnWidth(tablelastwidth),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(AppLocalizations.of(context).no,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(AppLocalizations.of(context).sum,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(AppLocalizations.of(context).due,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ])
                                  ],
                                ),
                              ),
                              Container(
                                height: 100.h,
                                width: width,
                                padding: EdgeInsets.fromLTRB(20.w, 11.h, 13.w, 23.h),
                                decoration: BoxDecoration(
                                  color: Color(0xffF1F5F9),
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20.sp,
                                            color: Color(0xff03045E),
                                          ),
                                          Text(
                                            '#1 ' +
                                                AppLocalizations.of(context)
                                                    .mostPopular,
                                            style: TextStyle(
                                                color: Color(0xff03045E),
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Inter'),
                                          ),
                                        ]),
                                    SizedBox(height: 10.sp),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    }, children: [
                                      TableRow(children: [
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: 22.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Inter'),
                                        ),
                                        Text(
                                          _payonce[0].toString() + '€',
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Inter'),
                                        ),
                                        Text(
                                          AppLocalizations.of(context).dueNow,
                                          style: TextStyle(
                                              color: Color(0xff6B7280),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Inter'),
                                        ),
                                      ]),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                            initiallyExpanded: true,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //second
                        Container(
                          width: 335.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            border: Border.all(
                              color: _isopen[1] ? Color(0xff03045e) : Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff8a959e).withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 40,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                          child: ExpansionTile(
                            onExpansionChanged: (bool a) {
                              premiumTotal=1749;
                              final temp=summaryTotal(premiumTotal, promoSaving);
                              setState(() {
                                _isopen[0] = false;
                                _isopen[1] = true;
                                _isopen[2] = false;
                              });
                            },
                            tilePadding: EdgeInsets.fromLTRB(14.w, 16.h, 17.w, 14.h),
                            leading: Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      _isopen[1]
                                          ? Icon(
                                              CupertinoIcons
                                                  .smallcircle_fill_circle_fill,
                                              color: Color(0xff03045e),
                                            )
                                          : Icon(
                                              CupertinoIcons.circle,
                                              color: Color(0xff9fa6b2),
                                            ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        AppLocalizations.of(context).threePayments,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      Text(
                                        AppLocalizations.of(context).standard,
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14.sp,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            trailing: Container(
                              width: 100,
                              child: Column(
                                children: [
                                  Align(
                                    child: Text(
                                      _threepayments[0].toString() + '€',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                  ),
                                  SizedBox(height: 4.h),
                                ],
                              ),
                            ),
                            title: SizedBox(height: 0, width: 0),
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 15.h, left: 20.w, right: 157.w, bottom: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //color: Color(0xfff1f5f9),
                                    border: Border(
                                      top: BorderSide(color: Color(0xff030454e)),
                                    )),
                                //////////////////////////
                                child: Table(
                                  columnWidths: {
                                    0: FixedColumnWidth(75),
                                    1: FixedColumnWidth(100),
                                    2: FixedColumnWidth(tablelastwidth),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(AppLocalizations.of(context).no,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(AppLocalizations.of(context).sum,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(AppLocalizations.of(context).due,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ])
                                  ],
                                ),
                              ),
                              Container(
                                width: width,
                                padding: EdgeInsets.fromLTRB(20.w, 11.h, 13.w, 23.h),
                                decoration: BoxDecoration(
                                  color: Color(0xffF1F5F9),
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(width: 35.h),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _threepayments[1].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).dueNow,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ])
                                        ]),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '2',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _threepayments[2].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .afterApplication,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                        ]),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _threepayments[3].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .afterResidencePermit,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                        ]),
                                  ],
                                ),
                              ),
                            ],
                            initiallyExpanded: false,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 335.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            border: Border.all(
                              color: _isopen[2] ? Color(0xff03045e) : Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff8a959e).withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 40,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                          child: ExpansionTile(
                            onExpansionChanged: (bool a) {
                              premiumTotal=1799;
                              final temp=summaryTotal(premiumTotal, promoSaving);
                              setState(() {
                                _isopen[0] = false;
                                _isopen[1] = false;
                                _isopen[2] = true;
                              });
                            },
                            tilePadding: EdgeInsets.fromLTRB(14.w, 16.h, 17.w, 14.h),
                            leading: Container(
                              width: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      _isopen[2]
                                          ? Icon(
                                              CupertinoIcons
                                                  .smallcircle_fill_circle_fill,
                                              color: Color(0xff03045e),
                                            )
                                          : Icon(
                                              CupertinoIcons.circle,
                                              color: Color(0xff9fa6b2),
                                            ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        AppLocalizations.of(context).fiveTimes,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    AppLocalizations.of(context).payLater,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14.sp,
                                        fontFamily: 'Inter'),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Container(
                              width: 100,
                              child: Column(
                                children: [
                                  Align(
                                    child: Text(
                                      _fivepayments[0].toString() + '€',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                  ),
                                  SizedBox(height: 4.h),
                                ],
                              ),
                            ),
                            title: SizedBox(height: 0, width: 0),
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 15.h, left: 20.w, right: 157.w, bottom: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //color: Color(0xfff1f5f9),
                                    border: Border(
                                      top: BorderSide(color: Color(0xff030454e)),
                                    )),
                                child: Table(
                                  columnWidths: {
                                    0: FixedColumnWidth(75),
                                    1: FixedColumnWidth(100),
                                    2: FixedColumnWidth(tablelastwidth),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(AppLocalizations.of(context).no,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(AppLocalizations.of(context).sum,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(AppLocalizations.of(context).due,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ])
                                  ],
                                ),
                              ),
                              Container(
                                width: width,
                                padding: EdgeInsets.fromLTRB(20.w, 11.h, 13.w, 23.h),
                                decoration: BoxDecoration(
                                  color: Color(0xffF1F5F9),
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Column(
                                  children: [
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _fivepayments[1].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).dueNow,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                        ]),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '2',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _fivepayments[2].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .afterApplication,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                        ]),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _fivepayments[3].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .afterResidencePermit,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                        ]),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '4',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _fivepayments[4].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .afterResidencePermit,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                        ]),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Divider(color: Colors.white),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Table(columnWidths: {
                                      0: FixedColumnWidth(75),
                                      1: FixedColumnWidth(100),
                                      2: FixedColumnWidth(tablelastwidth),
                                    },
                                        //border:TableBorder(bottom: BorderSide(), horizontalInside: BorderSide(), ),
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              '5',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              _fivepayments[5].toString() + '€',
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Inter'),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .afterResidencePermit,
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                        ]),
                                  ],
                                ),
                              ),
                            ],
                            initiallyExpanded: false,
                          ),
                        ),

                        SizedBox(
                            height: 31.h,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xfff4f4f5),
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          AppLocalizations.of(context).contractInformation,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          AppLocalizations.of(context).mustBeFilledOut,
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14.sp,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Builder(builder: (context) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //full name
                                Text(
                                  AppLocalizations.of(context).name,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Igor Zarfchenko',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty || val.length > 20) {
                                      return "invalid input";
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() => _signee.name = val);
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //Surname
                                Text(
                                  AppLocalizations.of(context).surname,
//textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: surnameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Igor Zarfchenko',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty || val.length > 20) {
                                      return "invalid input";
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() => _signee.surname = val);
                                  },
                                ),
                                SizedBox(height: 30),
                                //dob
                                Text(
                                  AppLocalizations.of(context).dob,
//textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: dateController,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () async {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    final datePick = await showDatePicker(
                                      context: context,
                                      initialDate: new DateTime.now(),
                                      firstDate: new DateTime(1950),
                                      lastDate: new DateTime.now(),
                                    );
                                    if (datePick != null &&
                                        datePick != _signee.birthDate) {
                                      setState(() {
                                        _signee.birthDate = datePick;
                                        // put it here
                                        birthDateInString =
                                            "${_signee.birthDate.month}/${_signee.birthDate.day}/${_signee.birthDate.year}";
                                        dateController.text =
                                            birthDateInString; // 08/14/2019
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: birthDateInString,
                                      suffixIcon: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.grey[500],
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                  // ignore: missing_return
                                  validator: (val) {
                                    if (dateController.text.isEmpty) {
                                      return 'Please select date';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //Address
                                Text(
                                  AppLocalizations.of(context).address,
//textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: addressController,
                                  keyboardType: TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Zaluzzie 28',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty || val.length > 100) {
                                      return "invalid input";
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() => _signee.address = val);
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //City
                                Text(
                                  AppLocalizations.of(context).city,
//textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: cityController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Mukachevo',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty || val.length > 20) {
                                      return "invalid input";
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() => _signee.city = val);
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //Countery
                                Text(
                                  AppLocalizations.of(context).country,
//textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: countryController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Ukraine',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty || val.length > 20) {
                                      return "invalid input";
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() => _signee.country = val);
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //taxpayer
                                Text(
                                  AppLocalizations.of(context).tax,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'InterBold'),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: taxController,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: '032265652',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty || val.length != 10) {
                                      return "Input must be equal to 10 digits";
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() => _signee.taxNumber = val);
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          height: 46.h,
                        ),
                        Text(
                          "Будь ласка, уважно перевірте деталі. Після підписання договору ми не зможемо внести зміни.",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14.sp,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        !previewContract
                            ? Center(
                                child: SizedBox(
                                  height: 59.h,
                                  width: 200.w,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        final form = _formKey.currentState;
                                        if (form.validate()) {
                                          form.save();
                                          List<int> temp = [1, 3, 5];
                                          List<double> paymentstoSend = [];
                                          int numberOfPayments = 0;
                                          for (int i = 0; i < 3; i++) {
                                            if (_isopen[i] == true) {
                                              numberOfPayments = temp[i];
                                              if (i == 0)
                                                paymentstoSend = _payonce;
                                              else if (i == 1)
                                                paymentstoSend = _threepayments;
                                              else
                                                paymentstoSend = _fivepayments;
                                              paymentstoSend[0]=paymentstoSend[0]-promoSaving;
                                              paymentstoSend[paymentstoSend.length-1]=paymentstoSend[paymentstoSend.length-1]-promoSaving;
                                              break;
                                            }
                                          }
                                          globalUser.signee = _signee;

                                          await dbMain.setParentsData(_signee,numberOfPayments,promoSaving,sumTotal,paymentstoSend);
                                          if (promo && dis==null) {
                                            await dbMain.updateFriends(
                                                referralController.text);
                                          }else if(dis!=null){
                                            await dbMain.decrementDiscountCounter(referralController.text);
                                          }


                                          invoiceID = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => contract_page(
                                                      name: globalUser
                                                          .userData.fullName,
                                                      dob: globalUser
                                                          .userData.birthDate,
                                                      taxNum:
                                                          globalUser.signee.taxNumber,
                                                      address:
                                                          globalUser.userData.address,
                                                      city: globalUser.signee.city,
                                                      country: globalUser.signee.country,
                                                      phone:
                                                          globalUser.userData.phone,
                                                      email:
                                                          globalUser.userData.email,
                                                      accName:
                                                          globalUser.signee.name,
                                                      accDob:
                                                          globalUser.signee.birthDate,
                                                      accAddress:
                                                          globalUser.signee.address,
                                                      primary:
                                                          reservedInstitute[0].title,
                                                      alternative:
                                                          reservedInstitute[1].title,
                                                      summaryTotal: sumTotal,
                                                      noOfPayments: numberOfPayments,
                                                      lastName:
                                                          globalUser.signee.surname,
                                                      payments: paymentstoSend,
                                                      discount: promoSaving,

                                                    )),
                                          );
                                          if (invoiceID != null)
                                            previewContract = true;
                                        }
                                        setState(() {
                                          previewContract = previewContract;
                                        });
                                      },
                                      child: Text(
                                        AppLocalizations.of(context).previewContract,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff03045e),
                                        //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                      )),
                                ),
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 55.h,
                                      width: 204.w,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                size: 28.sp,
                                                color: Color(0xff03045e),
                                              ),
                                              SizedBox(
                                                width: 25.w,
                                              ),
                                              Container(
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .contractComplete,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff03045e),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            elevation: 0,
                                            side: BorderSide(
                                                color: Color(0xff03045e),
                                                style: BorderStyle.solid),

                                            //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                          )),
                                    ),
                                    SizedBox(height: 20.h),
                                    _local != null
                                        ? Container(
                                            height: 700,
                                            //width:400,

                                            child: PDFView(
                                              filePath: _local,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                            ),
                                          )
                                        : Center(
                                            child: Container(
                                                //child:CircularProgressIndicator()
                                                )),
                                    SizedBox(height: 30.h),
                                    SizedBox(
                                      height: 46.h,
                                      width: 177.w,
                                      child: ElevatedButton(
                                          onPressed: downloading == 0
                                              ? downloadTrue
                                              : downloading == 3? null:downloadPDF,
                                          child: Text(
                                            downloadButtonMessage,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff03045e),
                                            //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                        SizedBox(height: 40),
                        SizedBox(
                          height: 10,
                          child: Divider(
                            color: Color(0xfff4f4f5),
                            thickness: 1,
                          ),
                        ),
                        //paywith
                        // SizedBox(height: 20),
                        // Text(
                        //   AppLocalizations.of(context).payWith,
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(
                        //       color: Color(0xff1F2937),
                        //       fontSize: 16.sp,
                        //       fontWeight: FontWeight.bold,
                        //       fontFamily: 'InterBold'),
                        // ),
                        // SizedBox(height: 11.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Icon(CupertinoIcons.smallcircle_fill_circle_fill,
                        //         color: Color(0xff03045e), size: 20.sp),
                        //     SizedBox(
                        //       width: 11.w,
                        //     ),
                        //     Text(
                        //       AppLocalizations.of(context).payWithCard,
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 14.sp,
                        //           fontFamily: 'Inter'),
                        //     ),
                        //     SizedBox(
                        //       height: 25,
                        //       width: 30,
                        //       child: Image.asset(
                        //         'assets/images/mastercard.png',
                        //       ),
                        //     ),
                        //     Expanded(
                        //       flex: 0,
                        //       child: SizedBox(
                        //         height: 30,
                        //         width: 35,
                        //         child: Image.asset('assets/images/visa.png'),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: 8.5 * (width / 10),
                            child: ElevatedButton(
                                onPressed: !previewContract?null:() async {
                                  if (previewContract) {
                                    Navigator.pushNamed(
                                        context, uploadScreenshot.routeName);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Please sign the Contract",
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: const Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                      width: 200,
                                    ));
                                  }
                                },
                                // child:Text(
                                //   "I have paid the Invoice",
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //     fontSize: 16.sp,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.white,
                                //   ),
                                // ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check),
                                    SizedBox(width:5.w),
                                    Text(
                                      AppLocalizations.of(context).iHavealreadypaidtheinvoice,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                      ),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff03045e),
                                  //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                )),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context).haveQuest,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
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
                                            InkWell(
                                              onTap: (){

                                                showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: (context)
                                                    {
                                                      return Dialog(
                                                        backgroundColor: Colors.white,
                                                        child: Container(
                                                          margin: EdgeInsets.all(15),
                                                          width: double.infinity,
                                                          height:height/4,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(6.0),
                                                          ),
                                                          child: Column(
                                                            // mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              SizedBox(width: 6.w,),
                                                              Image.asset(
                                                                  'assets/images/telephone.png'),
                                                              SizedBox(width: 6.w,),
                                                              TextButton(onPressed: (){
                                                                Navigator.pop(context);
                                                                return launch("tel://095 570 05 29");
                                                              }, child:
                                                                  Text(
                                                                    '095 570 05 29',
                                                                    style:TextStyle(
                                                                      decoration:TextDecoration.underline,
                                                                      fontSize: 16.sp,
                                                                      color:Color(0xff03045e),

                                                                    ),
                                                                  ),
                                                              ),
                                                              SizedBox(width: 5.w,),
                                                              Text('або',style:TextStyle(color:Color(0xff6B7280),fontSize: 14.sp)),
                                                              SizedBox(width: 20.w,),
                                                              TextButton(onPressed: (){
                                                                Navigator.pop(context);
                                                                return launch("tel://067 719 81 76");
                                                              }, child:
                                                              Text(
                                                                '067 719 81 76',
                                                                style:TextStyle(
                                                                  decoration:TextDecoration.underline,
                                                                  fontSize: 16.sp,
                                                                  color:Color(0xff03045e),

                                                                ),
                                                              ),
                                                              ),
                                                              SizedBox(width: 5.w,),
                                                            ],
                                                          ),
                                                        ),
                                                      );

                                                    });

                                              },
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/telephone.png'),
                                                  SizedBox(
                                                    height: 16.sp,
                                                  ),
                                                  Text(
                                                    'Telephone',
                                                    style: TextStyle(
                                                      color: Color(0xff6b7280),
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
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
                              child: Text(
                                AppLocalizations.of(context).contactUs,
                                style: TextStyle(
                                  color: Color(0xff03045e),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  )),]
            ),
          )),
    );
  }
}
