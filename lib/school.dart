import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/schooldetail_page.dart';


class TeachingPrograms {


  String title;
  int duration;
  String specification;
  String description;
  var careers = new Map();

  TeachingPrograms({this.title,this.duration,this.specification,this.description,this.careers,});

}

class InstituteDetails {

  String institutetype;
  double rating;
  int tutionfee;
  String description;
  //List <bool> isSelected;
  List <TeachingPrograms> teachingprograms;
  List <String> images;

  InstituteDetails({this.institutetype,this.rating,this.tutionfee,this.description,this.teachingprograms,this.images});



}

class Institute {
  String title;
  String category;
  String image;
  String location;
  bool public;
  InstituteDetails institutedetails;

  Institute(
      {this.title, this.category, this.image, this.location, this.public,this.institutedetails});
}


//Insitutes Tiles Home Page//////////

class InstituteCard extends StatelessWidget {
  double height;
  double width;
  Institute institute;

  InstituteCard({this.height, this.institute,this.width});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => schooldetail_page(institute: this.institute,),
          ),
        );

      },
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 0),
        height: height,
        width: width,
        //color: Colors.lightBlueAccent,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
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
                        this.institute.category + " School",
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
          ],
        ),
      ),
    );
  }
}



////Institute  Search Card////

class InstituteSearchCard extends StatefulWidget {
  //const InstituteSearchCard({Key? key}) : super(key: key);
  double height;
  Institute institute;
  double width;
  IconData boomark;

  InstituteSearchCard({this.height,this.width,this.institute}){
    if (favts.contains(this.institute)){
      this.boomark = Icons.bookmark;
    }
    else{
      this.boomark= Icons.bookmark_border;
    }
  }

  @override
  _InstituteSearchCardState createState() => _InstituteSearchCardState();
}

class _InstituteSearchCardState extends State<InstituteSearchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => schooldetail_page(institute: this.widget.institute,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 18.h),
        height: this.widget.height,
        width: this.widget.width,
        //color: Colors.lightBlueAccent,
        child: Stack(
          children: [

            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  this.widget.institute.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: this.widget.width,
                height: 72.h,//this.widget.height/2.175,
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
                        this.widget.institute.category + " School",
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
                  onTap: (){
                    if(this.widget.boomark == Icons.bookmark_border)
                    setState(() {
                      this.widget.boomark = Icons.bookmark;
                      favts.add(this.widget.institute);


                    });
                    else{
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


