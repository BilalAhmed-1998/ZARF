import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarf/screens/ref_earningAgreement.dart';
import 'package:zarf/screens/ref_earningBank.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ref_earningSettings extends StatefulWidget {
  static const routeName = '/ref_earningSettings';
  @override
  _ref_earningSettingsState createState() => _ref_earningSettingsState();
}

class _ref_earningSettingsState extends State<ref_earningSettings> {

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
          AppLocalizations.of(context).referralSettings,
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Interbold'
          ),
        ),
      ),
      body: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 14, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/ref25.png"),
                          color: Color(0xff03045E),
                          size: 21,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          AppLocalizations.of(context).bankDetails,
                          style: TextStyle(
                            color: Color(0xff03045E),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'InterBold',
                          ),
                        ),
                      ],
                    ),


                    ImageIcon(
                      AssetImage("assets/images/ref28.png"),
                      color: Color(0xff03045E),
                      size: 24,
                    ),
                  ],
                ),
              ),
              enableFeedback: true,
              onTap: () {
                Navigator.pushNamed(context, ref_earningBank.routeName);

              },
            ),
            Divider(
              color: Color(0xffF4F4F5),
              height: 1,
              thickness: 2,
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 14, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/ref26.png"),
                          color: Color(0xff03045E),
                          size: 21,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          AppLocalizations.of(context).refAgreement,
                          style: TextStyle(
                            color: Color(0xff03045E),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'InterBold',
                          ),
                        ),
                      ],
                    ),


                    ImageIcon(
                      AssetImage("assets/images/ref28.png"),
                      color: Color(0xff03045E),
                      size: 24,
                    ),
                  ],
                ),
              ),
              enableFeedback: true,
              onTap: () {
                Navigator.pushNamed(context, ref_earningAgreement.routeName);
              },
            ),
            Divider(
              color: Color(0xffF4F4F5),
              height: 1,
              thickness: 2,
            ),


          ],
        ),
      ),
    );
  }
}
