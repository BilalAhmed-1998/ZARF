import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ref_certificate.dart';
import 'ref_package.dart';
import 'ref_passport.dart';
import 'ref_report.dart';

class ref_documents extends StatelessWidget {
  static const routeName = '/ref_documents';

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
          onPressed: () {},
          icon: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Documents',
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'InterBold'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text('Upload your documents.',
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: ('inter')
                  )),
              SizedBox(
                height: 15,
              ),
              Text('Online Documents',
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: ('InterBold')
                  )),
              SizedBox(
                height: 8,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_passport.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Color(0xff8a959e).withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: Offset(0,8),

                    )],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  //height: height / 6,
                  width: width,
                  padding: EdgeInsets.fromLTRB(23, 0, 23, 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Passport Copy ',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 16,
                                    fontFamily: ('inter'),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Color(0xff03045E),
                                  radius: 10.0,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width-140,
                              child: Text(
                                'Passport Uploaded Successfully',
                                style: TextStyle(
                                    color: Color(0xff6B7280),
                                  fontSize: 12,
                                  fontFamily: ('Inter'),
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Color(0xff10B981),
                                  size: 14,
                                ),
                                Text(
                                  ' Approved by staff',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 11,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Image.asset('assets/images/ref5.png'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('Offline Documents',
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: ('InterBold')
                  )),
              SizedBox(
                height: 8,
              ),
              InkWell(
                enableFeedback: true,
                onTap: () {
                  Navigator.pushNamed(context, ref_certificate.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Color(0xff8a959e).withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: Offset(0,8),

                    )],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: width,
                  padding: EdgeInsets.fromLTRB(23, 0, 23, 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Birth Certificate ',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 16,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ImageIcon(
                                  AssetImage("assets/images/ref18.png"),
                                  size: 16,
                                  color: Color(0xFFD1D5DB),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Container(
                              width: width-150,
                              child: Text(
                                'Birth certificate Upload unsuccessfull',
                                style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontSize: 12,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/images/ref19.png"),
                                  size: 16,
                                  color: Color(0xFFDC2626),
                                ),
                                Text(
                                  ' Not Approved by staff',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 11,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        child: Container(
                          child: Image.asset('assets/images/ref6.png'),
                        ),
                        alignment: Alignment.topRight,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_report.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Color(0xff8a959e).withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: Offset(0,8),

                    )],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: width,
                  padding: EdgeInsets.fromLTRB(23, 0, 23, 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'School Report ',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 16,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ImageIcon(
                                  AssetImage("assets/images/ref18.png"),
                                  size: 16,
                                  color: Color(0xFFD1D5DB),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width-140,
                              child: Text(
                                'Report Upload unsuccessfull',
                                style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontSize: 12,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/images/ref19.png"),
                                  size: 16,
                                  color: Color(0xFFDC2626),
                                ),
                                Text(
                                  ' Not Approved by staff',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 11,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Image.asset('assets/images/ref7.png'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: () {
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Color(0xff8a959e).withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: Offset(0,8),

                    )],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: width,
                  padding: EdgeInsets.fromLTRB(23, 0, 23, 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Document Package #1 ',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 16,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ImageIcon(
                                  AssetImage("assets/images/ref18.png"),
                                  size: 16,
                                  color: Color(0xFFD1D5DB),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width-140,
                              child: Text(
                                'Includes: Birth Certificate, Signed Sheet of..',
                                style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontSize: 12,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: 5.5,
                                  child: Icon(
                                    Icons.send,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' Sent 10 days ago',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 11,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    Image.asset('assets/images/ref7.png',
                    fit: BoxFit.fill,),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
