import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:full_screen_image/full_screen_image.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/school.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/fullscreen_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:zarf/screens/toDormitory_page.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class schooldetail_page extends StatefulWidget {
  Institute institute;
  List <Icon> radiobuttons;
  List <String> salaryexpectation;
  List isSelected;

  //Difficulty Handling//
  Color difContainerColor;
  String difContainerText;

  schooldetail_page({this.institute}){

    if(this.institute.institutedetails.rating.round() == 1){
      difContainerColor = Color(0xffCAF0F8);
      difContainerText = "Easy";

    }else if(this.institute.institutedetails.rating.round() == 2){

      difContainerColor = Color(0xff90E0EF);
      difContainerText = "Normal";

    }else if(this.institute.institutedetails.rating.round() == 3){
      difContainerColor = Color(0xff00B4D8);
      difContainerText = "Average";

    }else if(this.institute.institutedetails.rating.round() == 4){
      difContainerColor = Color(0xff0077B6);
      difContainerText = "Challenging";

    }else{
      difContainerColor = Color(0xff03045e);
      difContainerText = "Hard";
    }



    this.salaryexpectation = List.filled(this.institute.institutedetails.teachingprograms.length, "-");

    int row = this.institute.institutedetails.teachingprograms.length;
    isSelected = List.generate(row, (i) => List.filled(this.institute.institutedetails.teachingprograms[i].careers.length,false), growable: false);

    for (var i =0;i<row;i++)
    {  for(var j=0;j<this.institute.institutedetails.teachingprograms[i].careers.length;j++)
      {  this.isSelected[i][j] = false; }
      this.isSelected[i][0] = true;

    }

    radiobuttons = List.filled(this.institute.institutedetails.teachingprograms.length,Icon(Icons.radio_button_unchecked));
    radiobuttons[0] = Icon(CupertinoIcons.smallcircle_fill_circle_fill,color: Color(0xff03045e),);
  }

  @override
  _schooldetail_pageState createState() => _schooldetail_pageState();
}

class _schooldetail_pageState extends State<schooldetail_page> {

  Icon checkradiobutton = Icon(CupertinoIcons.smallcircle_fill_circle_fill,color: Color(0xff03045e),);



  @override
  Widget build(BuildContext context) {



    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff303030),
            size: 22.sp,
          ),
        ),
        title: Text(
          "School Profile",
          style: TextStyle(
            color: Color(0xff303030),
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            fontFamily: "InterBold",
          ),
        ),
        actions: [
          IconButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ref_faq(
                    toshow:"School Detailed Questions", FAQs: FAQs,),
              ),
            );

          },
            icon: Icon(CupertinoIcons.question_circle,
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
                height: 169,   //height / 3.5,
               // width: 335.w,
                child: Swiper(
                  //outer: true

                    viewportFraction: 0.8,
                    scale: 0.9,
                    layout: SwiperLayout.DEFAULT,
                    scrollDirection: Axis.horizontal,
                    loop: true,
                    outer: false,
                    itemCount: Allschools[0].length,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Color(0xffe5e7eb),
                        activeColor: Colors.white,
                        size: 8.8.sp,
                        activeSize: 12.sp,
                      )

                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return
                        InkWell(
                          enableFeedback: true,
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => fullscreen_page(image: "assets/images/school1full.png", //widget.institute.institutedetails.images[index],
                                  )
                                ));

                          },
                          child: Container(
                            height: height / 3.5,
                           //width: 335.w,
                          //margin: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
                          child: Hero(
                            tag: "Fullscreen"+index.toString(),
                            child: Stack(children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    widget.institute.institutedetails.images[index],
                                    fit: BoxFit.cover
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
                            fontWeight: FontWeight.w700
                        ),
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
                                "Public",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                  color: Colors.grey.shade600,
                                ),
                              )
                            : Text(
                                "Private",
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
                          this.widget.institute.category + ' School',
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
                      Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: this.widget.difContainerColor,
                          borderRadius: BorderRadius.circular(3),
                        ),

                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.h),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/dashboard_icon.png"),
                              size: 20.sp,
                              color: Colors.white,
                            ),
                            SizedBox(width: 7.w,),
                            Text(
                              this.widget.institute.institutedetails.rating.round().toString(),
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 14.w,),
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
                        "Tution",
                        style: TextStyle(
                          color: Color(0xff03045E),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter",
                          fontSize: 13.sp,
                        ),
                      ),
                      Row(children: [
                        Text(
                          '£' +
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
                        "Teaching Programs",
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
                       // height: height/1.5,
                        child: Column(
                          children: [
                            for (var indexx = 0; indexx< this.widget.institute.institutedetails.teachingprograms.length;indexx++)
                          Container(
                           //height: 500.h,//height/1.5,
                           width:  334.w,// width,

                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: Color(0xff8a959e).withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 40,
                                offset: Offset(0,8),

                              )],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                          padding: EdgeInsets.fromLTRB(25.w, 27.h, 21.w, 35.h),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                          .teachingprograms[indexx]
                                          .title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        fontFamily: "Inter",
                                      ),
                                    ),
                                    IconButton(
                                      icon: this.widget.radiobuttons[indexx],
                                      onPressed: (){
                                        setState(() {


                                          if(this.widget.radiobuttons[indexx] == checkradiobutton)
                                            {this.widget.radiobuttons[indexx] = Icon(Icons.radio_button_unchecked);}
                                          else{
                                            this.widget.radiobuttons[indexx] = checkradiobutton;
                                          }

                                        });

                                      },
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
                                      "Duration",
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
                                          .teachingprograms[indexx]
                                          .duration
                                          .toString() +
                                          "yrs",
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
                                      "Specification",
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
                                          .teachingprograms[indexx]
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
                                    .teachingprograms[indexx]
                                    .description,
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 14.sp),
                                expandText: 'See More',
                                collapseText: 'Show Less',
                                maxLines: 3,
                                linkColor: Colors.black,
                                linkStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                )
                                ,
                              ),
                              SizedBox(
                                height: 26.h,
                              ),
                              Text(
                                "Possible Careers After School",
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
                                child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      ToggleButtons(
                                        //disabledBorderColor: Colors.white,
                                        //borderColor: Colors.white,
                                        children: [
                                          for (var i = 0; i < this.widget.institute.institutedetails.teachingprograms[indexx].careers.length; i++)
                                            Container(
                                              width: 91.w,
                                              height: 40.h,
                                              margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Color(0xfff8fafc),
                                              ),

                                              child: Center(
                                                child: Text(
                                                  this.widget.institute.institutedetails.teachingprograms[indexx].careers.keys.elementAt(i),
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Inter"
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                        isSelected: this.widget.isSelected[indexx],
                                        selectedColor: Color(0xff03045E),
                                        renderBorder: false,
                                        color: Color(0xff64748B),
                                        fillColor: Colors.transparent,
                                        splashColor: Colors.transparent,

                                        onPressed: (int index) {
                                          setState(() {

                                            for (var i = 0; i < this.widget.isSelected[indexx].length; i++)
                                              if(i!=index) {
                                                //isSelected[i] = false;
                                                this.widget.isSelected[indexx][i]=false;
                                              }
                                           // isSelected[index] = true;
                                           this.widget.isSelected[indexx][index] = true;
                                           this.widget.salaryexpectation[indexx] = this.widget.institute.institutedetails.teachingprograms[indexx].careers.values.elementAt(index);

                                          });
                                        },
                                      ),

                                    ] ),
                              ),
                              SizedBox(
                                height:5.h,
                              ),

                              Container(
                                height: 40.h,
                                width: 290.w,
                                padding: EdgeInsets.symmetric(horizontal: 13.w),

                                color: Color(0xfff8fafc),

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Salary Expectation",
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
                                      this.widget.salaryexpectation[indexx].toString(),
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
                          ],
                        )
                      ),
                      SizedBox(
                        height: 53.h,
                      ),

         ///////////////////////////////////////////////////////////////

                      //BUTTON///
                      Center(
                        child: SizedBox(
                          height: 46.h,
                          width: 335.w,
                          child: ElevatedButton(
                              onPressed: () {
                               Navigator.pushNamed(context, dormitorySearch_page.routeName);
                              },
                              child: Text(
                                "I’d like to study Here",
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
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 42.h,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Similar Schools",
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
                                      builder: (context) => schoolSearch_page(
                                          toshowtitle: "Top Schools",
                                          toshowlist: Institutes),
                                    ),
                                  );
                                },
                                child: Row(children: [
                                  Text(
                                    "See more",
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
                          height: height/3.2,
                          width: width,
                          child:
                          Swiper(
                            itemWidth: 500,
                            layout: SwiperLayout.DEFAULT,
                            scrollDirection: Axis.horizontal,
                            loop: true,
                            itemCount: Allschools[0].length,
                            itemBuilder: (BuildContext context, int index) {
                              return
                                InstituteSearchCard(
                                    height: 100,
                                    width: 335.w,
                                    institute: Allschools[0][index]
                                );
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

                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
