import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/ref_passport.dart';
import 'package:zarf/screens/refhome_page.dart';

class ref_certificate extends StatefulWidget {
  static const routeName = '/ref_certificate';

  @override
  _ref_certificateState createState() => _ref_certificateState();
}

class _ref_certificateState extends State<ref_certificate> {




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Birth Certificate',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'InterBold'
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  child: Image.asset('assets/images/ref6.png',),
                  radius: 51,
                  backgroundColor: Color(0xffF9FAFB),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae',
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'How to Upload',
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.check,
                          size: 15,
                          color: Color(0xff03045E),
                        ),
                      ),
                      Text(
                        ' Lorem ipsum dolor sit amet, consectetur ',
                        style: TextStyle(
                            color: Color(0xff6B7280),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.check,
                          size: 15,
                          color: Color(0xff03045E),
                        ),
                      ),
                      Text(
                        ' dolor sit amet, lorem ipsum.',
                        style: TextStyle(
                            color: Color(0xff6B7280),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 85,
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                        //margin: EdgeInsets.symmetric(horizontal: 40),
                        width: width,
                        color: Colors.grey[500],
                        child: Image.asset(
                          'assets/images/ref8.png',
                          fit: BoxFit.cover,
                        )

                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.description_outlined,
                          size: 20,
                          color: Color(0xff03045E),
                        ),
                      ),
                      Text(
                        ' Upload Progress',
                        style: TextStyle(
                            color: Color(0xff03045E),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width-50,
                    child: ProgressBar2(),

                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 46,
                      width: 147,
                      decoration: BoxDecoration(
                          color: Color(0xff03045E),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: InkWell(
                        onTap: () {


                        },
                        child: Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'InterBold',
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(
                    height: 30,
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}


