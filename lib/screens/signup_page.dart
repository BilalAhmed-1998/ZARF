import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signup_page extends StatefulWidget {




  static const routeName = '/signup_page';
  //const signup_page({Key? key}) : super(key: key);

  @override
  _signup_pageState createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {


  @override
  Widget build(BuildContext context) {



    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
       actions: [

       ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color:Color(0xff303030),),
        ),
      ),

      body: ListView(
        children:[ Container(
          color: Colors.white,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width/20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Create an Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff303030),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'InterBold'),
              ),
              SizedBox(height: 20),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                  //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Adam Alee',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'example@gmail.com',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'example@gmail.com',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Blisindel College road, 32 plot Avenue',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Current School',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Meghan Silver School',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Date of birth',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'example@gmail.com',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: '**************',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm Password',
//textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: '**************',
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          )),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 45),
              Center(
                child: Text(
                  "All information are securely stored.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 8.5*(width/10),
                  child: ElevatedButton(
                      onPressed: () {
                       // Navigator.pushNamed(context, home_page.routeName);
                      },
                      child: Text(
                        "Create Account",
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
                      )
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I already have an account,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, login_page.routeName);

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xff03045e),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),


            ]
          ),

        ),
     ] ),
    );
  }
}


