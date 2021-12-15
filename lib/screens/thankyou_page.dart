import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/refhome_page.dart';

class thankyou_page extends StatefulWidget {
  static const routeName = '/thankyou_page';

  @override
  _thankyou_pageState createState() => _thankyou_pageState();
}

class _thankyou_pageState extends State<thankyou_page> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset('assets/images/Thankyou.png',),
            ),
            SizedBox(height: 15,),
            Text('Thank you for your purchase!',style: TextStyle(
              color: Color(0xff1F2937),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),),
            SizedBox(height: 20,),

            Text('Welcome to the ZARF Study Exclusive Club.\n'
                  'Thank you for your purchase. '
                  'We are happy you opted for ZARF Study. ',

                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 2,

                  color: Color(0xff6B7280),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                )
              ),
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: 8.5*(width/10),
              child: ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, refhome_page.routeName
                   );
                  },

                  child: Text(
                    "Go to Home",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff03045e),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                    side: BorderSide(color: Color(0xff03045e),
                    style: BorderStyle.solid)


                    //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
