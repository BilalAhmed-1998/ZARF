

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/schoolSearch_page.dart';

List<CategoryData> categories = [
  CategoryData(title: "Languages", image: 'assets/images/cat1.png', translation: "Мови"),
  CategoryData(title: "Government", image: 'assets/images/cat2.png',translation: "Уряд,Право"),
  CategoryData(title: "Art,Acting,Showbusiness", image: 'assets/images/cat3.png',translation: "Мистецтво,Акторство,Шоу-бізнес"),
  CategoryData(title: "Construction,Building", image: 'assets/images/cat4.png',translation: "Будівництво"),
  CategoryData(title: "Cooking,Hotel,Tourism", image: 'assets/images/cat5.png',translation: "Кулінарія,Готельна,Туристична сфера"),
  CategoryData(title: "Teaching,Education", image: 'assets/images/cat6.png',translation: "Викладання"),
  CategoryData(title: "Medical,Social Services", image: 'assets/images/cat7.png',translation: "Медицина,Соціальні послуги"),
  CategoryData(title: "Sport", image: 'assets/images/cat8.png',translation: "Спорт"),
  CategoryData(title: "Business,Finance,Accounting", image: 'assets/images/cat9.png',translation: "Бізнес,Бухгалтерія"),
  CategoryData(title: "Grammar Schools", image: 'assets/images/cat10.png',translation: "Гімназія"),
  CategoryData(title: "Engineering", image: 'assets/images/cat11.png',translation: "Інженерія"),
  CategoryData(title: "IT", image: 'assets/images/cat12.png',translation: "IT"),

];

class CategoryData {
  String image;
  String title;
  String translation;

  CategoryData({this.title, this.image,this.translation});
}

class CategoryCard extends StatelessWidget {
  CategoryData data;
  double height;

  CategoryCard({this.data, this.height});
  List<String> catlist;
  String convertString(String temp){
    catlist=this.data.translation.split(',');
    return catlist[0];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
            convertString(this.data.translation),
            style: TextStyle(
              color: Color(0xff03045e),
              fontSize: 14.sp,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
    catlist.length==1?"": catlist.length==2?catlist[1]:catlist[1]+' & ' +catlist[2],
            style: TextStyle(
              color: Color(0xff03045e),
              fontSize: 5.sp,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}