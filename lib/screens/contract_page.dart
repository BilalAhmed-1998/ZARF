import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/checkout_page.dart';
class contract_page extends StatefulWidget {
  static const routeName = '/contract_page';
  @override
  _contract_pageState createState() => _contract_pageState();
}

class _contract_pageState extends State<contract_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Contract',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter'
          ),
        ),
        centerTitle: true,
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
        actions: [Container(
          padding: EdgeInsets.all(20),
            child: Icon(CupertinoIcons.question_circle, color: Color(0xff03045e),)),],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/contract.png'),
            SizedBox(height: 20,),
            Center(
              child: SizedBox(
                height: 50,
                width: 9*(width/10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, checkout_page.routeName);
                    },
                    child: Text(
                      "I have read the contract and agree with the Terms",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff03045e),
                      //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
