import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ref_earningBank extends StatefulWidget {
  static const routeName = '/ref_earningBank';
  @override
  _ref_earningBankState createState() => _ref_earningBankState();
}

class _ref_earningBankState extends State<ref_earningBank> {
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
          AppLocalizations.of(context).bankDetails,
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
                AppLocalizations.of(context).accountHolder,
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: AppLocalizations.of(context).enterFullName,
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
            Container(
              child: Text(
                'IBAN',
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: AppLocalizations.of(context).enterIban,
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
            Container(
              child: Text(
                'BIC SWIFT',
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: AppLocalizations.of(context).enterBicSwift,
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
