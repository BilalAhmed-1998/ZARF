import 'package:flutter/material.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/contract_page.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/dormitorydetail_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/ref_certificate.dart';
import 'package:zarf/screens/ref_departure.dart';
import 'package:zarf/screens/ref_documents.dart';
import 'package:zarf/screens/ref_earning.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/ref_messages.dart';
import 'package:zarf/screens/ref_package.dart';
import 'package:zarf/screens/ref_passport.dart';
import 'package:zarf/screens/ref_report.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';
import 'package:zarf/screens/thankyou_page.dart';
import 'package:zarf/screens/toDormitory_page.dart';
import 'package:zarf/screens/userform_page.dart';
import 'package:zarf/screens/welcome_page.dart';
import 'package:zarf/screens/splash_screen.dart';



final Map <String,WidgetBuilder> routes =  {

  //splash_screen.routeName: (context) => splash_screen(3,welcome_page.routeName),
  refhome_page.routeName: (context) => refhome_page(),
  ref_earning.routeName: (context) => ref_earning(),
  ref_departure.routeName: (context) => ref_departure(),
  ref_messages.routeName: (context) => ref_messages(),
  ref_documents.routeName: (context) => ref_documents(),
  ref_passport.routeName: (context) => ref_passport(),
  ref_faq.routeName: (context) => ref_faq(),
  ref_package.routeName: (context) => ref_package(),
  ref_certificate.routeName: (context) => ref_certificate(),
  ref_report.routeName: (context) => ref_report(),
  toDormitory_page.routeName: (context) => toDormitory_page(),
  dormitorySearch_page.routeName: (context) => dormitorySearch_page(),
  dormitorydetail_page.routeName: (context) => dormitorydetail_page(),
  userform_page.routeName: (context) => userform_page(),
  checkout_page.routeName:  (context) => checkout_page(),
  contract_page.routeName:  (context) => contract_page(),
  thankyou_page.routeName: (context) => thankyou_page(),
  login_page.routeName: (context) => login_page(),
  welcome_page.routeName: (context) => welcome_page(),
  home_page.routeName: (context) => home_page(),
  schoollevel_page.routeName: (context) => schoollevel_page(),

  schoolSearch_page.routeName: (context) => schoolSearch_page(toshowtitle: "Schools",),

};