import 'package:flutter/material.dart';
import 'package:zarf/Services/wrapper.dart';
import 'package:zarf/screens/checker.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/contract_page.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/dormitorydetail_page.dart';
import 'package:zarf/screens/failedScreenshot.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/loadingScreen.dart';
import 'package:zarf/screens/login_page.dart';

import 'package:zarf/screens/ref_departure.dart';
import 'package:zarf/screens/ref_documents.dart';
import 'package:zarf/screens/ref_documents2.dart';
import 'package:zarf/screens/ref_earning.dart';
import 'package:zarf/screens/ref_earningAgreement.dart';
import 'package:zarf/screens/ref_earningBank.dart';
import 'package:zarf/screens/ref_earningSettings.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/ref_messages.dart';
import 'package:zarf/screens/ref_notifications.dart';
import 'package:zarf/screens/ref_package.dart';
import 'package:zarf/screens/ref_package2.dart';
import 'package:zarf/screens/ref_passport.dart';
import 'package:zarf/screens/ref_payplan.dart';
import 'package:zarf/screens/ref_profile.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';
import 'package:zarf/screens/successfulScreenshot.dart';
import 'package:zarf/screens/thankyou_page.dart';
import 'package:zarf/screens/toDormitory_page.dart';
import 'package:zarf/screens/userform_page.dart';
import 'package:zarf/screens/welcome_page.dart';
import 'package:zarf/screens/splash_screen.dart';
import 'package:zarf/screens/uploadScreenshot.dart';




final Map <String,WidgetBuilder> routes =  {


  //splash_screen.routeName: (context) => splash_screen(3,welcome_page.routeName),
  refhome_page.routeName: (context) => refhome_page(),
  ref_earning.routeName: (context) => ref_earning(),
  ref_departure.routeName: (context) => ref_departure(),
  ref_messages.routeName: (context) => ref_messages(),
  ref_documents.routeName: (context) => ref_documents(),
  ref_documents2.routeName: (context) => ref_documents2(),
  ref_passport.routeName: (context) => ref_passport(),
  ref_faq.routeName: (context) => ref_faq(),
  ref_package.routeName: (context) => ref_package(),
  ref_package2.routeName: (context) => ref_package2(),
  ref_notifications.routeName: (context) => ref_notifications(),
  ref_profile.routeName: (context) => ref_profile(),
  ref_payplan.routeName: (context) => ref_payplan(),
  ref_earningSettings.routeName: (context) => ref_earningSettings(),
  ref_earningBank.routeName: (context) => ref_earningBank(),
  ref_earningAgreement.routeName: (context) => ref_earningAgreement(),
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
  uploadScreenshot.routeName: (context) => uploadScreenshot(),
  checker.routeName: (context) => checker(),
  successfulScreenshot.routeName: (context) => successfulScreenshot(),
  failedScreenShot.routeName: (context) => failedScreenShot(),
  loadingScreen.routeName: (context) => loadingScreen(),



  //Services///
  Wrapper.routeName: (context) => Wrapper(),


};