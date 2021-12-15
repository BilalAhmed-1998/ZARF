import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ref_departure extends StatelessWidget {
  static const routeName = '/ref_departure';

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
          onPressed: (){

          },
          icon: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,),
          ),
        ),
        title: Text(
          'Departure',
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Interbold'
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                  width: width,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xff03045e),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                        child: Image.asset('assets/images/ref3.png'),
                      alignment: Alignment.centerRight,

                    ),

                    Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'Countdown',
                          style: TextStyle(
                            color: Color(0xff6B7280),
                            fontSize: 14,
                            fontFamily: ('inter'),
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '03h 12m 06s',
                          style: TextStyle(
                              color: Color(0xff1F2937),
                              fontSize: 22,
                              fontFamily: ('InterBold'),
                              fontWeight: FontWeight.w800
                          ),
                        ),
                        Text(
                          'Until your arrival to slovakia',
                          style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 12,
                              fontFamily: ('inter'),
                              fontWeight: FontWeight.w500
                          ),
                        ),

                      ],
                    ),
                  ),
                  ]
                )
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Color(0xff8a959e).withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: Offset(0,8),

                  )],
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Transport Instructions',
                      style: TextStyle(
                          color: Color(0xff1F2937),
                          fontSize: 16,
                          fontFamily: ('InterBold'),
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 12,
                          child: Icon(
                            Icons.check,
                            color: Color(0xff03045E),
                            size: 20,
                          ),
                        ),
                        Container(
                          width: width-100,
                          child: Text(
                            ' Lorem ipsum dolor sit amet, consectetur ',
                            style: TextStyle(
                                color: Color(0xff6B7280),
                                fontSize: 14,
                              fontFamily: ('Inter'),
                              fontWeight: FontWeight.w500
                            ),
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
                          backgroundColor: Colors.grey[100],
                          radius: 12,
                          child: Icon(
                            Icons.check,
                            color: Color(0xff03045E),
                            size: 20,
                          ),
                        ),
                        Container(
                          width: width-100,
                          child: Text(
                            ' dolor sit amet, lorem ipsum.',
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 14,
                              fontFamily: ('Inter'),
                              fontWeight: FontWeight.w500
                            ),
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
                          backgroundColor: Colors.grey[100],
                          radius: 13,
                          child: Icon(
                            Icons.check,
                            color: Color(0xff03045E),
                            size: 20,
                          ),
                        ),
                        Container(
                          width: width-100,
                          child: Text(
                            ' Lorem ipsum dolor sit amet, consectetur ',
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 14,
                              fontFamily: ('Inter'),
                              fontWeight: FontWeight.w500,
                            ),
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
                          backgroundColor: Colors.grey[100],
                          radius: 12,
                          child: Icon(
                            Icons.check,
                            color: Color(0xff03045E),
                            size: 20,
                          ),
                        ),
                        Container(
                          width: width-100,
                          child: Text(
                            ' dolor sit amet, lorem ipsum.',
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 14,
                              fontFamily: ('Inter'),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 100),
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff03045E),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: InkWell(
                  onTap: () {

                  },
                  child: Center(
                    child: Text(
                      'I have my own transport',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: ('InterBold'),
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              )

            ],
          ),
        ),
      )

    );
  }
}
