import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ref_package extends StatelessWidget {
  static const routeName = '/ref_package';

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
          'Document Package #1',
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
                  child: Image.asset('assets/images/ref20.png',),
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
                  height: 1.7,
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset('assets/images/ref21.png',),
              SizedBox(
                height: 15,
              ),
              Text(
                'Documents to pack',
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700
                ),
              ),


              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Color(0xff03045E),
                    ),
                  ),
                  Text(
                    ' School report',
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
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Color(0xff03045E),
                    ),
                  ),
                  Text(
                    ' Birth certificate',
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
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Color(0xff03045E),
                    ),
                  ),
                  Text(
                    ' Signed sheet of paper',
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
                height: 30,
              ),
              Image.asset('assets/images/ref22.PNG',),
              SizedBox(
                height: 15,
              ),
              Text(
                'How to pack',
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700
                ),
              ),


              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500
                    ),

                  ),
                  Container(
                    width: width-70,
                    child: Text(
                      'Make sure all the documents are correct',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.start,

                  ),
                  Container(
                    width: width-70,
                    child: Text(
                      'Put them into plastic cover, so they are protected during the transportation',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500
                    ),

                  ),
                  Container(
                    width: width-70,
                    child: Text(
                      'Close the package and use the glue it. This way we eliminate the risk of package opening during the transportation',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500
                    ),

                  ),
                  Container(
                    width: width-70,
                    child: Text(
                      'Lorem ipsum doloret ignser daker dna iap',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/ref23.png',),
              SizedBox(
                height: 15,
              ),
              Text(
                'How to Send The Document?',
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700
                ),
              ),


              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500
                    ),

                  ),
                  Container(
                    width: width-70,
                    child: Text(
                      'On the package label write this address:',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '    ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.start,

                  ),
                  Container(
                    width: width-70,
                    child: Text(
                      'Mukachevo 23, Zalluzie, Ukraine',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'InterBold',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500
                    ),

                  ),
                  Container(
                    width: width-70,
                    child: Text(
                      'Send it as a insured package. This way you can track the package and know exactly where you documents are currently at.',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                  height: 46,
                  width: width-40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff03045E)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: InkWell(
                    enableFeedback: true,
                    onTap: () {

                    },
                    child: Center(
                      child: Text(
                        'Complete',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'InterBold',
                          fontWeight: FontWeight.w800,
                          color: Color(0xff03045E),
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 30,
              )

            ],
          ),
        ),
      ),
    );
  }
}
