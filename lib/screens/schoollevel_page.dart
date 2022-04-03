import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zarf/services/DatabaseCollection.dart';
import '../dummydata.dart';
import 'loadingScreen.dart';

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
          AppLocalizations.of(context).schoolLevel,
          style: TextStyle(
            color: Color(0xff303030),
            fontSize: 16.sp,
            fontFamily: "InterBold",
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ref_faq(
                    FAQs: FAQ["School Level Questions"],
                    toshow: "School Level Questions",
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
                AppLocalizations.of(context).iwantToStudyIn,
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
                                AppLocalizations.of(context).inHighSchool,
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
                                AppLocalizations.of(context).from9thGrade ,
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
                              onPressed: () async{
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context)
                                    {
                                      return loadingScreen();

                                    });
                                if(globalisUniversity==true){
                                  resetAll();
                                }
                                if(Allinstitutes.length==0 ) {
                                  await dbMain.getPopularandTopInstitutes(
                                      "Popular HighSchools");
                                  await dbMain.getPopularandTopInstitutes(
                                      "Top HighSchools");
                                  await dbMain.getInstitutes("HighSchools");
                                  await dbMain.getSchoolDormitories();
                                }
                                Navigator.pop(context);

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
                                AppLocalizations.of(context).inCollege,
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
                                AppLocalizations.of(context).from11thGrade,
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
                              onPressed: () async{
                              //  await dbMain.getCollegeDormitories();
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context)
                                    {
                                      return loadingScreen();

                                    });
                                if (!globalisUniversity)
                                  resetAll();

                                globalisUniversity=true;
                                University=true;
                                if(Allinstitutes.length==0) {
                                  await dbMain.getPopularandTopInstitutes(
                                      "Popular Schools");
                                  await dbMain.getPopularandTopInstitutes(
                                      "Top Schools");
                                  await dbMain.getInstitutes("Schools");
                                  await dbMain.getCollegeDormitories();
                                }
                                Navigator.pop(context);
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
