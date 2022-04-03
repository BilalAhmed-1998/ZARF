// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zarf/screens/filteredresults_page.dart';
import 'package:zarf/screens/ref_faq.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:searchfield/searchfield.dart';
import 'package:zarf/services/auth_service.dart';
import '../CustomClasses.dart';
import '../category.dart';
import '../dummydata.dart';
import '../school.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class home_page extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final auth_service auth = auth_service();
  final ScaffoldKey = GlobalKey<ScaffoldState>();

  bool filterLocation2 = true;
  bool filterLocation1 = false;

  bool filterType2 = false;
  bool filterType1 = true;

  double filterDifficultyLevelmin = 1;
  double filterDifficultyLevelmax = 4;

  //double filterDifficultyValue = 1;

  //var filterRangeValue = RangeValues(2, 5);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xff03045e),
        //centerTitle: true,
        title: Image(
          image: AssetImage("assets/images/zarf_logo.png"),
          height: 22.8.h,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => schoolSearch_page(
                      toshowtitle: "Bookmarks", toshowlist: favts),
                ),
              );
            },
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ref_faq(
                    FAQs: FAQs,
                    toshow: "School Questions",
                  ),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.question_circle,
              color: Colors.white,
              size: 22.sp,
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              height: 150.h,
              width: width,
              color: Color(0xff03045e),
              child: Text(
                AppLocalizations.of(context).findBestinSlovakia,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 21.sp),
              ),
            ),
            Container(
              //height: height/2,
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Categories//
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context).category,
                            style: TextStyle(
                                fontFamily: "InterBold",
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w800,
                                fontSize: 16.sp),
                          ),
                        ]),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: height / 6,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){

                              List<Institute> catInstitutes = [];

                              for(var i =0;i<Allinstitutes.length;i++){

                                if(categories[index].title.contains(Allinstitutes[i].category[0])){
                                  catInstitutes.add(Allinstitutes[i]);
                                }

                              }


                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => schoolSearch_page(toshowtitle: categories[index].translation,toshowlist: catInstitutes),
                                ),
                              );

                            },
                            child: Container(
                              child: CategoryCard(
                                  data: categories[index], height: height / 8),
                              padding: EdgeInsets.fromLTRB(0, 3, 6, 2),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 32.h),

                  ///////////////////////////////TOP SCHOOLS//////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200.w,
                            child: Text(
                              AppLocalizations.of(context).topSchools,
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.sp),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => schoolSearch_page(
                                      toshowtitle: AppLocalizations.of(context).topSchools,
                                      toshowlist: TopSchools),
                                ),
                              );
                            },
                            child: Container(

                              child: Row(children: [
                                Text(
                                  AppLocalizations.of(context).seeMore,
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                Icon(Icons.chevron_right,
                                    color: Colors.grey.shade500),
                              ]),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                      color: Colors.transparent,
                      height: height / 3.2,
                      width: width,
                      child: Swiper(
                        itemWidth: 500,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        loop: true,
                        itemCount: TopSchools.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InstituteSearchCard2(
                              height: 100,
                              width: 335.w,
                              institute: TopSchools[index]);
                        },
                        viewportFraction: 0.85,
                        scale: 0.9,
                      )

                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: Allschools[0].length,
                      //     itemBuilder: (context, index) {
                      //       return InstituteCard(
                      //           height: height / 2,
                      //           institute: Allschools[0][index]);
                      //     }),
                      ),
                  SizedBox(height: 6.h),
                  //Popular Schools//
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200.w,
                            child: Text(
                              AppLocalizations.of(context).popularSchools,
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.sp),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => schoolSearch_page(
                                      toshowtitle: AppLocalizations.of(context).popularSchools,
                                      toshowlist: PopularSchools),
                                ),
                              );
                            },
                            child: Row(children: [
                              Text(
                                AppLocalizations.of(context).seeMore,
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                              ),
                              Icon(Icons.chevron_right,
                                  color: Colors.grey.shade500),
                            ]),
                          ),
                        ]),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                      color: Colors.transparent,
                      height: height / 3.2,
                      width: width,
                      child: Swiper(
                        itemWidth: 500,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        loop: true,
                        itemCount: PopularSchools.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InstituteSearchCard2(
                              height: 100,
                              width: 335.w,
                              institute: PopularSchools[index]);
                        },
                        viewportFraction: 0.85,
                        scale: 0.9,
                      )

                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: Allschools[0].length,
                      //     itemBuilder: (context, index) {
                      //       return InstituteCard(
                      //           height: height / 2,
                      //           institute: Allschools[0][index]);
                      //     }),
                      ),
                  SizedBox(height: 6.h),

                  //Colleges You May Like//
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              AppLocalizations.of(context).collegesYouMayLike,
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.sp),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => schoolSearch_page(
                                      toshowtitle: AppLocalizations.of(context).collegesYouMayLike,
                                      toshowlist: Allinstitutes),
                                ),
                              );
                            },
                            child: Row(children: [
                              Text(
                                AppLocalizations.of(context).seeMore,
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                              ),
                              Icon(Icons.chevron_right,
                                  color: Colors.grey.shade500),
                            ]),
                          ),
                        ]),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                      color: Colors.transparent,
                      height: height / 3.2,
                      width: width,
                      child: Swiper(
                        itemWidth: 500,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        loop: true,
                        itemCount: Allinstitutes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InstituteSearchCard2(
                              height: 100,
                              width: 335.w,
                              institute: Allinstitutes[index]);
                        },
                        viewportFraction: 0.85,
                        scale: 0.9,
                      )

                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: Allschools[0].length,
                      //     itemBuilder: (context, index) {
                      //       return InstituteCard(
                      //           height: height / 2,
                      //           institute: Allschools[0][index]);
                      //     }),
                      ),
                  // SizedBox(height: 6.h),
                ],
              ),
            ),
          ]),
          Container(
            margin: EdgeInsets.symmetric(vertical: 125.h, horizontal: 20.w),
            height: 60,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    child: Container(
                        height: 52.h,
                        width: 264.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 18.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/search_icon.png"),
                              size: 22.sp,
                              color: Color(0xff9CA3AF),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Color(0xffD1D5DB),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )

                        // CupertinoSearchTextField(
                        //
                        //   onTap: (){
                        //     showSearch(
                        //         context: context,
                        //         delegate: CustomSearchDelegate(),
                        //     );
                        //
                        //   },
                        //
                        //   padding: EdgeInsets.symmetric(horizontal: 7.w),
                        //   autofocus: false,
                        //   prefixIcon: ImageIcon(
                        //     AssetImage("assets/images/search_icon.png"),
                        //     size: 22.sp,
                        //     color: Color(0xff9CA3AF),
                        //   ),
                        //   placeholderStyle:
                        //   TextStyle(
                        //     color: Color(0xffD1D5DB),
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        //   backgroundColor: Colors.white,
                        //   itemColor: Color(0xffD1D5DB),
                        //   itemSize: 30,
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        ),
                  ),
                  //////Filter Button////
                  InkWell(
                    onTap: () {
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
                            height: 520.h,
                            child: Container(
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(AppLocalizations.of(context).filter,
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
                                        AppLocalizations.of(context).location,
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
                                        AppLocalizations.of(context).type,
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
                                              width: 110.w,
                                              height: 85.h,
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
                                                      AppLocalizations.of(context).state,
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
                                              width: 110.w,
                                              height: 85.h,
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
                                                      AppLocalizations.of(context).private,
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
                                      Container(
                                        width:200.w,
                                        child: Text(
                                          AppLocalizations.of(context).schoolDifficulty,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Color(0xff1F2937),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Inter",
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  //SizedBox(height: 23.h,),
                                  Container(
                                    color: Colors.white,
                                    height: 110.h,
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
                                  // SizedBox(
                                  //   height: 30.h,
                                  // ),
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
                                                  toshowlist: Allinstitutes,
                                                  state: filterType1,
                                                  location: (filterLocation1)?"Propard":"Košice",
                                            )
                                              ),
                                            );

                                          },
                                          child: Text(
                                            AppLocalizations.of(context).viewSchools,
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
                        width: 59.sp,
                        height: 52.sp,
                        // margin: EdgeInsets.symmetric(vertical: height/4.1),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ImageIcon(
                          AssetImage("assets/images/filter_icon.png"),
                          size: 24.sp,
                          color: Color(0xff9CA3AF),
                        )
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
