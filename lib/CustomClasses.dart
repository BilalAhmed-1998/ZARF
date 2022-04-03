import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/school.dart';

import 'dummydata.dart';



class CustomSearchDelegate extends SearchDelegate{

  List<Institute> searchItems;

  CustomSearchDelegate(){
    this.searchItems = Allinstitutes;
  }

  @override
  List<Widget> buildActions(BuildContext context){

    return[

      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear)),

    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    List<Institute> matchQuery = [];
    for (var Institute in searchItems){
      if(Institute.title.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(Institute);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index)
        {
          return InstituteSearchCard(
            width: 335.w,
            height: 156.h,
            institute: matchQuery[index],
          );
        }
    );

  }

  @override
  Widget buildSuggestions(BuildContext context){

    List<Institute> matchQuery = [];
    for (var Institute in searchItems){
      if(Institute.title.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(Institute);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index)
        {
          return InstituteSearchCard(
            width: 335.w,
            height: 156.h,
            institute: matchQuery[index],
          );
        }
    );

  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(

        hintStyle: TextStyle(
         color: Color(0xffD1D5DB),
          fontSize: 16.sp,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      appBarTheme: theme.appBarTheme.copyWith(
        foregroundColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Inter",
            fontStyle: FontStyle.normal,
            color:Color(0xff27303F),
          ),
          iconTheme: IconThemeData(
            color: Color(0xff27303F),
            size: 16.sp,
          ),
          actionsIconTheme: IconThemeData(
            color: Color(0xff27303F),
            size: 16.sp,
          ),

      ),
      // appbar background color
     textSelectionTheme: TextSelectionThemeData(cursorColor: Color(0xff27303F) ),  // cursor color
       //hint text color//icons color
      textTheme: theme.textTheme.copyWith(
        headline6: TextStyle(
            fontWeight: FontWeight.normal,
          color: Color(0xff27303F),
          fontSize: 16.sp,
        ),  // query Color
      ),
    );
  }




}