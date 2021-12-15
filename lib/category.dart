

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/schoolSearch_page.dart';

List<CategoryData> categories = [
  CategoryData(title: "Business", image: 'assets/images/Bus.png'),
  CategoryData(title: "IT", image: "assets/images/IT.png"),
  CategoryData(title: "Engineering", image: "assets/images/ENG.png"),
  CategoryData(title: "Chemistry", image: "assets/images/ENG.png"),
  CategoryData(title: "Business", image: 'assets/images/Bus.png'),
  CategoryData(title: "IT", image: "assets/images/IT.png"),
  CategoryData(title: "Engineering", image: "assets/images/ENG.png"),
  CategoryData(title: "Chemistry", image: "assets/images/ENG.png"),
];

class CategoryData {
  String image;
  String title;

  CategoryData({this.title, this.image});
}

class CategoryCard extends StatelessWidget {
  CategoryData data;
  double height;

  CategoryCard({this.data, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => schoolSearch_page(toshowtitle: this.data.title+" Schools",toshowlist: Allinstitutes),
          ),
        );

      },
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xfff5f9ff),
          borderRadius: BorderRadius.circular(8),
        ),
        //padding: EdgeInsets.all(5.0),
        height: this.height,
        width: this.height,
        child: Column(
          children: [
            Image(
              image: AssetImage(this.data.image),
              height: this.height - 20,
            ),
            Text(
              this.data.title,
              style: TextStyle(
                color: Color(0xff03045e),
                fontSize: 14.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}