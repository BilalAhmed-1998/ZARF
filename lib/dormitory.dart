// ignore_for_file: missing_return

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/school.dart';
import 'package:zarf/screens/dormitorydetail_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class DormitoryDetails {
  double rent;
  double meal;
  String description;
  int beds;
  bool water, electricity, internet;
  GeoPoint coordinates;
  List<String> rules;
  List<dynamic> images;
  DormitoryDetails(
      {this.rent,
      this.meal,
      this.description,
      this.beds,
      this.water,
      this.electricity,
      this.internet,
      this.coordinates,
      this.images,
      this.rules});
}

class Dormitory {
  String title;
  String address;
  int distance;
  dynamic image;
  DormitoryDetails details;
  bool public;
  Dormitory(
      {this.title, this.address, this.distance, this.image, this.details,this.public});
}

class DormitoryCard extends StatelessWidget {
  static const routeName = '/dormitory';
  Dormitory dormitory;
  double height;
  DormitoryCard({this.height, this.dormitory});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      enableFeedback: true,
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => dormitorydetail_page(
                    dormitory: this.dormitory)));

      },
      child:this.dormitory.image.runtimeType!=String? FutureBuilder(
          future: this.dormitory.image,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return
                Container(
                  height: this.height,
                  width: 335.w ,
                  margin: EdgeInsets.only(
                      bottom: 36.h
                  ),
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.red,
                    image:
                    DecorationImage(
                      image: NetworkImage(snapshot.data),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(14.w, 11.h, 0, 0),
                            color: Colors.black.withOpacity(0.28),
                            height: 65.h,//height/2.75,
                            width: 335.w,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        this.dormitory.title + " Dormitory",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.circle_filled,
                                            size: 7,
                                            color: Color(0xff00ffff),
                                          ),
                                          Text(
                                            ' ' + this.dormitory.address,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 11.sp,
                                              color: Colors.grey.shade100,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                            height: 20.h,
                                            child: VerticalDivider(
                                              color: Colors.grey.shade100,
                                              thickness: 1,
                                              indent: 0,
                                              endIndent: 0,
                                            ),
                                          ),
                                          Container(
                                            width: 120.w,
                                            child: RichText(
                                              text: TextSpan(
                                                text: (this.dormitory.distance*0.621371).toStringAsFixed(1).toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 11.sp,
                                                  color: Color(0xff00ffff),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: AppLocalizations.of(context).milesAway,
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontSize: 11.sp,
                                                      color: Colors.grey.shade100,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }):
      Container(
        height: this.height,
        width: 335.w ,
        margin: EdgeInsets.only(
            bottom: 36.h
        ),
        //color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.red,
          image:
          DecorationImage(
            image: NetworkImage(this.dormitory.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(14.w, 11.h, 14.w, 0),
                  color: Colors.black.withOpacity(0.28),
                  height: 65.h,//height/2.75,
                  width: 335.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.dormitory.title + " Dormitory",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.circle_filled,
                                  size: 7,
                                  color: Color(0xff00ffff),
                                ),
                                Text(
                                  ' ' + this.dormitory.address,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                  height: 20.h,
                                  child: VerticalDivider(
                                    color: Colors.grey.shade100,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                ),
                                Container(
                                  width: 120.w,
                                  child: RichText(
                                    text: TextSpan(
                                      text: (this.dormitory.distance*0.621371).toStringAsFixed(1).toString(),
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 11.sp,
                                        color: Color(0xff00ffff),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: AppLocalizations.of(context).milesAway,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 11.sp,
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}

class DormitoryCard1 extends StatelessWidget {
  static const routeName = '/dormitory';
  Dormitory dormitory;
  double height;
  DormitoryCard1({this.height, this.dormitory});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (this.dormitory.image.runtimeType!=String) {
      return FutureBuilder(
        future: this.dormitory.image,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Container(
              height: this.height,
              //width: width,
              margin: EdgeInsets.only(
                  bottom: 36.h
              ),
              //color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage(snapshot.data),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(14.w, 11.h, 14.w, 0),
                        color: Colors.black.withOpacity(0.28),
                        height: 65.h,
                        //height/2.75,
                        width: width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    this.dormitory.title + " Dormitory",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.circle_filled,
                                        size: 7,
                                        color: Color(0xff00ffff),
                                      ),
                                      Text(
                                        ' ' + this.dormitory.address,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 11.sp,
                                          color: Colors.grey.shade100,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                        height: 20.h,
                                        child: VerticalDivider(
                                          color: Colors.grey.shade100,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                      ),
                                      Container(
                                        width: 120.w,
                                        child: RichText(
                                          text: TextSpan(
                                            text: this.dormitory.distance
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 11.sp,
                                              color: Color(0xff00ffff),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: AppLocalizations.of(context).milesAway,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 11.sp,
                                                  color: Colors.grey.shade100,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            );
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container(
          child: CircularProgressIndicator.adaptive(),
        );
      }
        } );
    } else {
      return Container(
        height: this.height,
        //width: width,
        margin: EdgeInsets.only(
            bottom: 36.h
        ),
        //color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.red,
          image: DecorationImage(
            image: NetworkImage(this.dormitory.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(14.w, 11.h, 14.w, 0),
                  color: Colors.black.withOpacity(0.28),
                  height: 65.h,
                  //height/2.75,
                  width: width-20.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.dormitory.title + " Dormitory",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.circle_filled,
                                  size: 7,
                                  color: Color(0xff00ffff),
                                ),
                                Text(
                                  ' ' + this.dormitory.address,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                  height: 20.h,
                                  child: VerticalDivider(
                                    color: Colors.grey.shade100,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                ),
                                Container(
                                  width: 120.w,
                                  child: RichText(
                                    text: TextSpan(
                                      text: this.dormitory.distance
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 11.sp,
                                        color: Color(0xff00ffff),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: AppLocalizations.of(context).milesAway,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 11.sp,
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

