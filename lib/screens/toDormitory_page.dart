import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:zarf/screens/userform_page.dart';
import 'dormitorySearch_page.dart';

class toDormitory_page extends StatefulWidget {
  static const routeName = '/toDormitory';

  @override
  _toDormitory_pageState createState() => _toDormitory_pageState();
}

class _toDormitory_pageState extends State<toDormitory_page> {
  bool radio = true;
  bool radio1 = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              Text(
                  'Would you like to stay in a Dormitory while you study through in school?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter')),
              SizedBox(
                height: 20,
              ),
              Container(
                height: height / 6.5,
                width: width - 40,

                margin: const EdgeInsets.only(
                    bottom: 6.0), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                              title: Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              value: true,
                              toggleable: true,
                              activeColor: Color(0xff03045e),
                              groupValue: radio,
                              onChanged: (value) {
                                setState(() {
                                  radio1 = false;
                                  radio = true;
                                });
                              }),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Text(
                        'I want to stay in a dormitory',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                            fontFamily: 'Inter'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: height / 6.5,
                width: width - 40,

                margin: const EdgeInsets.only(
                    bottom: 6.0), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                              title: Text(
                                'No',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              value: true,
                              toggleable: true,
                              activeColor: Color(0xff03045e),
                              groupValue: radio1,
                              onChanged: (value) {
                                setState(() {
                                  radio = false;
                                  radio1 = true;
                                });
                              }),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Text(
                        "I don't want to stay in a dormitory",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                            fontFamily: 'Inter'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 8.5 * (width / 10),
                  child: ElevatedButton(
                      onPressed: () {
                        (radio)
                            ?
                        Navigator.pushNamed(
                            context, dormitorySearch_page.routeName)
                            :
                        Navigator.pushNamed(
                            context, userform_page.routeName);
                      },
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff03045e),
                        //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
