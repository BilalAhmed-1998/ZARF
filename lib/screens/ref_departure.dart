import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../dummydata.dart';

class ref_departure extends StatelessWidget {
  static const routeName = '/ref_departure';

  Row instructions(String s, width) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 12,
          child: Icon(
            Icons.check,
            color: Color(0xff03045E),
            size: 20,
          ),
        ),
        Container(
          width: width - 100,
          child: Text(
            ' $s ',
            style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 14,
                fontFamily: ('Inter'),
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            AppLocalizations.of(context).depButton,
            style: TextStyle(
                color: Color(0xff303030),
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: 'Interbold'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff03045e),
                      ),
                    ),
                    child: Stack(children: [
                      Align(
                        child: Image.asset('assets/images/ref3.png'),
                        alignment: Alignment.centerRight,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).count,
                              style: TextStyle(
                                  color: Color(0xff6B7280),
                                  fontSize: 14,
                                  fontFamily: ('inter'),
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CountdownTimer(
                              endTime: Date.millisecondsSinceEpoch,
                              widgetBuilder: (_, CurrentRemainingTime time) {
                                if (time == null) {
                                  return Text(' ');
                                }
                                return Text(
                                  '${time.days}D ${time.hours}h ${time.min}m ${time.sec}s',
                                  style: TextStyle(
                                      color: Color(0xff1F2937),
                                      fontSize: 22,
                                      fontFamily: ('InterBold'),
                                      fontWeight: FontWeight.w800),
                                );
                              },
                            ),
                            Text(
                              AppLocalizations.of(context).untilYourArrival,
                              style: TextStyle(
                                  color: Color(0xff6B7280),
                                  fontSize: 12,
                                  fontFamily: ('inter'),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 30,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff8a959e).withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 40,
                        offset: Offset(0, 8),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        AppLocalizations.of(context).transportInstruct,
                        style: TextStyle(
                            color: Color(0xff1F2937),
                            fontSize: 16,
                            fontFamily: ('InterBold'),
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        DateTime.now().isBefore(Date)?'$departureText':'Вам ще не призначена дата прибуття до Словаччини. Як тільки ми призначимо дату то відправимо вам повідомлення.f',
                        style: TextStyle(
                            color: Color(0xff6B7280),
                            fontSize: 14,
                            fontFamily: ('Inter'),
                            fontWeight: FontWeight.w500),
                      ),

                      // instructions(
                      //     "Lorem ipsum dolor sit amet, consectetur", width),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // instructions("dolor sit amet, lorem ipsum.", width),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // instructions(
                      //     "Lorem ipsum dolor sit amet, consectetur", width),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // instructions("dolor sit amet, lorem ipsum.", width),
                      // SizedBox(
                      //   height: 25,
                      // ),

                    ],
                  ),
                ),

                Container(
                    margin: EdgeInsets.symmetric(vertical: 100),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff03045E),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).myOwnTransport,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: ('InterBold'),
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
