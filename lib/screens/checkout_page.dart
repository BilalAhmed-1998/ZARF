import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/thankyou_page.dart';
import 'package:zarf/screens/contract_page.dart';

import '../dormitory.dart';
import '../school.dart';
import '../schoolshaheer.dart';

class Signee {
  String name;
  String surname;
  String address;
  String city;
  DateTime country;
}

class checkout_page extends StatefulWidget {
  static const routeName = '/checkout_page';
  Institute institute;
  @override
  _checkout_pageState createState() => _checkout_pageState();
}

class _checkout_pageState extends State<checkout_page> {
  int _value = 1;
  int _method = 1;
  Signee _signee = Signee();
  List<ImageIcon> radios=[
    ImageIcon(AssetImage('assets/images/Group.png'),size:22,color: Colors.white,),
    ImageIcon(AssetImage('assets/images/circleradiooff.png'),size: 22,color: Colors.grey.shade400,),
    ImageIcon(AssetImage('assets/images/circleradiooff.png'),size: 22,color: Colors.grey.shade400,),
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
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
            "Checkout",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter'),
          ),
          actions: [
            IconButton(
              onPressed: () {

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
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Primary school',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'InterBold'),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'School',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    //height: 170.h,
                    child: InstituteCard(
                      width: 335.w,
                      height: 170.h,
                      institute: checkoutschools[0],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '6317M Business Academy',
                          style: TextStyle(
                              color: Color(0xff1F2937),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'InterBold'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, home_page.routeName);
                          },
                          child: Text(
                            'Change School',
                            style: TextStyle(
                              color: Color(0xff03045e),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Dormitory',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 8,
                  ),


                  Stack(
                    children:[
                      Container(
                        //height: 170.h,
                        child: DormitoryCard(
                          //width: width-30,
                          height: 170.h,
                          dormitory: dormitories[0],
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.only(top:155),
                        alignment: Alignment.bottomRight,
                      height: 220.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, dormitorySearch_page.routeName);
                            },
                            child: Text(
                              'Change Dormitory',
                              style: TextStyle(
                                color: Color(0xff03045e),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
        ]),
                  SizedBox(
                    height: 85.h,
                  ),
                  Text(
                    'Alternative school',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'InterBold'),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'School',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    //height: 170.h,
                    child: InstituteCard(
                      width: 335.w,
                      height: 170.h,
                      institute: checkoutschools[0],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '6317M Business Academy',
                          style: TextStyle(
                              color: Color(0xff1F2937),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'InterBold'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, home_page.routeName);
                          },
                          child: Text(
                            'Change School',
                            style: TextStyle(
                              color: Color(0xff03045e),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Dormitory',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  Stack(
                      children:[
                        Container(
                          //height: 170.h,
                          child: DormitoryCard(
                            //width: width-30,
                            height: 170.h,
                            dormitory: dormitories[0],
                          ),
                        ),
                        Container(
                          //padding: EdgeInsets.only(top:155),
                          alignment: Alignment.bottomRight,
                          height: 220.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, dormitorySearch_page.routeName);
                                },
                                child: Text(
                                  'Change Dormitory',
                                  style: TextStyle(
                                    color: Color(0xff03045e),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 31.h,
                  ),


                  /////////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.check_circle,
                          color: Color(0xff03045e),
                          size: 40.sp,
                        ),
                      ),
                      Container(
                        child: Text(
                          ' Great! You are all set. \n You can now proceed to checkout.',
                          style: TextStyle(
                              color: Color(0xff374151),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.question_circle,
                          color: Color(0xff03045e),
                          size: 18.sp,
                        ),
                       InkWell(
                         enableFeedback: true,
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => ref_faq(
                                   toshow: "Checkout Page",
                                 FAQs: FAQs,
                                   ),
                             ),
                           );
                         },
                         child: Text(
                              ' Frequently asked questions',
                              style: TextStyle(
                                color: Color(0xff03045e),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                       )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 55.h,
                      child: Divider(
                        thickness: 2,
                        color: Color(0xfff4f4f5),
                      )),
                  Text(
                    'Extras',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Container(

                    margin: EdgeInsets.only(right: 210.w),
                    padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 10.h),
                    height: 150.h,
                    width: 100.w,
                    //  width: 4*(width/10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffd1d5db),
                      ),
                      boxShadow: [BoxShadow(
                        color: Color(0xff8a959e).withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 40,
                        offset: Offset(0,8),

                      )],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 50.sp,
                                child: Image.asset(
                                  'assets/images/visa.png',
                                )),
                            Icon(
                              Icons.info,
                              color: Color(0xffD1D5DB),
                            ),
                          ],
                        ),
                        Text(
                          'Slovakia Debit Card',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterBold'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.add),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 56.h),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            'Premium Student Plan',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Icon(
                            Icons.info,
                            color: Color(0xffD1D5DB),
                          ),
                        ]),
                        Text(
                          '£100',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xfff8fafc),
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Color(0xff03045E),
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '£1000',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 88.h,
                  ),
                  Text(
                    'Split Payment Options',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 20,
                      child: Divider(
                        thickness: 1,
                        color: Color(0xfff4f4f5),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  //*********************?????????????????????????/////////////////////////
                  Container(
                    width: 335.w,

                    //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        border: Border.all(color: Color(0xff03045e)),
                      boxShadow: [BoxShadow(
                        color: Color(0xff8a959e).withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: Offset(0,8),

                  )],
                    ),
                    child: ExpansionTile(

                      trailing: SizedBox.shrink(),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 16.h, 17.w, 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Icon(
                                  CupertinoIcons.smallcircle_fill_circle_fill,
                                color: Color(0xff03045e),

                              ),

                                Text(
                                  'Pay Once',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width:104),
                                Text(
                                  '£1000.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.w,0, 17.w, 14.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width:6.w),
                                Text(
                                  'Save Big',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width:130.w),
                                Text(
                                  'Balance £0',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterBold'),
                                ),
                              ],
                            ),
                          )

                          // value: 1,
                          // //toggleable: true,
                          // activeColor: Color(0xff03045e),
                          // groupValue: _value,
                          // onChanged: (value) {
                          //   setState(() {
                          //     _value = value;
                          //   });
                          // }),
                        ],
                      ),

                      children: [
                        Container(
                          height:200.h,
                          width: width,
                          padding: EdgeInsets.fromLTRB(20.w, 11.h, 20.w, 23.h),

                          decoration: BoxDecoration(
                            color: Color(0xfff1f5f9),
                            border: Border(
                              top: BorderSide(color:Color(0xff030454e)),
                            )
                          ),


                         child:Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Your Payment Plan',
                             style: TextStyle(
                               fontSize: 14.sp,
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w600
                             ),),
                            SizedBox(height: 11.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('1. Payment',style: TextStyle(
                                  color: Color(0xff6b7280),
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',

                                ),),
                                Text('2. Payment',style: TextStyle(
                                  color: Color(0xff6b7280),
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',

                                ),),
                                Text('3. Payment',style: TextStyle(
                                  color: Color(0xff6b7280),
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',

                                ),),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                onPressed: () {
                                  },

                                    child: Text(
                                      "200€",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff03045e),
                                      // Color(0xff03045e),
                                      //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                    },

                                    child: Text(
                                      "300€",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff03045e),
                                      // Color(0xff03045e),
                                      //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                    },

                                    child: Text(
                                      "500€",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff03045e),
                                      // Color(0xff03045e),
                                      //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                                    )),

                              ],
                            ),
                            SizedBox(height: 5.h),
                            Text('Due now',style:TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6b7280),
                            ))
                           ]
                         ) ,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Container(

                    width: 335.w,

                    //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        //border: Border.all(color: Color(0xff03045e)),
                      boxShadow: [BoxShadow(
                        color: Color(0xff8a959e).withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 40,
                        offset: Offset(0,8),

                      )],
                    ),
                    child: ExpansionTile(
                      trailing: SizedBox.shrink(),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 16.h, 17.w, 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(child: radios[1]),

                                Text(
                                  'Pay Once',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width:104),
                                Text(
                                  '£1000.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.w,0, 17.w, 14.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width:6.w),
                                Text(
                                  'Save Big',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width:130.w),
                                Text(
                                  'Balance £0',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterBold'),
                                ),
                              ],
                            ),
                          )

                          // value: 1,
                          // //toggleable: true,
                          // activeColor: Color(0xff03045e),
                          // groupValue: _value,
                          // onChanged: (value) {
                          //   setState(() {
                          //     _value = value;
                          //   });
                          // }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Container(

                    width: 335.w,

                    //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        //border: Border.all(color: Color(0xff03045e)),
                      boxShadow: [BoxShadow(
                        color: Color(0xff8a959e).withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 40,
                        offset: Offset(0,8),

                      )],
                    ),
                    child: ExpansionTile(
                      trailing: SizedBox.shrink(),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 16.h, 17.w, 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(child: radios[2]),

                                Text(
                                  'Pay Once',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width:104),
                                Text(
                                  '£1000.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.w,0, 17.w, 14.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width:6.w),
                                Text(
                                  'Save Big',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width:130.w),
                                Text(
                                  'Balance £0',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterBold'),
                                ),
                              ],
                            ),
                          )

                          // value: 1,
                          // //toggleable: true,
                          // activeColor: Color(0xff03045e),
                          // groupValue: _value,
                          // onChanged: (value) {
                          //   setState(() {
                          //     _value = value;
                          //   });
                          // }),
                        ],
                      ),
                    ),
                  ),


                  SizedBox(
                      height: 31.h,
                      child: Divider(
                        thickness: 1,
                        color: Color(0xfff4f4f5),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Contract Information',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    'Must be filled out by parent or student at least 18 years old.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Builder(builder: (context) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //full name
                          Text(
                            'Name',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterBold'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Igor Zarfchenko',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Surname
                          Text(
                            'Surname',
//textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterBold'),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Igor Zarfchenko',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                )),
                          ),
                          SizedBox(height: 30),
                          //Address
                          Text(
                            'Address',
//textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterBold'),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Zaluzzie 28',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //City
                          Text(
                            'City',
//textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterBold'),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Mukachevo',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Countery
                          Text(
                            'Country',
//textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterBold'),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Ukraine',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //taxpayer
                          Text(
                            'Taxpayer number',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterBold'),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: '032265652',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                )),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: 46.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 46.h,
                      width: 177.w,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, contract_page.routeName);
                          },
                          child: Text(
                            "Preview Contract",
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
                  SizedBox(height: 40),
                  SizedBox(
                    height: 10,
                    child: Divider(
                      color: Color(0xfff4f4f5),
                      thickness: 1,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Pay With',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff1F2937),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InterBold'),
                  ),
                  SizedBox(height: 11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.smallcircle_fill_circle_fill,
                        color: Color(0xff03045e),
                        size: 20.sp

                      ),
                      SizedBox(width: 11.w,),
                      Text(
                        'Bank Transfer',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            CupertinoIcons.circle,
                            color: Color(0xff9FA6B2),
                            size: 20.sp,
                          ),
                          SizedBox(width: 11.w,),

                          Text(
                            'Pay with Card  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Inter'),
                          ),
                          SizedBox(
                            height: 25,
                            width: 30,
                            child: Image.asset(
                              'assets/images/mastercard.png',
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 30,
                              width: 35,
                              child: Image.asset('assets/images/visa.png'),
                            ),
                          ),
                        ],
                      ),
                  SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 8.5 * (width / 10),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, thankyou_page.routeName);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_outlined),
                              Text(
                                " Pay 1000£ Now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff03045e),
                            //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                          )),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have Questions?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, login_page.routeName);
                        },
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            color: Color(0xff03045e),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            )));
  }
}
