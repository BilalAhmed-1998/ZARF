import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/login_page.dart';
class User {
  String fullName;
  String email;
  String gender;
  String address;
  String currentSchool;
  DateTime birthDate;
}

class userform_page extends StatefulWidget {
  static const routeName = '/userform_page';

  @override
  _userform_pageState createState() => _userform_pageState();
}

class _userform_pageState extends State<userform_page> {
  final _user = User();
  String birthDateInString='mm/dd/yy';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Builder(builder: (context) {
          return Form(
            key: _formKey,
            child: ListView(
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
                SizedBox(
                  height: 30,
                ),
                //full name
                Text(
                  'Full Name',
//textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold'),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Adam Alee',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                //Email
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
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'example@gmail.com',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                ),
                SizedBox(height: 30),
                //gender
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
                DropdownButtonFormField(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 30,
                  elevation: 0,
                  onChanged: (String newValue) {
                    setState(() {
                      _user.gender = newValue;
                    });
                  },
                  value: _user.gender,
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Male',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                //Address
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
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Blisindel College road, 32 plot Avenue',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                //Current School
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
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Meghan Silver School',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                //DOB
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
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    final datePick = await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1960),
                      lastDate: new DateTime.now(),
                    );
                    if (datePick != null && datePick != _user.birthDate) {
                      setState(() {
                        _user.birthDate = datePick;
                        //isDateSelected=true;

                        // put it here
                        birthDateInString =
                            "${_user.birthDate.month}/${_user.birthDate.day}/${_user.birthDate.year}"; // 08/14/2019
                      });
                    }
                  },
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: birthDateInString,
                      suffixIcon: Icon(Icons.calendar_today_outlined,color: Colors.grey[500],),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                ),
                SizedBox(height: 30,),
                //password
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
                TextFormField(
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
                SizedBox(height: 30,),
                //confirm password
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
                //buttons
                SizedBox(height: 45),
                Center(
                  child: Text(
                    "All information are securely stored.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: SizedBox(
                    height: 46.h,
                    width: 335.w,
                    child: ElevatedButton(

                        onPressed: () {
                           Navigator.pushNamed(context, checkout_page.routeName);
                        },
                        child: Text(
                          "Create Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
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
                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I already have an account,',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16.sp,
                      ),
                    ),
                    InkWell(
                      enableFeedback: true,
                      onTap: (){
                        Navigator.pushNamed(context, login_page.routeName);
                      },
                      child: Text(
                        ' Login',
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



              ],
            ),
          );
        }),
      ),
    );
  }
}
