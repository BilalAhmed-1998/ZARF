// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/contract_page.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/ref_passport.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';
import 'package:zarf/screens/splash_screen.dart';
import 'package:zarf/screens/thankyou_page.dart';
import 'package:zarf/screens/userform_page.dart';
import 'package:zarf/screens/welcome_page.dart';
import 'package:zarf/services/app_user.dart';

import '../dummydata.dart';
import '../main.dart';
import '../screens/checker.dart';
import 'my_shared_preferences.dart';

class Wrapper extends StatelessWidget {
  static const routeName = '/Wrapper';
  @override
  Widget build(BuildContext context) {


     dynamic User = Provider.of<app_user>(context);

        if(User!=null){
          globalTestingVariable++;
          return checker();
        }
        else{
          return login_page();
        }

  }

}

