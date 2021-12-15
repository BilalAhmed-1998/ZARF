import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zarf/dormitory.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/userform_page.dart';

import '../dummydata.dart';
import 'fullscreen_page.dart';

// Widget _buildSuggestions() {
//   return ListView.builder(
//       padding: const EdgeInsets.all(16.0),
//       itemBuilder: /*1*/ (context, i) {
//         if (i.isOdd) return const Divider(); /*2*/
//
//         final index = i ~/ 2; /*3*/
//         return _buildRow(_suggestions[index]);
//       });
// }
class dormitorydetail_page extends StatefulWidget {
  static const routeName = '/dormitorydetail_page';
  Dormitory dormitory;
  dormitorydetail_page({this.dormitory});

  @override
  _dormitorydetail_pageState createState() => _dormitorydetail_pageState();
}

class _dormitorydetail_pageState extends State<dormitorydetail_page> {
  bool isStrechedDropDown = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          "View Dormitory",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ref_faq(
                  toshow:"Dormitory Detailed Questions", FAQs: FAQs,),
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
          //margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: height / 3.5,
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: widget.dormitory.details.images.length,
              //       itemBuilder: (context, index) {
              //         return
              //           Container(
              //           width: width - 50,
              //           margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
              //           child: Stack(children: [
              //             Positioned.fill(
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(10.0),
              //                 child: Image.asset(
              //                   widget.dormitory.details.images[index],
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //           ]),
              //         );
              //       }),
              // ),
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
                    itemCount: widget.dormitory.details.images.length,
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
                                        widget.dormitory.details.images[index],
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.widget.dormitory.title + ' Dormitory',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.h,right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage("assets/images/location.png"),
                                size: 20.sp,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                this.widget.dormitory.address,
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 13.sp,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.circle_filled,
                                size: 7.sp,
                                color: Color(0xff03045e),
                              ),
                              Text(
                                ' ' +
                                    this.widget.dormitory.distance.toString() +
                                    'km away',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 13.sp,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      this.widget.dormitory.details.description,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14.sp,
                        height: 1.92.h,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(
                      height: 41.h,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rent',
                              style: TextStyle(
                                color: Color(0xff03045e),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '£' +
                                    this
                                        .widget
                                        .dormitory
                                        .details
                                        .rent
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                                children: [
                                  TextSpan(
                                    text: '/mo',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: 53.w,
                          height: 45.h,
                          child: VerticalDivider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Meal',
                              style: TextStyle(
                                color: Color(0xff03045e),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '£' +
                                    this
                                        .widget
                                        .dormitory
                                        .details.meal
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                                children: [
                                  TextSpan(
                                    text: '/mo',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 47.h,
                    ),
                    Container(
                      color: Color(0xfff8fafc),
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available Amenities',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_up),
                          // GestureDetector(
                          //     onTap: () {
                          //       setState(() {
                          //         isStrechedDropDown = !isStrechedDropDown;
                          //       });
                          //     },
                          //     child: Icon(isStrechedDropDown
                          //         ? Icons.keyboard_arrow_up
                          //         : Icons.keyboard_arrow_down)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //beds
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          CupertinoIcons.bed_double,
                          color: Color(0xff03045e),
                        ),
                        backgroundColor: Colors.grey.shade50,
                      ),
                      title: Text(
                        'Bed Spaces',
                        style: TextStyle(color: Color(0xff374151),
                          fontSize: 14.sp,
                          fontFamily: "Inter",

                        ),
                      ),
                    ),

                    SizedBox(
                      child:Divider(
                        color: Color(0xffF4F4F5),
                        thickness: 2,
                      ),
                      height: 10,
                    ),
                    //water
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          CupertinoIcons.drop,
                          color: Color(0xff03045e),
                        ),
                        backgroundColor: Colors.grey.shade50,
                      ),
                      title: Text(
                        'Constant Water Supply',
                        style: TextStyle(color: Color(0xff374151),
                          fontSize: 14.sp,
                          fontFamily: "Inter",

                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffF4F4F5),
                      thickness: 2,
                    ),
                    //electricity
                    ListTile(
                      leading: CircleAvatar(
                        child: Transform.rotate(
                            angle: 180 * 3.14 / 180,
                            child: Icon(
                              Icons.tungsten_outlined,
                              color: Color(0xff03045e),
                            )),
                        backgroundColor: Colors.grey.shade50,
                      ),
                      title: Text(
                        'Constant Electicity Supply',
                        style: TextStyle(color: Color(0xff374151),
                          fontSize: 14.sp,
                          fontFamily: "Inter",

                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffF4F4F5),
                      thickness: 2,
                    ),
                    //internet
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.language,
                          color: Color(0xff03045e),
                        ),
                        backgroundColor: Colors.grey.shade50,
                      ),
                      title: Text(
                        'Constant Internet Services',
                        style: TextStyle(color: Color(0xff374151),
                          fontSize: 14.sp,
                          fontFamily: "Inter",

                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffF4F4F5),
                      thickness: 2,
                    ),
                    //coordinates
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.explore_outlined,
                          color: Color(0xff03045e),
                        ),
                        backgroundColor: Colors.grey.shade50,
                      ),
                      title: Text(
                        '+454NE -345SE',
                        style: TextStyle(color: Color(0xff374151),
                          fontSize: 14.sp,
                          fontFamily: "Inter",

                        ),
                      ),
                    ),

                    SizedBox(
                      child: Divider(
                        color: Color(0xffF4F4F5),
                        thickness: 2,
                      ),
                      height: 37.h,
                    ),

                    //rules
                    Container(
                      color: Color(0xfff8fafc),
                      padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                      margin: EdgeInsets.only(top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dormitory Rules',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_up),
                          // GestureDetector(
                          //     onTap: () {
                          //       setState(() {
                          //         isStrechedDropDown = !isStrechedDropDown;
                          //       });
                          //     },
                          //     child: Icon(isStrechedDropDown
                          //         ? Icons.keyboard_arrow_up
                          //         : Icons.keyboard_arrow_down)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //rules
                    ListTile(
                      leading: CircleAvatar(
                        radius: 14.sp,

                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20.sp,
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      title: Text(
                        'No smoking',
                        style: TextStyle(color: Color(0xff374151),
                            fontSize: 14.sp,
                            fontFamily: "Inter",
                          ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 14.sp,

                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20,
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      title: Text(
                        'No Cooking',
                        style: TextStyle(color: Color(0xff374151),
                        fontSize: 14.sp,
                        fontFamily: "Inter",

                      ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Color(0xfff8fafc),
                      padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Route From Dormitory to School',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_up),
                          // GestureDetector(
                          //     onTap: () {
                          //       setState(() {
                          //         isStrechedDropDown = !isStrechedDropDown;
                          //       });
                          //     },
                          //     child: Icon(isStrechedDropDown
                          //         ? Icons.keyboard_arrow_up
                          //         : Icons.keyboard_arrow_down)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/map1.png',
                          fit: BoxFit.cover,
                          width: width,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, userform_page.routeName);
                            },
                            child: Text(
                              "I want to live here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Inter',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff03045e),
                              //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, home_page.routeName);

                        },
                        child: Text('Go to List of Schools',style: TextStyle(
                          color: Color(0xff03045e),
                          fontFamily: 'Inter',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,


                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ExpandedSection(
// expand: isStrechedDropDown,
// height: 100,
// child: MyScrollbar(
// builder: (context, scrollController2) =>
// ListView.builder(
// padding: EdgeInsets.all(0),
// controller: scrollController2,
// shrinkWrap: true,
// itemCount: _list.length,
// itemBuilder: (context, index) {
// return RadioListTile(
// title: Text(_list.elementAt(index)),
// value: index,
// groupValue: groupValue,
// onChanged: (val) {
// setState(() {
// groupValue = val;
// title = _list.elementAt(index);
// });
// });
// }),
