import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarf/school.dart';


//Insitutes Tiles Home Page//////////

class InstituteCard2 extends StatelessWidget {

  double height;
  Institute institute;
  double width;


  InstituteCard2({this.institute,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      height: height/1.2,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                this.institute.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width-10,
              height: height / 2.0 ,
             padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                color: Colors.black.withOpacity(0.28),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //this.institute.category,
                      'Business School',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff00ffff),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      //this.institute.title,
                      "Sampson's Harley School",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          size: 22,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          //this.institute.location,
                          "Poprad",
                          style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.tags,
                          size: 22,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        (true)//this.institute.public
                            ? Text(
                                "Public",
                                style: TextStyle(
                                  fontSize: 16,
                                 // fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              )
                            : Text(
                                "Public",
                                style: TextStyle(
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}


