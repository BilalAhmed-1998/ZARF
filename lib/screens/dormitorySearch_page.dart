import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/dormitory.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dummydata.dart';

class dormitorySearch_page extends StatefulWidget {
  static const routeName = '/dormitorySearch_page';
  List<Dormitory> distanceCalculatedList =[];
  List<Dormitory> mainshowlist;
  List<Dormitory> publicList=[];
  List<Dormitory> privateList=[];
  //const dormitorySearch_page({Key? key}) :super(key: key);

  dormitorySearch_page({this.distanceCalculatedList}){

    //sorting dormitories list//
    distanceCalculatedList.sort((a, b) => a.distance.compareTo(b.distance));

    //dividing list into public and private list//
    for(var i =0;i<distanceCalculatedList.length;i++){
      if(distanceCalculatedList[i].public == true)
        publicList.add(distanceCalculatedList[i]);
       else
         privateList.add(distanceCalculatedList[i]);

  }
    mainshowlist = distanceCalculatedList;
  }

  @override
  _dormitorySearch_pageState createState() => _dormitorySearch_pageState();
}

class _dormitorySearch_pageState extends State<dormitorySearch_page> {
 List<bool> selected=[
    true,
    false,
   false
  ];

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          AppLocalizations.of(context).dormitories,
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
                  toshow:"Dormitory Questions", FAQs: FAQs,),
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search bar
            Container(
              //margin: EdgeInsets.only(top:8,left:5,right: 10),
              //height: 45,
              child: CupertinoSearchTextField(

                onChanged: (val){

                  matchString(val);
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
              ),
            ),
            //Buttons (public,private)
            SizedBox(
              height: 24.h,
            ),
            Container(
             // margin: EdgeInsets.only(top: 25, left: 10),
              child: ToggleButtons(
                isSelected: selected,
                selectedColor: Color(0xff03045E),
                renderBorder: false,
                color: Color(0xff64748B),
                fillColor: Colors.transparent,
                splashColor: Colors.transparent,
                children: [
                  Container(
                    width: 71.w,
                    height: 37.h,
                    margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff8fafc),
                    ),

                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).all,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter"
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 85.w,
                    height: 37.h,
                    margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff8fafc),
                    ),

                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).private,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter"
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 85.w,
                    height: 37.h,
                    margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff8fafc),
                    ),

                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).state,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter"
                        ),
                      ),
                    ),
                  ),
                ],

                onPressed: (index){
                  setState(() {
                    selected[index]= true;

                    for (var i = 0; i < this.selected.length; i++)
                      if(i!=index) {
                        selected[i]=false;
                      }

                    if(index==1)
                      widget.mainshowlist = widget.privateList;
                    else if(index==2)
                      widget.mainshowlist = widget.publicList;
                    else
                    widget.mainshowlist = widget.distanceCalculatedList;




                  });


                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            //result description
            Container(
              //margin: EdgeInsets.only(left:10 , top: 40, bottom: 10),
              child: RichText(
                text: TextSpan(
                  text:AppLocalizations.of(context).showing,
                  style: TextStyle(
                    color: Color(0xff6b7280),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter',
                  ),
                  children: [
                    TextSpan(
                      text: widget.mainshowlist.length.toString(),
                      style: TextStyle(
                        color: Color(0xff374151),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context).results,
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
              height: 24.h,
            ),
            //dormitories
            Flexible(
              child: ListView.builder(
                itemCount: widget.mainshowlist.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return DormitoryCard(
                    height: 156.h,
                    dormitory:widget.mainshowlist[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

 void matchString(String query){

   if (query==""){
     if(selected[0]==true){
       setState(() {
         widget.mainshowlist = widget.privateList;
       });
     }
     else{
       setState(() {
         widget.mainshowlist = widget.publicList;
       });

     }
   }
   else {
     if(selected[0]==true){
       List<Dormitory> matchQuery = [];
       for (var Dormitory in widget.privateList) {
         if (Dormitory.title.toLowerCase().contains(query.toLowerCase())) {
           matchQuery.add(Dormitory);

         }
       }
       setState(() {
         this.widget.mainshowlist = matchQuery;
       });
     }
     else{
       List<Dormitory> matchQuery = [];
       for (var Dormitory in widget.publicList) {
         if (Dormitory.title.toLowerCase().contains(query.toLowerCase())) {
           matchQuery.add(Dormitory);

         }
       }
       setState(() {
         this.widget.mainshowlist = matchQuery;
       });

     }

     }



 }

}
