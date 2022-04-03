import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarf/screens/ref_earningSettings.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dummydata.dart';

class Leaderboard_Card extends StatelessWidget {
  String name;
  int friends,index;

  Leaderboard_Card({this.index, this.name, this.friends});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  (index + 1).toString() + ". ",
                  style: TextStyle(
                    color: Color(0xff1f2937),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[400],
                  ),
                  radius: 12,
                  backgroundColor: Color(0xffF1F5F9),
                ),
                Text(
                  "  " + name,
                  style: TextStyle(
                      color: Color(0xff1F2937),
                      fontWeight: FontWeight.w600,
                      fontFamily: ('inter'),
                      fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            child: Row(children: [
              ImageIcon(
                AssetImage("assets/images/ref14.png"),
                size: 25,
                color: Color(0xff03045E),
              ),
              Text(
                ' $friends ${AppLocalizations.of(context).friends}',
                style: TextStyle(
                    color: Color(0xff6b7280),
                    fontSize: 14,
                    fontFamily: ('inter'),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ref_earning extends StatefulWidget {
  static const routeName = '/ref_earning';

  @override
  State<ref_earning> createState() => _ref_earningState();
}

class _ref_earningState extends State<ref_earning> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ref_earningSettings.routeName);
            },
            icon: Icon(
              Icons.settings_outlined,
              color: Color(0xFF00FFFF),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.fromLTRB(0, 35, 0, 100),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    child: Image.asset("assets/images/ref1.png"),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  ),
                ),

                Container(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff03045e),
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).youRefEarn,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: ('inter'),
                                color: Color(0xff6B7280),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '€${globalUser.ref.refEarnings}',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: ('interbold'),
                                fontWeight: FontWeight.w800,
                                color: Color(0xff1F2937),
                              ),
                            ),
                          ],
                        ),
                        Image.asset("assets/images/ref2.png")
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).inviteFriendsand,
                        style: TextStyle(
                          color: Color(0xff1F2937),
                          fontSize: 18,
                          fontFamily: ('interbold'),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context).weWillPayYouForEvery,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff6B7280),
                            fontSize: 16,
                            fontFamily: ('inter'),
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width - 130,
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: FirebaseAuth.instance.currentUser.uid,
                                hintStyle: TextStyle(
                                  color: Color(0xff1F2937),
                                  fontSize: 14,
                                  fontFamily: ('inter'),
                                  fontWeight: FontWeight.w600,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                )),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              // Respond to button press
                              Clipboard.setData(ClipboardData(
                                  text: FirebaseAuth.instance.currentUser.uid)).then((value){
                                 ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Code Copied",
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: const Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                  width: 200,
                                ));
                              });
                              // Fluttertoast.showToast(
                              //     msg: 'This is toast notification',
                              //     toastLength: Toast.LENGTH_SHORT,
                              //     gravity: ToastGravity.BOTTOM,
                              //     //timeInSecForIosWeb: Duration(seconds: 2),
                              //     backgroundColor: Colors.red,
                              //     textColor: Colors.yellow
                              // );
                            },
                            backgroundColor: Color(0xff03045e),
                            icon: ImageIcon(
                              AssetImage("assets/images/ref12.png"),
                              size: 24,
                              color: Color(0xFFFFFFFF),
                            ),
                            label: Text(
                              '',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: ('inter'),
                                fontWeight: FontWeight.w600,
                                color: Color(0xffE5E7EB),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Text(
                  AppLocalizations.of(context).leaderboards,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: ('interbold'),
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1F2937),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: leaders.length,
                    itemBuilder: (context, index) {
                      return Leaderboard_Card(
                         name: leaders[index]['fullName'],
                        index: index,
                        friends: leaders[index]['numFriends'],

                      );
                    },
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
