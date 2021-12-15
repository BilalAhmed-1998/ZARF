import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zarf/screens/ref_faq.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:searchfield/searchfield.dart';
import '../category.dart';
import '../dummydata.dart';
import '../school.dart';

class home_page extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: ScaffoldKey,
      // endDrawer: Drawer(
      //   backgroundColor: Colors.white,
      //   child: SafeArea(
      //     child: Container(
      //       margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: 25,
      //             child: Image.asset("assets/images/zarf_logo.png"),
      //           ),
      //           SizedBox(
      //             height: 50,
      //           ),
      //           InkWell(
      //             onTap: () {
      //               Navigator.pushNamed(context, refhome_page.routeName);
      //             },
      //             child: Container(
      //               height: 50,
      //               decoration: BoxDecoration(
      //                 color: Color(0xff03045e),
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //               padding: EdgeInsets.symmetric(horizontal: 20),
      //               child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Container(
      //                       height: 35,
      //                       child: Image.asset("assets/images/cash.png"),
      //                     ),
      //                     Text(
      //                       "Referrals",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 20,
      //                       ),
      //                     ),
      //                   ]),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
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
          // IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {
          //     ScaffoldKey.currentState.openEndDrawer();
          //   },
          // ),
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
                "Find the Best High Schools in Slovakia",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp),
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
                            "Category",
                            style: TextStyle(
                                fontFamily: "InterBold",
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w800,
                                fontSize: 16.sp),
                          ),
                          // InkWell(
                          //   onTap: () {},
                          //   child: Row(children: [
                          //     Text(
                          //       "All Categories ",
                          //       style: TextStyle(
                          //           color: Color(0xff03045e),
                          //           fontWeight: FontWeight.w600,
                          //           fontSize: 15),
                          //     ),
                          //     Icon(Icons.chevron_right),
                          //   ]),
                          // ),
                        ]),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: height / 7,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: CategoryCard(
                                data: categories[index], height: height / 8),
                            padding: EdgeInsets.fromLTRB(0, 3, 6, 2),
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
                          Text(
                            "Top Schools",
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
                      height: height / 3.2,
                      width: width,
                      child: Swiper(
                        itemWidth: 500,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        loop: true,
                        itemCount: Allschools[0].length,
                        itemBuilder: (BuildContext context, int index) {
                          return InstituteSearchCard(
                              height: 100,
                              width: 335.w,
                              institute: Allschools[0][index]);
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
                          Text(
                            "Popular Schools",
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
                                      toshowtitle: "Popular Schools",
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
                      height: height / 3.2,
                      width: width,
                      child: Swiper(
                        itemWidth: 500,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        loop: true,
                        itemCount: Allschools[0].length,
                        itemBuilder: (BuildContext context, int index) {
                          return InstituteSearchCard(
                              height: 100,
                              width: 335.w,
                              institute: Allschools[0][index]);
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
                          Text(
                            "Colleges You May Like",
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
                                      toshowtitle: "Colleges",
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
                      height: height / 3.2,
                      width: width,
                      child: Swiper(
                        itemWidth: 500,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        loop: true,
                        itemCount: Allschools[0].length,
                        itemBuilder: (BuildContext context, int index) {
                          return InstituteSearchCard(
                              height: 100,
                              width: 335.w,
                              institute: Allschools[0][index]);
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
                  Container(
                    height: 52.h,
                    width: 264.w,
                    decoration:
                    BoxDecoration(
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
                    padding: EdgeInsets.only(
                       left: 18.w,
                       top: 6.h,
                      // bottom: 18.h,
                    ),
                    child: CupertinoSearchTextField(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      autofocus: false,
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/search_icon.png"),
                        size: 22.sp,
                        color: Color(0xff9CA3AF),
                      ),
                      placeholderStyle: TextStyle(
                        color: Color(0xffD1D5DB),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      backgroundColor: Colors.white,
                      itemColor: Color(0xffD1D5DB),
                      itemSize: 30,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                         // color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 18.h,horizontal: 30.w),
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
                                      )
                                    ),
                                ),
                                Divider(
                                  color: Color(0xffF4F4F5),
                                  thickness: 1,
                                  height: 16.h,
                                ),
                              ],
                            ),
                          ),
                        ),
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
                        )),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
