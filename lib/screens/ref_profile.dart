import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/services/auth_service.dart';
import 'package:zarf/services/wrapper.dart';
class ref_profile extends StatefulWidget {
  static const routeName = '/ref_profile';
  @override
  _ref_profileState createState() => _ref_profileState();
}

class _ref_profileState extends State<ref_profile> {
  final auth_service auth = auth_service();
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
          AppLocalizations.of(context).profileDetails,
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Interbold'
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              child: Text(
                AppLocalizations.of(context).name,
                style: TextStyle(
                  color: Color(0xff1F2937),
                  fontSize: 14,
                  fontFamily: 'InterBold',
                  fontWeight: FontWeight.w800,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              readOnly: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: globalUser.userData.fullName,
                  hintStyle: TextStyle(
                    color: Color(0xff374151),
                    fontSize: 14,
                    fontFamily: ('inter'),
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                  )),
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    AppLocalizations.of(context).password,
                    style: TextStyle(
                      color: Color(0xff1F2937),
                      fontSize: 14,
                      fontFamily: 'InterBold',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                          email:globalUser.userData.email);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text("A link has been sent to your email successfully!")));
                      await auth.signOut(context);

                      // Navigator.pop(context);
                      if(FirebaseAuth.instance.currentUser==null){
                        resetAll();
                        Navigator.pushNamedAndRemoveUntil(
                            context, Wrapper.routeName, (
                            route) => false);

                      }


                    } on Exception catch (e) {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text(e.toString())));
                    }
                  },
                  child: Container(
                    child: Text(
                      AppLocalizations.of(context).changePassword,
                      style: TextStyle(
                        color: Color(0xff03045E),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ],

            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              readOnly: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: globalUser.userData.password,
                  hintStyle: TextStyle(
                    color: Color(0xff374151),
                    fontSize: 14,
                    fontFamily: ('inter'),
                    fontWeight: FontWeight.w400,
                  ),
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
    );
  }
}
