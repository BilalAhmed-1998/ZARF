import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/userform_page.dart';
import 'dormitorySearch_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class toDormitory_page extends StatefulWidget {
  static const routeName = '/toDormitory';

  @override
  _toDormitory_pageState createState() => _toDormitory_pageState();
}

class _toDormitory_pageState extends State<toDormitory_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              Text(
                 "${AppLocalizations.of(context).primaryschoolselected}\n${AppLocalizations.of(context).beforeYouProceed}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter')),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: height / 6.5,
              //   width: width - 40,
              //
              //   margin: const EdgeInsets.only(
              //       bottom: 6.0), //Same as `blurRadius` i guess
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5.0),
              //     color: Colors.white,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           Expanded(
              //             flex: 1,
              //             child: RadioListTile(
              //                 title: Text(
              //                   'Yes',
              //                   style: TextStyle(
              //                       color: Colors.black,
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.bold,
              //                       fontFamily: 'Inter'),
              //                 ),
              //                 value: true,
              //                 toggleable: true,
              //                 activeColor: Color(0xff03045e),
              //                 groupValue: radio,
              //                 onChanged: (value) {
              //                   setState(() {
              //                     radio1 = false;
              //                     radio = true;
              //                   });
              //                 }),
              //           ),
              //           IconButton(
              //             icon: Icon(
              //               Icons.arrow_forward,
              //               color: Colors.black45,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 70.0),
              //         child: Text(
              //           'I want to stay in a dormitory',
              //           style: TextStyle(
              //               color: Colors.grey.shade500,
              //               fontSize: 14,
              //               fontFamily: 'Inter'),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   height: height / 6.5,
              //   width: width - 40,
              //
              //   margin: const EdgeInsets.only(
              //       bottom: 6.0), //Same as `blurRadius` i guess
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5.0),
              //     color: Colors.white,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           Expanded(
              //             flex: 1,
              //             child: RadioListTile(
              //                 title: Text(
              //                   'No',
              //                   style: TextStyle(
              //                       color: Colors.black,
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.bold,
              //                       fontFamily: 'Inter'),
              //                 ),
              //                 value: true,
              //                 toggleable: true,
              //                 activeColor: Color(0xff03045e),
              //                 groupValue: radio1,
              //                 onChanged: (value) {
              //                   setState(() {
              //                     radio = false;
              //                     radio1 = true;
              //                   });
              //                 }),
              //           ),
              //           IconButton(
              //             icon: Icon(
              //               Icons.arrow_forward,
              //               color: Colors.black45,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 70.0),
              //         child: Text(
              //           "I don't want to stay in a dormitory",
              //           style: TextStyle(
              //               color: Colors.grey.shade500,
              //               fontSize: 14,
              //               fontFamily: 'Inter'),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Center(
                child:Image.asset(
                  'assets/images/Choosealternative.png',
                  fit: BoxFit.cover,
                  width: width,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 46.h,
                  width: 335.w,
                  child: ElevatedButton(
                      onPressed: () {
                        checkFirst = false;
                        checkChange = 1;
                        Navigator.pushNamed(
                            context,home_page.routeName);
                      },
                      child: Text(
                        "Далі",//"Next",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
