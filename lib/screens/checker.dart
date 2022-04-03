import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/failedScreenshot.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:zarf/screens/successfulScreenshot.dart';
import 'package:zarf/screens/thankyou_page.dart';
import 'package:zarf/screens/uploadScreenshot.dart';

import '../dummydata.dart';
import '../main.dart';

class checker extends StatefulWidget {
  //const checker({Key? key}) : super(key: key);
  static const routeName = '/checker';

  @override
  _checkerState createState() => _checkerState();
}

class _checkerState extends State<checker> {
  bool downloading = true;
  Future getEverything() async {
    print(globalTestingVariable);
    //globalTestingVariable++;
    paymentStatus = await dbMain.checkPaymentStatus();
    print("getting user data...");
    await dbMain.getUserData();
    print("payment status:${paymentStatus}");
    if (paymentStatus) {

      await dbMain.getDocuments();
      await dbMain.getDate().then((val) {
        Date = val;
      });
      print("documents and date done.");
     await dbMain.getChats();
    }
    else if (reservedInstitute[0]==null && !paymentStatus) {

      //await dbMain.getInstitutes();
      print("getting Dormitories...");
      // if(globalisUniversity){
      //   //college dormitories
      //   await dbMain.getCollegeDormitories();
      // }
      // else{
      //   //school dormitories
      //   await dbMain.getSchoolDormitories();
      // }
      print("getting checkout data...");
      await dbMain.getCheckoutData(reservedInstitute, reservedDormitory);
      if (globalInvoiceID!=null)
        {
          await dbMain.getInvoiceData();
          print("invoicccce");

        }
    }
    print("done");
    print(globalInvoiceError);
  }

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
        future: getEverything(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            {
              if (!paymentStatus && globalInvoiceImage == "") {
                print("going to checkout");
                return checkout_page();
              }
              else if (!paymentStatus &&
                  globalInvoiceImage == "" &&
                  !globalInvoiceVerify &&
                  globalInvoiceError == "") {
                //print(globalInvoiceImage);
                return uploadScreenshot();
              } else if (!paymentStatus &&
                  globalInvoiceImage != "" &&
                  !globalInvoiceVerify &&
                  globalInvoiceError == "") {
                return successfulScreenshot();
              } else if (!paymentStatus &&
                  !globalInvoiceVerify &&
                  globalInvoiceError != "") {
                return failedScreenShot();
              } else if (!isFirstHome)
                return thankyou_page();
              else {
                return refhome_page();
              }
            }
            // while data is loading:

          }
          else  return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xff03045e),
              ),
            ),
          );

        });
  }
}
