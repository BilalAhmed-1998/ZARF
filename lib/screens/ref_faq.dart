import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';

class ref_faq extends StatefulWidget {
  static const routeName = '/ref_faq';
  //const ref_faq({Key? key}) : super(key: key);

  Map <String,String> FAQs;
  String toshow;

  ref_faq({this.FAQs,this.toshow});

  @override
  _ref_faqState createState() => _ref_faqState();
}

class _ref_faqState extends State<ref_faq> {
  get value => null;
  bool isExpanded1= false;

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
          "FAQ",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       CupertinoIcons.question_circle,
        //       color: Colors.black,
        //       size: 22.sp,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 42.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(14.w, 0, 0, 10.h),
                child: Text(
                  this.widget.toshow,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff1F2937),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                  ),
                ),
              ),
             //SizedBox(height: 27.h,),
              for(var i =0;i<FAQs.length;i++)
                Container(
                  margin: EdgeInsets.only(bottom: 27.h),
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

            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),

              child: ExpansionTile(


                tilePadding: EdgeInsets.only(
                 // bottom: 21.h,
                //  top: 21.h,
                  left: 15.w,
                  right: 21.w,

                ),
                backgroundColor: Colors.transparent,
                  collapsedIconColor: Colors.grey.shade800,
                  iconColor: Color(0xff03045e),
                  collapsedBackgroundColor: Colors.transparent,
                  title: Text(
                    FAQs.keys.elementAt(i),
                    style: TextStyle(
                        color: Color(0xff03045E),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter"
                    )
                    ,
                  ),
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 12.h),
                    color: Color(0xffF1F5F9),
                    child:
                    Text(
                      FAQs.values.elementAt(i),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),

                  ),

                ],

               //trailing: Icon(Icons.arrow_back_ios),


              ),
            ),
          ),
          SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.fromLTRB(14.w, 0, 0, 10.h),
                child: Text(
                  'General',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff1F2937),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                  ),
                ),
              ),
              for(var i =0;i<FAQs.length;i++)
                Container(
                  margin: EdgeInsets.only(bottom: 27.h),
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

                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(15),

                    child: ExpansionTile(


                      tilePadding: EdgeInsets.only(
                        // bottom: 21.h,
                        //  top: 21.h,
                        left: 15.w,
                        right: 21.w,

                      ),
                      backgroundColor: Colors.transparent,
                      collapsedIconColor: Colors.grey.shade800,
                      iconColor: Color(0xff03045e),
                      collapsedBackgroundColor: Colors.transparent,
                      title: Text(
                        FAQs.keys.elementAt(i),
                        style: TextStyle(
                            color: Color(0xff03045E),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter"
                        )
                        ,
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 12.h),
                          color: Color(0xffF1F5F9),
                          child:
                          Text(
                            FAQs.values.elementAt(i),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),

                        ),

                      ],

                      //trailing: Icon(Icons.arrow_back_ios),


                    ),
                  ),
                ),
              SizedBox(
                height: 120.h,
              ),

    //           ClipRRect(
    //
    //             borderRadius: BorderRadius.circular(15),
    //             child: ExpansionPanelList(
    //               animationDuration: Duration(milliseconds: 400),
    //               expansionCallback: (int index, bool isExpanded){
    //                 setState(() {
    //                   isExpanded1 = !isExpanded;
    //
    //                 });
    //               },
    //                 dividerColor: Colors.white,
    //                 children: [
    //               ExpansionPanel(
    //                 //canTapOnHeader: true,
    //                 isExpanded: isExpanded1,
    //                 backgroundColor: Colors.white,
    //                   headerBuilder: (BuildContext context, bool isExpanded) {
    //                 return
    //                   Container(
    //
    //                   height: 60.h,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15.0),
    //                     color: Colors.transparent,
    //                   ),
    //                   padding: EdgeInsets.fromLTRB(15.w, 21.h, 0, 21.h),
    //                   child: Text(
    //                     'Why do I have to choose 2 schools?',
    //                     style: TextStyle(
    //                         color: Color(0xff03045E),
    //                         fontSize: 13.sp,
    //                         fontWeight: FontWeight.bold,
    //                     fontFamily: "Inter"
    //                     )
    //                     ,
    //                   ),
    //                 );
    //                 },
    //                 body:
    //                 Container(
    //                   padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 12.h),
    //                           color: Color(0xffF1F5F9),
    //                     child: Text("The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option.\n \nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
    //                     style: TextStyle(
    //                       fontSize: 14.sp,
    //                       color: Colors.grey.shade700,
    //                     ),
    //                     ),
    //
    //                 ),
    // ),
    //             ]),
    //           ),
    //           SizedBox(height: 27.h,),
              // decoration: BoxDecoration(
              //   boxShadow: [BoxShadow(
              //     color: Color(0xff8a959e).withOpacity(0.2),
              //     spreadRadius: 0,
              //     blurRadius: 40,
              //     offset: Offset(0,8),
              //
              //   )],
              //   borderRadius: BorderRadius.circular(15),
              //   color: Colors.white,
              // ),
            ],
          ),

        ),
      ),
    );
  }
}
