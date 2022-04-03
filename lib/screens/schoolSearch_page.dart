import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/school.dart';
import 'package:zarf/screens/ref_faq.dart';

import '../CustomClasses.dart';
import 'filteredresults_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class schoolSearch_page extends StatefulWidget {




  static const routeName = '/schoolSearch_page';
  String toshowtitle;
  List <Institute> toshowlist;
  List<Institute> mainshowlist;

  schoolSearch_page({this.toshowtitle,this.toshowlist}){
   this.mainshowlist = toshowlist;

   // this.mainshowlist = Allinstitutes;

  }

  @override
  _schoolSearch_pageState createState() => _schoolSearch_pageState();
}

class _schoolSearch_pageState extends State<schoolSearch_page> {


  bool filterLocation2 = true;
  bool filterLocation1 = false;

  bool filterType2 = false;
  bool filterType1 = true;

  double filterDifficultyLevelmin = 1;
  double filterDifficultyLevelmax = 4;

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){


            Navigator.of(context).pop();

          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,),
        ),
        title: Text(
         widget.toshowtitle,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ref_faq(
                    FAQs: FAQs,
                    toshow: "School Searching Questions",
                  ),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.question_circle,
              color: Colors.black,
              size: 22.sp,
            ),
          ),
        ],
        ),
      body: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(

                  height: 45,
                  width: width/1.3,
                  child: CupertinoSearchTextField(

                    onChanged: (val){

                      matchString(val);
                    },
                    prefixIcon: Icon(CupertinoIcons.search,
                      color: Colors.grey.shade300,

                    ),

                    placeholderStyle: TextStyle(
                      color: Colors.grey.shade300,

                    ),
                    backgroundColor: Colors.white,
                    //borderRadius: BorderRadius.circular(10),
                    itemSize: 25,

                  ),
                ),
                  InkWell(
                    onTap: (){

                      showMaterialModalBottomSheet(
                        bounce: true,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) => StatefulBuilder(builder:
                            (BuildContext context,
                            StateSetter
                            setsheetState /*You can rename this!*/) {
                          return Container(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 30.w),
                            width: width,
                            height: 504.h,
                            child: Container(
                              child: Column(
                                children: [
                                  Center(
                                    child: Text("Filter",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Color(0xff1F2937),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Inter",
                                        )),
                                  ),
                                  Divider(
                                    color: Color(0xffF4F4F5),
                                    thickness: 2,
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                            "assets/images/location.png"),
                                        size: 17.sp,
                                        color: Color(0xff1F2937),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Color(0xff1F2937),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Inter",
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleButtons(
                                          isSelected: [
                                            filterLocation1,
                                            filterLocation2
                                          ],
                                          selectedColor: Colors.transparent,
                                          renderBorder: false,
                                          color: Color(0xff64748B),
                                          fillColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onPressed: (int index) {
                                            setsheetState(() {
                                              if (index == 0) {
                                                filterLocation1 = true;
                                                filterLocation2 = false;
                                              } else {
                                                filterLocation2 = true;
                                                filterLocation1 = false;
                                              }
                                            });
                                          },
                                          children: [
                                            Container(
                                              width: 99.w,
                                              height: 30,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 8.w, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff03045e),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: (filterLocation1)
                                                    ? Color(0xff03045e)
                                                    : Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Prešov",
                                                  style: TextStyle(
                                                      color: (filterLocation1)
                                                          ? Colors.white
                                                          : Color(0xff03045e),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontFamily: "Inter"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 99.w,
                                              height: 30,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 8.w, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff03045e),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: (filterLocation2)
                                                    ? Color(0xff03045e)
                                                    : Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Košice",
                                                  style: TextStyle(
                                                      color: (filterLocation2)
                                                          ? Colors.white
                                                          : Color(0xff03045e),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontFamily: "Inter"),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 33.h,
                                  ),
                                  Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                            "assets/images/parcel_icon.png"),
                                        size: 17.sp,
                                        color: Color(0xff1F2937),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Type",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Color(0xff1F2937),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Inter",
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleButtons(
                                          isSelected: [
                                            filterType1,
                                            filterType2
                                          ],
                                          selectedColor: Colors.transparent,
                                          renderBorder: false,
                                          color: Color(0xff64748B),
                                          fillColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onPressed: (int index) {
                                            setsheetState(() {
                                              if (index == 0) {
                                                filterType1 = true;
                                                filterType2 = false;
                                              } else {
                                                filterType2 = true;
                                                filterType1 = false;
                                              }
                                            });
                                          },
                                          children: [
                                            Container(
                                              width: 80.w,
                                              height: 80.h,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 8.w, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff03045e),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: (filterType1)
                                                    ? Color(0xff03045e)
                                                    : Colors.white,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                      "assets/images/state_type.png",
                                                    ),
                                                    height: 35.h,
                                                    width: 60.w,
                                                  ),
                                                  SizedBox(
                                                    height: 7.h,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "State",
                                                      style: TextStyle(
                                                          color: (filterType1)
                                                              ? Colors.white
                                                              : Color(
                                                              0xff03045e),
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontFamily: "Inter"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 80.w,
                                              height: 80.h,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 8.w, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff03045e),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: (filterType2)
                                                    ? Color(0xff03045e)
                                                    : Colors.white,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                      "assets/images/private_type.png",
                                                    ),
                                                    height: 33.h,
                                                    width: 60.w,
                                                  ),
                                                  SizedBox(
                                                    height: 7.h,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "Private",
                                                      style: TextStyle(
                                                          color: (filterType2)
                                                              ? Colors.white
                                                              : Color(
                                                              0xff03045e),
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontFamily: "Inter"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 33.h,
                                  ),
                                  Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                            "assets/images/dashboard_icon.png"),
                                        size: 17.sp,
                                        color: Color(0xff1F2937),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "School Difficulty",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Color(0xff1F2937),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Inter",
                                        ),
                                      )
                                    ],
                                  ),
                                  //SizedBox(height: 23.h,),
                                  Container(
                                    color: Colors.white,
                                    height: 100.h,
                                    width: 188.w,
                                    child: FlutterSlider(
                                      handlerHeight: 15.sp,
                                      handlerWidth: 15.sp,
                                      rangeSlider: true,
                                      values: [
                                        filterDifficultyLevelmin,
                                        filterDifficultyLevelmax
                                      ],
                                      max: 5,
                                      min: 1,
                                      onDragging: (index, min, max) {
                                        setState(() {
                                          filterDifficultyLevelmin = min;
                                          filterDifficultyLevelmax = max;
                                        });
                                      },
                                      touchSize: 5,
                                      minimumDistance: 1,
                                      maximumDistance: 5,
                                      tooltip: FlutterSliderTooltip(
                                        disabled: true,
                                      ),
                                      trackBar: FlutterSliderTrackBar(
                                        // activeTrackBarHeight: 2,
                                        // inactiveTrackBarHeight: 2,
                                        inactiveTrackBar: BoxDecoration(
                                          color: Color(0xff6B7280),
                                        ),
                                        activeTrackBar: BoxDecoration(
                                          color: Color(0xff03045e),
                                        ),
                                      ),
                                      step: FlutterSliderStep(step: 1),
                                      jump: true,
                                      hatchMark: FlutterSliderHatchMark(
                                          labelsDistanceFromTrackBar: 35,
                                          linesAlignment:
                                          FlutterSliderHatchMarkAlignment
                                              .right,
                                          labels: [
                                            FlutterSliderHatchMarkLabel(
                                                percent: 0,
                                                label: Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontFamily: "InterSemi",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18.sp,
                                                    color: Color(0xff1F2937),
                                                  ),
                                                )),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 25,
                                                label: Text(
                                                  '2',
                                                  style: TextStyle(
                                                    fontFamily: "InterSemi",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18.sp,
                                                    color: Color(0xff1F2937),
                                                  ),
                                                )),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 50,
                                                label: Text(
                                                  '3',
                                                  style: TextStyle(
                                                    fontFamily: "InterSemi",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18.sp,
                                                    color: Color(0xff1F2937),
                                                  ),
                                                )),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 75,
                                                label: Text(
                                                  '4',
                                                  style: TextStyle(
                                                    fontFamily: "InterSemi",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18.sp,
                                                    color: Color(0xff1F2937),
                                                  ),
                                                )),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 100,
                                                label: Text(
                                                  '5',
                                                  style: TextStyle(
                                                    fontFamily: "InterSemi",
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18.sp,
                                                    color: Color(0xff1F2937),
                                                  ),
                                                )),
                                          ]),
                                      rightHandler: FlutterSliderHandler(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Color(0xff03045e)),
                                          child: Icon(
                                            Icons.circle,
                                            size: 8.sp,
                                            color: Colors.white,
                                          )),
                                      handler: FlutterSliderHandler(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Color(0xff03045e)),
                                          child: Icon(
                                            Icons.circle,
                                            size: 8.sp,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 46.h,
                                      width: 175.w,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => filteredresults_page(
                                                    min: filterDifficultyLevelmin.round(),
                                                    max: filterDifficultyLevelmax.round(),
                                                    toshowlist: this.widget.toshowlist,
                                                    state: filterType1,
                                                    location: (filterLocation1)?"Propard":"Košice",
                                                  )
                                              ),
                                            );

                                          },
                                          child: Text(
                                            "View Schools",
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
                          );
                        }),
                      );


                    },
                    child: Container(
                      width: 24,
                      height: 24,

                        child: ImageIcon(
                          AssetImage("assets/images/filter_icon.png"),
                          size: 24.sp,
                          color: Color(0xffD1D5DB),
                        )
                    ),
                  ),
              ]),
            ),
                  Divider(
                    color: Colors.grey.shade50,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
            //result description
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              //margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
              child: RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context).showing,
                  style: TextStyle(
                    color: Color(0xff6b7280),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter',
                  ),
                  children: [
                    TextSpan(
                      text: this.widget.mainshowlist.length.toString(),
                      style: TextStyle(
                        color: Color(0xff374151),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context).results,
                      style: TextStyle(
                        color: Color(0xff6b7280),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //dormitories
           // for(var i=0;i<Allschools.length;i++)
              Flexible(
              child:
              ListView.builder(
                itemCount: this.widget.mainshowlist.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index)
                {
                  return InstituteSearchCard(
                    width: 335.w,
                    height: 156.h,
                    institute: this.widget.mainshowlist[index],
                  );
                  }
              ),

            ),
          ],
        ),
      ),


    );
  }

  void matchString(String query){

    if (query==""){
      setState(() {
        this.widget.mainshowlist = this.widget.toshowlist;
      });
    }
    else {
      List<Institute> matchQuery = [];
      for (var Institute in this.widget.toshowlist) {
        if (Institute.title.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(Institute);
        }
      }

      setState(() {
        this.widget.mainshowlist = matchQuery;
      });
    }

  }

}
