import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarf/Services/wrapper.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/invoice.dart';
import 'package:zarf/routes.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/dormitorySearch_page.dart';
import 'package:zarf/screens/home_page.dart';
import 'package:zarf/screens/login_page.dart';
import 'package:zarf/screens/ref_earning.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/schoolSearch_page.dart';
import 'package:zarf/screens/schooldetail_page.dart';
import 'package:zarf/screens/schoollevel_page.dart';
import 'package:zarf/screens/welcome_page.dart';
import 'package:zarf/screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/services/app_user.dart';
import 'package:zarf/services/auth_service.dart';
import 'package:zarf/services/my_shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zarf/services/api_service.dart';

bool isFirstRun;
bool isFirstHome;

Future<void> backgroundHandler(RemoteMessage message) async {
  print('message from background');
  print(message.notification.title);
  print(message.notification.body);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  isFirstRun = await MySharedPreferences.instance.getBooleanValue("isfirstRun");
  isFirstHome = await MySharedPreferences.instance.getBooleanValue("isFirstHome");
  await dbMain.getSeats();
  await dbMain.getFAQs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 889),
        builder: () => StreamProvider<app_user>.value(
              value: auth_service().fuser,
              initialData: null,
              child: MaterialApp(
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  //for languages with right to left directions
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('uk'),
                  //const Locale('en'),


                ],
                theme: ThemeData(
                    primaryColor: Color(0xff03045e),
                    backgroundColor: Color(0xff03045e),
                    fontFamily: 'Inter'),
                routes: routes,
                debugShowCheckedModeBanner: false,
                home: splash_screen(
                    1, isFirstRun ? Wrapper.routeName : welcome_page.routeName),
              ),
            ));
  }
}
