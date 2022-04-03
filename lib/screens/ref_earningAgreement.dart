import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dummydata.dart';
import 'contract_page.dart';

class ref_earningAgreement extends StatefulWidget {
  static const routeName = '/ref_earningAgreement';
  @override
  _ref_earningAgreementState createState() => _ref_earningAgreementState();
}

class _ref_earningAgreementState extends State<ref_earningAgreement> {
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
          AppLocalizations.of(context).refAgreement,
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Interbold'
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 26,
            ),
            Text(
              AppLocalizations.of(context).viewRefAgreement,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff1F2937),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              enableFeedback: true,
              child: Container(
                height: 92,
                width: 115,
                padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                decoration: BoxDecoration(
                  color: Color(0xff03045E),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/ref33.png"),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      AppLocalizations.of(context).view,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,

                      ),
                    )
                  ],
                ),
              ),
              onTap: ()async {
                final invoiceID = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => contract_page(
                        name: globalUser
                            .userData.fullName,
                        dob: globalUser
                            .userData.birthDate,
                        taxNum:
                        globalUser.signee.taxNumber,
                        address:
                        globalUser.userData.address,
                        city: globalUser.signee.city,
                        country: globalUser.signee.country,
                        phone:
                        globalUser.userData.phone,
                        email:
                        globalUser.userData.email,
                        accName:
                        globalUser.signee.surname,
                        accDob:
                        globalUser.signee.birthDate,
                        accAddress:
                        globalUser.signee.address,
                        primary:
                        globalPrimarySchool,
                        alternative:
                        globalAlternativeSchool,
                        summaryTotal: globalsummary,
                        noOfPayments: globalnumPayments,
                        lastName:
                        globalUser.signee.surname,
                        payments: globalPlan,
                        discount: globalDiscount,

                      )),
                );

              },
            )
          ],
        ),
      ),
    );
  }
}
