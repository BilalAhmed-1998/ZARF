
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class demo extends StatefulWidget {

  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            ToggleButtons(
              //disabledBorderColor: Colors.white,
              //borderColor: Colors.white,
              children: [
                for (var i = 0; i < 3; i++)
                  Container(
                    width: 91.w,
                    height: 40.h,
                    margin:
                    EdgeInsets.fromLTRB(
                        0, 0, 8.w, 0),
                    decoration:
                    BoxDecoration(
                      borderRadius:
                      BorderRadius
                          .circular(8),
                      color:
                      Color(0xfff8fafc),
                    ),
                    child: Center(
                      child: Text(
                        'temp',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight:
                            FontWeight
                                .bold,
                            fontFamily:
                            "Inter"),
                      ),
                    ),
                  ),
              ],
              isSelected: [true,false,false],
              selectedColor:
              Color(0xff03045E),
              renderBorder: false,
              color: Color(0xff64748B),
              fillColor: Colors.transparent,
              splashColor:
              Colors.transparent,

              onPressed: (int index) {
                print("index");
                print(index);
              },
            ),
          ]),
    );
  }
}
