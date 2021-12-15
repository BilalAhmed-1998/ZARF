import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/school.dart';
import 'package:zarf/screens/dormitorydetail_page.dart';

List<Institute> checkoutschools =[

  Institute(
      title: "Samson's Harly School",
      category: "Business",
      image: "assets/images/school1.png",
      location: "Poprad",
      public: true,
      institutedetails: InstituteDetails(
          institutetype: "HIGH SCHOOL",
          rating: 4.2,
          tutionfee: 1000,
          description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
          teachingprograms: [
            TeachingPrograms(
                title: "Nursing",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Technology",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
            TeachingPrograms(
                title: "Banking",
                duration: 2,
                specification: "Medical Science",
                description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                careers: {"Dentist":"1000-2000","Surgery":"2000-3000","Neurolab":"4000-5000",}
            ),
          ],
          images: [
            'assets/images/dorm1.png',
            'assets/images/dorm2.png',
            'assets/images/dorm3.png',
          ]
      )

  )
];

List<Dormitory> dormitories = [
  Dormitory(
      title: 'Sassy',
      address: "Poprad Sakir Abo Street",
      distance: 11,
      image: 'assets/images/dorm1.png',
      details: DormitoryDetails(
        rent: 1000,
        meal: 794,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae ",
        beds: 4,
        water: true,
        electricity: true,
        internet: true,
        coordinates: "+454NE -345SE",
        images: [
          'assets/images/dorm1.png',
          'assets/images/dorm2.png',
          'assets/images/dorm3.png'
        ]
      )
  ),
  Dormitory(
      title: 'Kessy',
      address: "Poprad Sakir Abo Street",
      distance: 11,
      image: 'assets/images/dorm2.png',
      details: DormitoryDetails(
          rent: 1000,
          meal: 794,
          description:
              "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae ",
          beds: 4,
          water: true,
          electricity: true,
          internet: true,
          coordinates: "+454NE -345SE",
          images: [
            'assets/images/dorm2.png',
            'assets/images/dorm1.png',
            'assets/images/dorm3.png'
          ]
      ),
  ),
  Dormitory(
      title: 'Lasaseds',
      address: "Poprad Sakir Abo Street",
      distance: 11,
      image: 'assets/images/dorm3.png',
      details: DormitoryDetails(
          rent: 1000,
          meal: 794,
          description:
              "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae ",
          beds: 4,
          water: true,
          electricity: true,
          internet: true,
          coordinates: "+454NE -345SE",
          images: [
            'assets/images/dorm3.png',
            'assets/images/dorm2.png',
            'assets/images/dorm1.png'
          ]
      ))
];

class DormitoryDetails {
  double rent;
  double meal;
  String description;
  int beds;
  bool water, electricity, internet;
  String coordinates;
  List<String> rules;
  List<String> images;
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
  String image;
  DormitoryDetails details;
  Dormitory(
      {this.title, this.address, this.distance, this.image, this.details});
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
      child: Container(
        height: this.height,
        width: 335.w ,
        margin: EdgeInsets.only(
          bottom: 36.h
        ),
        //color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.red,
          image: DecorationImage(
            image: AssetImage(this.dormitory.image),
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
                                RichText(
                                  text: TextSpan(
                                    text: this.dormitory.distance.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 11.sp,
                                      color: Color(0xff00ffff),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' miles away',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 11.sp,
                                          color: Colors.grey.shade100,
                                        ),
                                      ),
                                    ],
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


