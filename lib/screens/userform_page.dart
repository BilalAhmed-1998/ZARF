import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/services/auth_service.dart';
import 'package:zarf/services/wrapper.dart';
import 'package:zarf/services/app_user.dart';
import 'package:zarf/services/localStorage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../dummydata.dart';
import 'loadingScreen.dart';

class userform_page extends StatefulWidget {
  static const routeName = '/userform_page';

  @override
  _userform_pageState createState() => _userform_pageState();
}

class _userform_pageState extends State<userform_page> {
  bool obscure1 = true;
  bool obscure2 = true;
  final auth_service auth = auth_service();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  final _user = UserSignupData();
  String birthDateInString = '25 квітня 1990 року';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff303030),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ref_faq(
                    toshow: "Account Related Questions",
                    FAQs: FAQs,
                  ),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.question_circle,
              color: Color(0xff303030),
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Builder(builder: (context) {
          return Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  AppLocalizations.of(context).createAccount,
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
                  AppLocalizations.of(context).fullName,
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
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Адам Алі',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                  // ignore: missing_return
                     onChanged:  (String newValue) {
                    setState(() {
                      _user.fullName = newValue;
                    });
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter full name';
                    }
                  },
                  onSaved: (val) {
                    setState(() => _user.fullName = val);
                  },
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'adam.white@gmail.com',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                  // ignore: missing_return
                  onChanged:  (String newValue) {
                    setState(() {
                      _user.email = newValue;
                    });
                  },
                  validator: (val) {
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(val)) {
                      return 'Please a valid Email';
                    }

                    if (val.isEmpty) {
                      return 'Please enter valid email';
                    }
                  },
                  onSaved: (val) {
                    setState(() => _user.email = val);
                  },
                ),
                SizedBox(height: 30),
                //phone
                Text(
                  AppLocalizations.of(context).phone,
//textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold'),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: '+421 065 425 357',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                  // ignore: missing_return
                  onChanged: (String newValue) {
          setState(() {
          _user.phone = newValue;
          });
          },
                  validator: (val) {

                    if (val.isEmpty) {
                      return 'Please enter phone number';
                    }
                  },
                  onSaved: (val) {
                    setState(() => _user.phone = val);
                  },
                ),
                SizedBox(height: 30),
                //gender
                Text(
                  AppLocalizations.of(context).gender,
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
                  items: <String>['Male', 'Female',]
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
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'please select gender';
                    }
                  },
                  onSaved: (val) {
                    setState(() => _user.gender = val);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                //Address
                Text(
                  AppLocalizations.of(context).address,
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
                  onChanged:  (String newValue) {
                    setState(() {
                      _user.address = newValue;
                    });
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter address';
                    }
                  },
                  onSaved: (val) {
                    setState(() => _user.address = val);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                //Current School
                Text(
                  AppLocalizations.of(context).currentSchool,
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
                  onChanged:  (String newValue) {
                    setState(() {
                      _user.currentSchool = newValue;
                    });
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter current school';
                    }
                  },
                  onSaved: (val) {
                    setState(() => _user.currentSchool = val);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                //DOB
                Text(
                  AppLocalizations.of(context).dob,
//textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold'),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    final datePick = await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1960),
                      lastDate: new DateTime.now(),
                    );
                    if (datePick != null && datePick != _user.birthDate) {
                      setState(() {
                        _user.birthDate = datePick;
                        // put it here
                        birthDateInString =
                            "${_user.birthDate.month}/${_user.birthDate.day}/${_user.birthDate.year}";
                        dateController.text = birthDateInString; // 08/14/2019
                      });
                    }
                  },
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: birthDateInString,
                      suffixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey[500],
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                  onChanged:  (String newValue) {
                    setState(() {
                      _user.password = newValue;
                    });
                  },
                  // ignore: missing_return
                  validator: (val) {
                    if (dateController.text.isEmpty) {
                      return 'Please select date';
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                //password
                Text(
                  AppLocalizations.of(context).password,
//textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold'),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscure1,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            obscure1 = !obscure1;
                          });

                        },
                        icon: !obscure1?Icon(Icons.visibility):Icon(Icons.visibility_off_outlined),
                      ),
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: '********',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                  validator: (val) {
                    if (val.isEmpty || val.length <= 8) {
                      return 'Please enter password of length greater than 8';
                    }
                    _user.password = val;
                  },
                  onSaved: (val) {
                    setState(() => _user.password = val);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                //confirm password
                Text(
                  AppLocalizations.of(context).confirmPassword,
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
                  obscureText: obscure2,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          obscure2 = !obscure2;
                        });

                      },
                      icon: !obscure2?Icon(Icons.visibility):Icon(Icons.visibility_off_outlined),
                    ),
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: '*********',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                  validator: (val) {
                    if (val != passwordController.text) {
                      return 'Please enter correct password';
                    }
                  },
                ),
                //buttons
                SizedBox(height: 45),
                Center(
                  child: Text(
                    AppLocalizations.of(context).allInfoSec,
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
                        onPressed: () async {


                          final form = _formKey.currentState;
                          if (form.validate()) {
                            _user.email = emailController.text;
                            _user.fullName = nameController.text;
                            //_user.phone=phoneController.text;
                            if(_user.gender==null){
                              _user.gender="Male";
                            }

                            form.save();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                duration: Duration(seconds: 1),
                                content: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircularProgressIndicator.adaptive(
                                      backgroundColor: Color(0xff03045e),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(AppLocalizations.of(context).creatingYourProfile,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                )));

                            await auth.signUpWithEmailPassword(context,
                                emailController.text, passwordController.text);
                            globalUser.uid =
                                FirebaseAuth.instance.currentUser.uid;
                            globalUser.userData = _user;
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context)
                                {
                                  return loadingScreen();

                                });

                            await dbMain.setSignupData(_user);
                            await dbMain.setChats();
                            await dbMain.setCheckoutData(reservedInstitute,reservedDormitory);
                            //dbLocal.storeInstitute(reservedInstitute);
                           //dbLocal.storeDormitory(reservedDormitory);

                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, checkout_page.routeName);
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context).createAccount,
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
                        )),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).alreadyHaveAccount,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16.sp,
                      ),
                    ),
                    InkWell(
                      enableFeedback: true,
                      onTap: () {
                        Navigator.pushNamed(context, Wrapper.routeName);
                      },
                      child: Text(
                        ' '+AppLocalizations.of(context).login,
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
