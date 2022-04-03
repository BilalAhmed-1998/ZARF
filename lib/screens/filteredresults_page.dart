
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../school.dart';


class filteredresults_page extends StatefulWidget {

  String location;
  int min;
  int max;
  bool state;
  List <Institute> toshowlist;
  List <Institute> toshowmainlist;


  filteredresults_page({this.max,this.min,this.toshowlist,this.state,this.location}){

    List<Institute> matchQuery = [];
    for (var Institute in this.toshowlist) {
      if(Institute.location == this.location){
        matchQuery.add(Institute);
      }
      else if(Institute.institutedetails.rating.round()>= min && Institute.institutedetails.rating.round()<= max){
        matchQuery.add(Institute);
      }
      else if(state == true){
        if(Institute.public == true){
          matchQuery.add(Institute);
        }
      }
      else if(state == false){
        if(Institute.public == false){
          matchQuery.add(Institute);
        }
      }
    }

    this.toshowmainlist = matchQuery;



  }


  //const filteredresults_page({Key? key}) : super(key: key);



  @override
  _filteredresults_pageState createState() => _filteredresults_pageState();
}

class _filteredresults_pageState extends State<filteredresults_page> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
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
          "Filtered Results",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'
          ),
        ),
        // actions: [
        //   IconButton(onPressed: (){
        //
        //   },
        //     icon: Icon(CupertinoIcons.question_circle,
        //       color: Colors.black,
        //       size: 22.sp,
        //     ),
        //
        //
        //   ),
        // ],
      ),
      body: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search bar
            Divider(
              color: Colors.grey.shade50,
              thickness: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            //result description
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              //margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
              child: RichText(
                text: TextSpan(
                  text:'Showing ',
                  style: TextStyle(
                    color: Color(0xff6b7280),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter',
                  ),
                  children: [
                    TextSpan(
                      text: this.widget.toshowmainlist.length.toString(),
                      style: TextStyle(
                        color: Color(0xff374151),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " results",
                      style: TextStyle(
                        color: Color(0xff6b7280),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //dormitories
            // for(var i=0;i<Allschools.length;i++)
            Flexible(
              child:
              ListView.builder(
                  itemCount: this.widget.toshowmainlist.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index)
                  {
                    return InstituteSearchCard(
                      width: 335.w,
                      height: 156.h,
                      institute: this.widget.toshowmainlist[index],
                    );
                  }
              ),

            ),
          ],
        ),
      ),
    );
  }
}
