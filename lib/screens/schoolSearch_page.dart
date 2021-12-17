import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/school.dart';

import '../CustomClasses.dart';


class schoolSearch_page extends StatefulWidget {
  static const routeName = '/schoolSearch_page';
  String toshowtitle;
  List <Institute> toshowlist;

  schoolSearch_page({this.toshowtitle,this.toshowlist});


  @override
  _schoolSearch_pageState createState() => _schoolSearch_pageState();
}

class _schoolSearch_pageState extends State<schoolSearch_page> {
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
         widget.toshowtitle,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'
          ),
        ),
        actions: [
          IconButton(onPressed: (){

          },
            icon: Icon(CupertinoIcons.question_circle,
              color: Colors.black,
              size: 22.sp,
            ),


          ),
        ],
        ),
      body: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(

                  height: 45,
                  width: width/1.3,
                  child: CupertinoSearchTextField(

                    onTap: (){
                      showSearch(

                        context: context,
                        delegate: CustomSearchDelegate(),
                      );

                    },
                    prefixIcon: Icon(CupertinoIcons.search,
                      color: Colors.grey.shade300,

                    ),
                    placeholderStyle: TextStyle(
                      color: Colors.grey.shade300,

                    ),
                    backgroundColor: Colors.white,
                    //borderRadius: BorderRadius.circular(10),
                    itemSize: 25,
                    onChanged: (value){},
                  ),
                ),
                  Container(
                    width: 24,
                    height: 24,
                    // margin: EdgeInsets.symmetric(vertical: height/4.1),

                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5),
                    //   color: Colors.white,
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.grey,
                    //       offset: Offset(0.0, 1.0), //(x,y)
                    //       blurRadius: 6.0,
                    //     ),
                    //   ],
                    // ),

                    child: Transform.rotate(
                        angle: 4.7,
                        child: Icon(
                          CupertinoIcons.slider_horizontal_3,
                          size: 30,
                          color: Color(0xffd1d5db),
                        )),
                  ),
              ]),
            ),
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
                      text: this.widget.toshowlist.length.toString(),
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
              // Text('Showing '+ this.widget.toshowlist.length.toString() +' results',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16,
              //       fontFamily: 'Inter',
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //dormitories
           // for(var i=0;i<Allschools.length;i++)
              Flexible(
              child:
              ListView.builder(
                itemCount: this.widget.toshowlist.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index)
                {
                  return InstituteSearchCard(
                    width: 335.w,
                    height: 156.h,
                    institute: this.widget.toshowlist[index],
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
