// ignore_for_file: missing_return
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zarf/dormitory.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/toDormitory_page.dart';
import 'package:zarf/screens/userform_page.dart';

import '../dummydata.dart';
import 'fullscreen_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class dormitorydetail_page extends StatefulWidget {
  static const routeName = '/dormitorydetail_page';
  Dormitory dormitory;
  dormitorydetail_page({this.dormitory});

  @override
  _dormitorydetail_pageState createState() => _dormitorydetail_pageState();
}

class _dormitorydetail_pageState extends State<dormitorydetail_page> {
  bool isStrechedDropDown = false;
  ListTile amenities(IconData i, String feature){
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          i,
          color: Color(0xff03045e),
        ),
        backgroundColor: Colors.grey.shade50,
      ),
      title: Text(
        feature,
        style: TextStyle(color: Color(0xff374151),
          fontSize: 14.sp,
          fontFamily: "Inter",

        ),
      ),
    );
  }
  ListTile rules(IconData i , String r){
    return ListTile(
      leading: CircleAvatar(
        radius: 14.sp,

        child: Icon(
          i,
          color: Colors.black,
          size: 20.sp,
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      title: Text(
        r,
        style: TextStyle(color: Color(0xff374151),
          fontSize: 14.sp,
          fontFamily: "Inter",
        ),
      ),
    );
  }
  Theme dormAttributes(String s, dynamic c){
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        iconColor: Color(0xff03045E),
        collapsedIconColor: Color(0xff03045E),
        backgroundColor: Color(0xfff8fafc),
        collapsedBackgroundColor: Color(0xfff8fafc),

        title: Text(
          s,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 0),
        children: [
          c,
        ],

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              if(hideCheckOut==true)
                hideCheckOut = false;
              

              Navigator.of(context).pop();

            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,),
          ),
          title: Text(
            AppLocalizations.of(context).viewdorm,
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
                    toshow:"Dormitory Detail Questions", FAQs: FAQs,),
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
                Container(
                  color: Colors.white,
                  height: 169,   //height / 3.5,
                  // width: 335.w,
                  child: Swiper(
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
                                      builder: (context) => fullscreen_page(image: widget.dormitory.details.images[index], //widget.institute.institutedetails.images[index],
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
                                      child:  this.widget.dormitory.details.images[index].runtimeType!=String
                                  ?FutureBuilder(
                                          future: this.widget.dormitory.details.images[index],
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.done) {
                                              return Image.network(
                                                snapshot.data,
                                                fit: BoxFit.cover,
                                              );
                                            }

                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return Container(
// width: 100,
                                                height: 400,
                                                child: CircularProgressIndicator.adaptive(),
                                              );
                                            }
                                          }):
                                      Image.network(
                                        this.widget.dormitory.details.images[index],
                                        fit: BoxFit.cover,
                                      )

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
                                      'km '+AppLocalizations.of(context).away,
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
                                AppLocalizations.of(context).rent,
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
                                  text: '€' +
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
                                      text: '/'+AppLocalizations.of(context).month,
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
                                AppLocalizations.of(context).meal,
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
                                  text: '€' +
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
                                      text: AppLocalizations.of(context).month,
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
                      //Amenities
                      dormAttributes(AppLocalizations.of(context).availableAmenities, Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            //beds
                            amenities(CupertinoIcons.bed_double, AppLocalizations.of(context).bedSpaces),
                            SizedBox(
                              child:Divider(
                                color: Color(0xffF4F4F5),
                                thickness: 2,
                              ),
                              height: 10,
                            ),
                            amenities(CupertinoIcons.drop, AppLocalizations.of(context).constantWaterSupply),
                            Divider(
                              color: Color(0xffF4F4F5),
                              thickness: 2,
                            ),
                            amenities(Icons.tungsten_outlined, AppLocalizations.of(context).constantElecticitySupply),
                            Divider(
                              color: Color(0xffF4F4F5),
                              thickness: 2,
                            ),
                            amenities(Icons.language, AppLocalizations.of(context).constantInternetServices),
                            Divider(
                              color: Color(0xffF4F4F5),
                              thickness: 2,
                            ),
                            amenities(Icons.explore_outlined, this.widget.dormitory.details.coordinates.latitude.toString()+'° N  , '+this.widget.dormitory.details.coordinates.longitude.toString()+'° E'),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 37.h,
                      ),
                      //rules
                      dormAttributes(AppLocalizations.of(context).rules,Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            rules(Icons.close,AppLocalizations.of(context).noSmoking),
                            rules(Icons.close, AppLocalizations.of(context).noCooking),
                          ],
                        ),
                      ), ),
                      SizedBox(
                        height: 37.h,
                      ),
                      //location
                      dormAttributes(AppLocalizations.of(context).routeFromDormitorytoSchool, Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              AppLocalizations.of(context).clickontheImagetoseehowFar,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14.sp,
                                height: 1.92.h,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: InkWell(
                                  onTap: ()async{
                                   // final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;
                                    if (await MapLauncher.isMapAvailable(MapType.google)) {
                                      await MapLauncher.showDirections(
                                        origin: Coords(this.widget.dormitory.details.coordinates.latitude, this.widget.dormitory.details.coordinates.longitude),
                                        destination: Coords(reservedInstitute[checkChange].institutedetails.coordinates.latitude, reservedInstitute[checkChange].institutedetails.coordinates.longitude),
                                        mapType: MapType.google,
                                        originTitle: this.widget.dormitory.title,
                                        destinationTitle: reservedInstitute[checkChange].title,
                                      );
                                    }
                                    else if(await MapLauncher.isMapAvailable(MapType.apple)){
                                      await MapLauncher.showDirections(
                                        origin: Coords(this.widget.dormitory.details.coordinates.latitude, this.widget.dormitory.details.coordinates.longitude),
                                        destination: Coords(reservedInstitute[checkChange].institutedetails.coordinates.latitude, reservedInstitute[checkChange].institutedetails.coordinates.longitude),
                                        mapType: MapType.apple,
                                        originTitle: this.widget.dormitory.title,
                                        destinationTitle: reservedInstitute[checkChange].title,
                                      );
                                    }
                                    else{
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          duration: Duration(seconds: 1),
                                          content:
                                          Text("No MAPS installed on your device.",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )));
                                    }


                                  },
                                  enableFeedback: true,
                                  child: Image.asset(
                                    'assets/images/routeThumbnail.png',
                                    fit: BoxFit.cover,
                                    width: width,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), ),
                      SizedBox(
                        height: 50,
                      ),

                      //button.//
                      (!hideCheckOut)
                      ?Column(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: width,
                              child: ElevatedButton(
                                  onPressed: () {



                                    reservedDormitory[checkChange] = this.widget.dormitory;

                                    if(checkFirst){
                                      Navigator.pushNamed(context,toDormitory_page.routeName);
                                    }
                                    else
                                      {
                                        if(fromCheckout){
                                          fromCheckout = false;
                                          Navigator.pushNamed(context, checkout_page.routeName);
                                        }
                                        else
                                          Navigator.pushNamed(context, userform_page.routeName);
                                      }

                                  },
                                  child: Text(
                                    AppLocalizations.of(context).iwanttolivehere,
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
                              child: Text(AppLocalizations.of(context).gotoListofSchools,style: TextStyle(
                                color: Color(0xff03045e),
                                fontFamily: 'Inter',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ],
                      )
                          :Container(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}