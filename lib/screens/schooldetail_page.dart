import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:full_screen_image/full_screen_image.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/school.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/fullscreen_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:zarf/screens/toDormitory_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class schooldetail_page extends StatefulWidget {
  Institute institute;
  List<Icon> radiobuttons;
  List<String> salaryexpectation;
  List isSelected;
  List<bool> isSelectedTeaching;
  TeachingPrograms selectedTeachingProgram;

  //Difficulty Handling//
  Color difContainerColor;
  String difContainerText;
  final BuildContext context;
  schooldetail_page({this.institute, this.context}) {
    if (this.institute.institutedetails.rating.round() == 1) {
      difContainerColor = Color(0xffCAF0F8);
      difContainerText = AppLocalizations.of(context).easy;
    } else if (this.institute.institutedetails.rating.round() == 2) {
      difContainerColor = Color(0xff90E0EF);
      difContainerText = AppLocalizations.of(context).normal;
    } else if (this.institute.institutedetails.rating.round() == 3) {
      difContainerColor = Color(0xff00B4D8);
      difContainerText = AppLocalizations.of(context).average;
    } else if (this.institute.institutedetails.rating.round() == 4) {
      difContainerColor = Color(0xff0077B6);
      difContainerText = AppLocalizations.of(context).challenging;
    } else if (this.institute.institutedetails.rating.round() == 5) {
      difContainerColor = Color(0xff03045e);
      difContainerText = AppLocalizations.of(context).hard;
    }

    this.salaryexpectation = List.filled(
        this.institute.institutedetails.teachingprograms.length, "-");

    int row = this.institute.institutedetails.teachingprograms.length;
    isSelected = List.generate(row, (i) => List.filled(this.institute.institutedetails.teachingprograms[i].careers.length, false), growable: false);

    for (var i = 0; i < row; i++) {
      for (var j = 0;
          j <
              this
                  .institute
                  .institutedetails
                  .teachingprograms[i]
                  .careers
                  .length;
          j++) {
        this.isSelected[i][j] = false;
      }
    }

    isSelectedTeaching = List.filled(
        this.institute.institutedetails.teachingprograms.length, false);

    radiobuttons = List.filled(
        this.institute.institutedetails.teachingprograms.length,
        Icon(Icons.radio_button_unchecked));
    radiobuttons[0] = Icon(
      CupertinoIcons.smallcircle_fill_circle_fill,
      color: Color(0xff03045e),
    );
    isSelectedTeaching[0] = true;
    selectedTeachingProgram = institute.institutedetails.teachingprograms[0];
  }

  @override
  _schooldetail_pageState createState() => _schooldetail_pageState();
}

class _schooldetail_pageState extends State<schooldetail_page> {
  List<Institute> catInstitutes = [];
  @override
  void initState() {
    super.initState();
    //similar schools//
    for (var i = 0; i < Allinstitutes.length; i++) {
      if (this.widget.institute != Allinstitutes[i]) if (this
              .widget
              .institute
              .category[0] ==
          Allinstitutes[i].category[0]) {
        catInstitutes.add(Allinstitutes[i]);
      }
    }
  }

  String catTemp() {
    String cat = "";
    for (int j = 0; j < this.widget.institute.category.length; j++)
      this.widget.institute.category.length ==
              this.widget.institute.category.length - 1
          ? cat += this.widget.institute.category[j] + ""
          : cat += this.widget.institute.category[j];
    return cat;
  }

  Icon checkradiobutton = Icon(
    CupertinoIcons.smallcircle_fill_circle_fill,
    color: Color(0xff03045e),
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (hideCheckOut == true) hideCheckOut = false;

              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff303030),
              size: 22.sp,
            ),
          ),
          title: Text(
            AppLocalizations.of(context).schoolProfile,
            style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
              fontFamily: "InterBold",
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ref_faq(
                      toshow: "School Detailed Questions",
                      FAQs: FAQs,
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: 169, //height / 3.5,
                  // width: 335.w,
                  child: Swiper(
                      //outer: true

                      viewportFraction: 0.8,
                      scale: 0.9,
                      layout: SwiperLayout.DEFAULT,
                      scrollDirection: Axis.horizontal,
                      loop: true,
                      outer: false,
                      itemCount:
                          widget.institute.institutedetails.images.length,
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                        color: Color(0xffe5e7eb),
                        activeColor: Colors.white,
                        size: 8.8.sp,
                        activeSize: 12.sp,
                      )),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          enableFeedback: true,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fullscreen_page(
                                          image: widget.institute
                                              .institutedetails.images[index],
                                        )));
                          },
                          child: Container(
                            height: height / 3.5,
                            //width: 335.w,
                            //margin: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
                            child: Hero(
                              tag: "Fullscreen" + index.toString(),
                              child: Stack(children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: this
                                                .widget
                                                .institute
                                                .institutedetails
                                                .images[index]
                                                .runtimeType !=
                                            String
                                        ? FutureBuilder(
                                            future: this
                                                .widget
                                                .institute
                                                .institutedetails
                                                .images[index],
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                return Image.network(
                                                  snapshot.data,
                                                  fit: BoxFit.cover,
                                                );
                                              }

                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Container(
// width: 100,
                                                  height: 400,
                                                  child:
                                                      CircularProgressIndicator
                                                          .adaptive(),
                                                );
                                              }
                                            })
                                        : Image.network(
                                            this
                                                .widget
                                                .institute
                                                .institutedetails
                                                .images[index],
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.institute.institutedetails.institutetype,
                          style: TextStyle(
                            color: Color(0xff0077B6),
                            fontSize: 13.sp,
                            fontFamily: "InterBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          widget.institute.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(children: [
                          ImageIcon(
                            AssetImage("assets/images/location.png"),
                            size: 20.sp,
                            color: Colors.grey.shade500,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            this.widget.institute.location,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(children: [
                          ImageIcon(
                            AssetImage("assets/images/tag.png"),
                            size: 20.sp,
                            color: Colors.grey.shade500,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          (this.widget.institute.public)
                              ? Text(
                                  AppLocalizations.of(context).state,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    color: Colors.grey.shade600,
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context).private,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                          SizedBox(
                            width: 17.w,
                          ),
                          Text(
                            "|",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          ImageIcon(
                            AssetImage("assets/images/box.png"),
                            size: 20.sp,
                            color: Colors.grey.shade500,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            catTemp(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 22.h,
                        ),
                        //rating//
                        Container(
                          height: 30.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                                blurRadius: 30,
                                color: this
                                    .widget
                                    .difContainerColor
                                    .withOpacity(0.4),
                              ),
                            ],
                            color: this.widget.difContainerColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 5.h),
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage("assets/images/dashboard_icon.png"),
                                size: 20.sp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                this
                                    .widget
                                    .institute
                                    .institutedetails
                                    .rating
                                    .round()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Text(
                                this.widget.difContainerText,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SmoothStarRating(
                        //   allowHalfRating: true,
                        //   onRated: (v) {},
                        //   starCount: 5,
                        //   rating: this.widget.institute.institutedetails.rating,
                        //   isReadOnly: true,
                        //   size: 20.sp,
                        //   color: Color(0xffFCD34D),
                        //   borderColor: Colors.black,
                        // ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          AppLocalizations.of(context).tution,
                          style: TextStyle(
                            color: Color(0xff03045E),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            fontSize: 13.sp,
                          ),
                        ),
                        Row(children: [
                          Text(
                            '€' +
                                this
                                    .widget
                                    .institute
                                    .institutedetails
                                    .tutionfee
                                    .toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              fontSize: 22.sp,
                            ),
                          ),
                          Text(
                            '/yr',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 10.h,
                        ),

                        Text(
                          this.widget.institute.institutedetails.description,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 39.h,
                        ),

                        //Teaching Programs////

                        Text(
                          AppLocalizations.of(context).teachingPrograms,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        SizedBox(
                            // height: 920.h*this.widget.institute.institutedetails.teachingprograms.length.toDouble().h,
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var teachingindex = 0;
                                teachingindex <
                                    this
                                        .widget
                                        .institute
                                        .institutedetails
                                        .teachingprograms
                                        .length;
                                teachingindex++)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    print("teaching");
                                    this.widget.radiobuttons[teachingindex] =
                                        checkradiobutton;
                                    widget.selectedTeachingProgram = this
                                        .widget
                                        .institute
                                        .institutedetails
                                        .teachingprograms[teachingindex];

                                    for (var i = 0;
                                        i < this.widget.radiobuttons.length;
                                        i++) {
                                      if (i != teachingindex)
                                        this.widget.radiobuttons[i] =
                                            Icon(Icons.radio_button_unchecked);
                                    } //forloop
                                  });
                                },
                                child: Container(
                                  height: 480.h, //height/1.5,
                                  width: 334.w, // width,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xff8a959e).withOpacity(0.2),
                                        spreadRadius: 0,
                                        blurRadius: 40,
                                        offset: Offset(0, 8),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                      25.w, 27.h, 21.w, 0.h),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              this
                                                  .widget
                                                  .institute
                                                  .institutedetails
                                                  .teachingprograms[
                                                      teachingindex]
                                                  .title,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Inter",
                                              ),
                                            ),
                                            IconButton(
                                              icon: this
                                                  .widget
                                                  .radiobuttons[teachingindex],
                                              // onPressed: () {
                                              //   // setState(() {
                                              //   //
                                              //   //   this.widget.radiobuttons[indexx]=checkradiobutton;
                                              //   //   for(var i=0;i<this.widget.radiobuttons.length;i++){
                                              //   //     if(this.widget.radiobuttons[i]!=checkradiobutton)
                                              //   //       this.widget.radiobuttons[i]=Icon(Icons.radio_button_unchecked);
                                              //   //   }
                                              //   //
                                              //   //
                                              //   //
                                              //   // });
                                              // }
                                            )
                                          ]),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Row(
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.clock,
                                              size: 19.sp,
                                              color: Color(0xff9CA3AF),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              // this.widget.institute.institutedetails.teachingprograms[0].duration.toString(),
                                              AppLocalizations.of(context)
                                                  .duration,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                //fontWeight: FontWeight.bold,
                                                color: Color(0xff9CA3AF),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              this
                                                      .widget
                                                      .institute
                                                      .institutedetails
                                                      .teachingprograms[
                                                          teachingindex]
                                                      .duration +
                                                  AppLocalizations.of(context)
                                                      .yrs,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4B5563),
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Row(
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.briefcase,
                                              size: 19.sp,
                                              color: Color(0xff9CA3AF),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .specification,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                //fontWeight: FontWeight.bold,
                                                color: Color(0xff9CA3AF),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              this
                                                  .widget
                                                  .institute
                                                  .institutedetails
                                                  .teachingprograms[
                                                      teachingindex]
                                                  .specification,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Inter",
                                                color: Color(0xff4B5563),
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        height: 29.h,
                                      ),
                                      ExpandableText(
                                        this
                                            .widget
                                            .institute
                                            .institutedetails
                                            .teachingprograms[teachingindex]
                                            .description,
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14.sp),
                                        expandText: AppLocalizations.of(context)
                                            .seeMore,
                                        collapseText:
                                            AppLocalizations.of(context)
                                                .showLess,
                                        maxLines: 2,
                                        linkColor: Colors.black,
                                        linkStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 26.h,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)
                                            .possibleCareersAfterSchool,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff03045E),
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      SizedBox(
                                        height: 65.h,
                                        //width: 120.w,
                                        child: ListView(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              ToggleButtons(
                                                //disabledBorderColor: Colors.white,
                                                //borderColor: Colors.white,
                                                children: [
                                                  for (var i = 0;
                                                      i <
                                                          this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .teachingprograms[
                                                                  teachingindex]
                                                              .careers
                                                              .length;
                                                      i++)
                                                    Container(
                                                      width: 91.w,
                                                      height: 40.h,
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 8.w, 0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color:
                                                            Color(0xfff8fafc),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .teachingprograms[
                                                                  teachingindex]
                                                              .careers[i]["job"],
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
                                                isSelected: this
                                                    .widget
                                                    .isSelected[teachingindex],
                                                selectedColor:
                                                    Color(0xff03045E),
                                                renderBorder: false,
                                                color: Color(0xff64748B),
                                                fillColor: Colors.transparent,
                                                splashColor: Colors.transparent,

                                                onPressed: (int index) {


                                                  setState(() {
                                                    for (var i = 0;
                                                        i <
                                                            this
                                                                .widget
                                                                .isSelected[
                                                                    teachingindex]
                                                                .length;
                                                        i++)
                                                      if (i != index) {
                                                        //isSelected[i] = false;
                                                        this.widget.isSelected[
                                                                teachingindex]
                                                            [i] = false;
                                                      }
                                                    // isSelected[index] = true;
                                                    this.widget.isSelected[
                                                            teachingindex]
                                                        [index] = true;
                                                    this
                                                            .widget
                                                            .salaryexpectation[
                                                        teachingindex] = this
                                                                .widget
                                                                .institute
                                                                .institutedetails
                                                                .teachingprograms[
                                                                    teachingindex]
                                                                .careers[index]
                                                            ["min"] +
                                                        "-" +
                                                        this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .teachingprograms[
                                                                teachingindex]
                                                            .careers[index]["max"];
                                                  });
                                                },
                                              ),
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        height: 40.h,
                                        width: 290.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.w),
                                        color: Color(0xfff8fafc),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .salaryExpectations,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Color(0xff03045E),
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "|",
                                              style: TextStyle(
                                                fontSize: 19.sp,
                                                color: Colors.grey.shade200,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              this
                                                  .widget
                                                  .salaryexpectation[
                                                      teachingindex]
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        )),
                        SizedBox(
                          height: 53.h,
                        ),

                        ///////////////////////////////////////////////////////////////

                        //BUTTON///
                        (!hideCheckOut)
                            ? Column(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 46.h,
                                      width: 335.w,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            List<TeachingPrograms>
                                                pushSelectedTeachingProgram =
                                                [];
                                            pushSelectedTeachingProgram.add(
                                                widget.selectedTeachingProgram);

                                            if (!checkFirst) {
                                              if (reservedInstitute[0].title ==
                                                      this
                                                          .widget
                                                          .institute
                                                          .title &&
                                                  reservedInstitute[0]
                                                          .institutedetails
                                                          .teachingprograms[0]
                                                          .title ==
                                                      widget
                                                          .selectedTeachingProgram
                                                          .title) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        duration: Duration(
                                                            seconds: 1),
                                                        content: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .youCanNotChoosetheSameFaculty,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18.sp,
                                                            fontFamily: "Inter",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )));
                                              } else {
                                                reservedInstitute[checkChange] =
                                                    Institute(
                                                        title: this
                                                            .widget
                                                            .institute
                                                            .title,
                                                        category: this
                                                            .widget
                                                            .institute
                                                            .category,
                                                        image: this
                                                            .widget
                                                            .institute
                                                            .image,
                                                        location: this
                                                            .widget
                                                            .institute
                                                            .location,
                                                        public: this
                                                            .widget
                                                            .institute
                                                            .public,
                                                        institutedetails:
                                                            InstituteDetails(
                                                          coordinates: this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .coordinates,
                                                          institutetype: this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .institutetype,
                                                          rating: this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .rating,
                                                          tutionfee: this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .tutionfee,
                                                          description: this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .description,
                                                          teachingprograms:
                                                              pushSelectedTeachingProgram,
                                                          images: this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .images,
                                                        ));

                                                //Alternative entry and calculations //
                                                //check first = true i.e reserved[0] already added//
                                                //fromcheckout = false//

                                                //calculating distance of coordinates of all dormitories and this institute//

                                                double distanceInMeters;
                                                if (checkChange == 1)
                                                  alternativeDistanceCalculatedDormitories
                                                      .clear();
                                                else
                                                  primaryDistanceCalculatedDormitories
                                                      .clear();
                                                for (var i = 0;
                                                    i < dormitories.length;
                                                    i++) {
                                                  distanceInMeters = Geolocator
                                                      .distanceBetween(
                                                          this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .coordinates
                                                              .latitude,
                                                          this
                                                              .widget
                                                              .institute
                                                              .institutedetails
                                                              .coordinates
                                                              .longitude,
                                                          dormitories[i]
                                                              .details
                                                              .coordinates
                                                              .latitude,
                                                          dormitories[i]
                                                              .details
                                                              .coordinates
                                                              .longitude);

                                                  //checking distance < = 30km then put in list//
                                                  if ((distanceInMeters /
                                                          1000) <=
                                                      30.0) {
                                                    if (checkChange == 1) {
                                                      alternativeDistanceCalculatedDormitories
                                                          .add(dormitories[i]);
                                                      alternativeDistanceCalculatedDormitories
                                                              .last.distance =
                                                          distanceInMeters ~/
                                                              1000;
                                                    } else {
                                                      primaryDistanceCalculatedDormitories
                                                          .add(dormitories[i]);
                                                      primaryDistanceCalculatedDormitories
                                                              .last.distance =
                                                          distanceInMeters ~/
                                                              1000;
                                                    }

                                                    //  alternativeDistanceCalculatedDormitories.last.
                                                  }
                                                }
                                                //loop ending//

                                                if (fromCheckout) {
                                                  if (reservedInstitute[0]
                                                              .title ==
                                                          reservedInstitute[1]
                                                              .title &&
                                                      reservedInstitute[0]
                                                              .institutedetails
                                                              .teachingprograms[
                                                                  0]
                                                              .title ==
                                                          reservedInstitute[1]
                                                              .institutedetails
                                                              .teachingprograms[
                                                                  0]
                                                              .title) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            duration: Duration(
                                                                seconds: 1),
                                                            content: Text(
                                                              "Same teaching programs cannot be chosen",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18.sp,
                                                                fontFamily:
                                                                    "Inter",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )));
                                                  } else {
                                                    //fromCheckout = false;
                                                    //Navigator.pushNamed(context, checkout_page.routeName);

                                                    if (checkChange == 1)
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                dormitorySearch_page(
                                                              distanceCalculatedList:
                                                                  alternativeDistanceCalculatedDormitories,
                                                            ),
                                                          ));
                                                    else
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                dormitorySearch_page(
                                                              distanceCalculatedList:
                                                                  primaryDistanceCalculatedDormitories,
                                                            ),
                                                          ));
                                                  }
                                                } else {
                                                  //checking all dormitories distance
                                                  if (checkChange == 1)
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              dormitorySearch_page(
                                                            distanceCalculatedList:
                                                                alternativeDistanceCalculatedDormitories,
                                                          ),
                                                        ));
                                                  else
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              dormitorySearch_page(
                                                            distanceCalculatedList:
                                                                primaryDistanceCalculatedDormitories,
                                                          ),
                                                        ));
                                                }
                                              }
                                            } else {
                                              reservedInstitute[checkChange] =
                                                  Institute(
                                                      title: this
                                                          .widget
                                                          .institute
                                                          .title,
                                                      category: this
                                                          .widget
                                                          .institute
                                                          .category,
                                                      image: this
                                                          .widget
                                                          .institute
                                                          .image,
                                                      location: this
                                                          .widget
                                                          .institute
                                                          .location,
                                                      public: this
                                                          .widget
                                                          .institute
                                                          .public,
                                                      institutedetails:
                                                          InstituteDetails(
                                                        coordinates: this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .coordinates,
                                                        institutetype: this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .institutetype,
                                                        rating: this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .rating,
                                                        tutionfee: this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .tutionfee,
                                                        description: this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .description,
                                                        teachingprograms:
                                                            pushSelectedTeachingProgram,
                                                        images: this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .images,
                                                      ));

                                              //primary entry and calculations //
                                              //check first = false//
                                              //fromcheckout = false//

                                              //calculating distance of coordinates of all dormitories and this institute//
                                              //storing it in primaryCalculatedDistanceDormitoryList//

                                              double distanceInMeters;
                                              primaryDistanceCalculatedDormitories
                                                  .clear();
                                              for (var i = 0;
                                                  i < dormitories.length;
                                                  i++) {
                                                distanceInMeters =
                                                    Geolocator.distanceBetween(
                                                        this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .coordinates
                                                            .latitude,
                                                        this
                                                            .widget
                                                            .institute
                                                            .institutedetails
                                                            .coordinates
                                                            .longitude,
                                                        dormitories[i]
                                                            .details
                                                            .coordinates
                                                            .latitude,
                                                        dormitories[i]
                                                            .details
                                                            .coordinates
                                                            .longitude);

                                                //checking distance < = 30km then put in list//
                                                if ((distanceInMeters / 1000) <=
                                                    30.0) {
                                                  primaryDistanceCalculatedDormitories
                                                      .add(dormitories[i]);
                                                  primaryDistanceCalculatedDormitories
                                                          .last.distance =
                                                      distanceInMeters ~/ 1000;
                                                }
                                              }

                                              //loop ending//
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        dormitorySearch_page(
                                                      distanceCalculatedList:
                                                          primaryDistanceCalculatedDormitories,
                                                    ),
                                                  ));
                                            }
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .idliketostudyHere,
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
                                  SizedBox(
                                    height: 42.h,
                                  ),

                                  //Similar Schools//
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.w),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)
                                                .similarSchools,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Inter",
                                                color: Colors.grey.shade900,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18.sp),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      schoolSearch_page(
                                                          toshowtitle:
                                                              AppLocalizations.of(
                                                                      context)
                                                                  .similarSchools,
                                                          toshowlist: this
                                                              .catInstitutes),
                                                ),
                                              );
                                            },
                                            child: Row(children: [
                                              Text(
                                                AppLocalizations.of(context)
                                                    .seeMore,
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
                                        itemCount: this.catInstitutes.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InstituteSearchCard2(
                                              height: 100,
                                              width: 335.w,
                                              institute:
                                                  this.catInstitutes[index]);
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
                                ],
                              )
                            : Container(),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
