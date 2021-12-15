import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/home_page.dart';

class schoollevel_page extends StatelessWidget {
  static const routeName = '/schoollevel_page';

  //const schoollevel_page({Key? key}) : super(key: key);

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
          icon: Icon(Icons.arrow_back, color:Color(0xff303030),),
        ),
        title: Text(
          "School Level",
          style: TextStyle(
            color: Color(0xff303030),
            fontSize: 16.sp,
            fontFamily: "InterBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        color: Colors.transparent,

        margin: EdgeInsets.symmetric(horizontal:20.w,vertical: 20.h),
        width: width,
       // color: Colors.white,
        child: ListView(
          shrinkWrap: false,
          children:[
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Text(
                "I want to study in...",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Color(0xff303030),
                  fontFamily: "InterBold",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              ////SCHOOL///

              Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Color(0xff8a959e).withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: Offset(0,8),

                  )],
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                height: 301.h,
                width: 335.w,

                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal:17.w,vertical: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.sp),
                      child: Container(
                        color: Colors.black,
                        height: 182.h,
                        width: 301.w,
                        child: Image.asset(
                          "assets/images/school1.png",
                          fit: BoxFit.cover,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Container(
                     // padding: EdgeInsets.symmetric(horizontal:17.w,vertical: 17.h),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "In High School",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff303030),
                                  fontFamily: "InterBold",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "From 9th Grade",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 19.5,
                            backgroundColor: Colors.grey.shade100,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, home_page.routeName);
                              },
                              icon: Icon(
                                Icons.arrow_forward_outlined,
    color: Color(0xff303030),
                                size: 20.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 46.h,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Color(0xff8a959e).withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: Offset(0,8),

                  )],
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                height: 301.h,
                width: 335.w,

                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal:17.w,vertical: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.sp),
                      child: Container(
                        color: Colors.black,
                        height: 182.h,
                        width: 301.w,
                        child: Image.asset(
                          "assets/images/school2.png",
                          fit: BoxFit.cover,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal:17.w,vertical: 17.h),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "In College",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff303030),
                                  fontFamily: "InterBold",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "From 11th Grade",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 19.5,
                            backgroundColor: Colors.grey.shade100,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, home_page.routeName);
                              },
                              icon: Icon(
                                Icons.arrow_forward_outlined,
                                color: Color(0xff303030),
                                size: 20.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // //College//

            ],
          ),
       ] ),
      ),
    );
  }
}
