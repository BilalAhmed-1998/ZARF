// ignore_for_file: non_constant_identifier_names, missing_return

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/schooldetail_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TeachingPrograms {
  String title;
  String duration;
  String specification;
  String description;
  var careers = [];

  TeachingPrograms({
    this.title,
    this.duration,
    this.specification,
    this.description,
    this.careers,
  });
}

class InstituteDetails {
  GeoPoint coordinates;
  String institutetype;
  dynamic rating;
  int tutionfee;
  String description;
  //List <bool> isSelected;
  List<TeachingPrograms> teachingprograms;
  List<dynamic> images;

  InstituteDetails(
      {this.institutetype,
      this.rating,
      this.tutionfee,
      this.description,
      this.teachingprograms,
        this.coordinates,
      this.images});
}

class Institute {
  String title;
  List<dynamic> category;
  dynamic image;
  //Future<String> Image;
  String location;
  bool public;
  InstituteDetails institutedetails;

  Institute(
      {this.title,
      this.category,
      this.image,
      this.location,
      this.public,
      this.institutedetails});
}

//Insitutes Tiles Home Page//////////

class InstituteCard extends StatelessWidget {

  double height;
  double width;
  Institute institute;

  InstituteCard({this.height, this.institute, this.width});
  String catTemp(){
    String cat="";
    for(int j=0; j<this.institute.category.length;j++ )
      this.institute.category.length==this.institute.category.length-1?
      cat+=this.institute.category[j]+"":cat+=this.institute.category[j]+",";
    return cat;
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 0),
      height: height,
      width: width,
      //color: Colors.lightBlueAccent,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:this.institute.image.runtimeType!=String? FutureBuilder(
                  future: this.institute.image,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if(snapshot.hasError)
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
                      else
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
                  }): Image.network(
                this.institute.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: 75.h,
              padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                color: Colors.black.withOpacity(0.28),
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.black.withOpacity(0.7),
                //     Colors.transparent,
                //
                //   ]
                // )
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      catTemp(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff00ffff),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      this.institute.title,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "InterBold",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          size: 12.sp,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          this.institute.location,
                          style: TextStyle(
                            fontSize: 11.sp,
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          CupertinoIcons.tags,
                          size: 12.sp,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        (this.institute.public)
                            ? Text(
                          AppLocalizations.of(context).state,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              )
                            : Text(
                          AppLocalizations.of(context).private,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////

////Institute  Search Card////

class InstituteSearchCard extends StatefulWidget {
  //const InstituteSearchCard({Key? key}) : super(key: key);
  double height;
  Institute institute;
  double width;
  IconData boomark;

  InstituteSearchCard({this.height, this.width, this.institute}) {
    if (favts.contains(this.institute)) {
      this.boomark = Icons.bookmark;
    } else {
      this.boomark = Icons.bookmark_border;
    }
  }

  @override
  _InstituteSearchCardState createState() => _InstituteSearchCardState();
}

class _InstituteSearchCardState extends State<InstituteSearchCard> {
  String catTemp(){
    String cat="";
    for(int j=0; j<this.widget.institute.category.length;j++ )
      this.widget.institute.category.length==this.widget.institute.category.length-1?
      cat+=this.widget.institute.category[j]+"":cat+=this.widget.institute.category[j]+",";
    return cat;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => schooldetail_page(
              institute: this.widget.institute,
              context: context,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        height: this.widget.height,
        width: this.widget.width,
        //color: Colors.lightBlueAccent,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FutureBuilder(
                    future: this.widget.institute.image,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if(snapshot.hasError)
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
                        else
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
                    }),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: this.widget.width,
                height: 72.h, //this.widget.height/2.175,
                padding: EdgeInsets.fromLTRB(14.w, 5.h, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  color: Colors.black.withOpacity(0.28),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.black.withOpacity(0.7),
                  //     Colors.transparent,
                  //
                  //   ]
                  // )
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catTemp(),
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff00ffff),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        this.widget.institute.title,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "InterBold",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/location.png"),
                            size: 15.sp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            this.widget.institute.location,
                            style: TextStyle(
                              fontSize: 11.sp,
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ImageIcon(
                            AssetImage("assets/images/tag.png"),
                            size: 15.sp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          (this.widget.institute.public)
                              ? Text(
                                  "Public",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade300,
                                  ),
                                )
                              : Text(
                                  "Private",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                        ],
                      ),
                    ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (this.widget.boomark == Icons.bookmark_border)
                      setState(() {
                        this.widget.boomark = Icons.bookmark;
                        favts.add(this.widget.institute);
                      });
                    else {
                      setState(() {
                        this.widget.boomark = Icons.bookmark_border;
                        favts.remove(this.widget.institute);
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      this.widget.boomark,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/////Institute Search Card 2.0 //////////////

class InstituteSearchCard2 extends StatefulWidget {
  //const InstituteSearchCard2({Key? key}) : super(key: key);

  double height;
  Institute institute;
  double width;
  IconData boomark;

  InstituteSearchCard2({this.height, this.width, this.institute}) {
    if (favts.contains(this.institute)) {
      this.boomark = Icons.bookmark;
    } else {
      this.boomark = Icons.bookmark_border;
    }
  }

  @override
  _InstituteSearchCard2State createState() => _InstituteSearchCard2State();
}

class _InstituteSearchCard2State extends State<InstituteSearchCard2> {

  String catTemp(){
    String cat="";
    for(int j=0; j<this.widget.institute.category.length;j++ )
      this.widget.institute.category.length==this.widget.institute.category.length-1?
      cat+=this.widget.institute.category[j]+"":cat+=this.widget.institute.category[j]+",";
    return cat;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => schooldetail_page(
              institute: this.widget.institute,
              context: context,

            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 36.h),
        height: this.widget.height,
        width: this.widget.width,
        //color: Colors.lightBlueAccent,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: this.widget.institute.image.runtimeType!=String?FutureBuilder(
                    future: this.widget.institute.image,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if(snapshot.hasError)
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
                        else
                        return Image.network(
                          snapshot.data,
                          fit: BoxFit.cover,
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 400,
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    }):Image.network(
                  this.widget.institute.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: this.widget.width,
                height: 72.h, //this.widget.height/2.175,
                padding: EdgeInsets.fromLTRB(14.w, 5.h, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  color: Colors.black.withOpacity(0.28),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.black.withOpacity(0.7),
                  //     Colors.transparent,
                  //
                  //   ]
                  // )
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catTemp(),
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff00ffff),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        this.widget.institute.title,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "InterBold",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/location.png"),
                            size: 15.sp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            this.widget.institute.location,
                            style: TextStyle(
                              fontSize: 11.sp,
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ImageIcon(
                            AssetImage("assets/images/tag.png"),
                            size: 15.sp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          (this.widget.institute.public)
                              ? Text(
                                  "Public",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade300,
                                  ),
                                )
                              : Text(
                                  "Private",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                        ],
                      ),
                    ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (this.widget.boomark == Icons.bookmark_border)
                      setState(() {
                        this.widget.boomark = Icons.bookmark;
                        favts.add(this.widget.institute);
                      });
                    else {
                      setState(() {
                        this.widget.boomark = Icons.bookmark_border;
                        favts.remove(this.widget.institute);
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      this.widget.boomark,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////
