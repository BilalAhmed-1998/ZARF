import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notification_permissions/notification_permissions.dart';


class ref_notifications extends StatefulWidget {
  static const routeName = '/ref_notifications';

  @override
  _ref_notificationsState createState() => _ref_notificationsState();
}

class _ref_notificationsState extends State<ref_notifications> {

    Future<void> requestPermission() async {
      NotificationPermissions.requestNotificationPermissions(
        openSettings: true,
      );

     }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,),
        ),
        title: Text(
          AppLocalizations.of(context).allowNotif,
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Interbold'
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(27),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).inOrdertoMakethe,
              style: TextStyle(
                height: 1.7,
                color: Color(0xff6B7280),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),

            ),
            SizedBox(
              height: 80.h,
            ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: AppLocalizations.of(context).pleaseClick, style: TextStyle(height: 1.7,color: Color(0xff6B7280),fontSize:14,fontFamily:'Inter',fontWeight: FontWeight.w500)),
                TextSpan(text: AppLocalizations.of(context).allowNotif+' ', style: TextStyle(height: 1.7,color: Color(0xff6B7280),fontSize:14,fontFamily:'Interbold',fontWeight: FontWeight.w900)),
                TextSpan(text: AppLocalizations.of(context).pleaseClick2, style: TextStyle(height: 1.7,color: Color(0xff6B7280),fontSize:14,fontFamily:'Inter',fontWeight: FontWeight.w500)),

              ],
            ),
          ),
            SizedBox(
              height: 17.h,
            ),
            InkWell(
              enableFeedback: true,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context).allowNotif,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff03045E),
                    fontSize: 16,
                    fontFamily: 'interBold',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              onTap: () {
                 requestPermission();

              },
            )
          ],
        ),
      ),

    );
  }
}
