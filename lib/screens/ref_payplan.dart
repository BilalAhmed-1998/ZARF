import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarf/dummydata.dart';

List<String> Sum=[
  "600,00€",
  "549,00€",
  "500,00€",
];

List<String> Due=[
  "", // dont remove its necessary because list of sum from db has total at first index
  "Pri podpise zmluvy",
  "Po prihláške",
  "Po prihlásení na pobyt",
  "Po prihlásení na pobyt",
  "Po prihlásení na pobyt",
];

List<String> IconImages=[
  "", // dont remove its necessary because list of sum from db has total at first index
  "assets/images/ref29.png",
  "assets/images/ref30.png",
  "assets/images/ref31.png",
  "assets/images/ref31.png",
  "assets/images/ref31.png",
];

class Payment_Card extends StatelessWidget {

  int index;
  String Sum;
  String Due;
  String IconImages;

  Payment_Card({this.index,this.Sum,this.Due,this.IconImages});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: 80,
      color: Color(0xffF1F5F9),
      child: Column(
        children: [
          SizedBox(
            height: 2,
            child: Container(
              color: Colors.white,
            ),
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                width: width/7,
                height: 75,
                padding: EdgeInsets.symmetric(horizontal: 20),
                //color: Colors.grey,
                child: Center(
                  child: Text(
                    (index+1).toString(),
                    style: TextStyle(
                    color: Color(0xff1F2937),
                    fontFamily: 'InterBold',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,

                  ),

                  ),
                ),
              ),

              Container(
                width: width/4,
                height: 75,
                //color: Colors.blue,
                child: Center(
                  child: Text(
                    "  "+Sum,
                    style: TextStyle(
                        color: Color(0xff252F3F),
                        fontWeight: FontWeight.w600,
                        fontFamily: ('inter'),
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Container(
                width: width/2.7,
                height: 75,
                //color: Colors.red,
                child: Center(
                  child: Text(
                    "  "+Due,
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontWeight: FontWeight.w400,
                        fontFamily: ('inter'),
                        fontSize: 12,
                    ),
                  ),
                ),
              ),
              Container(
                width: width/5,
                height: 75,
                //color: Colors.green,
                child: IconImages!="assets/images/ref30.png"?
                ImageIcon(
                  AssetImage(IconImages),
                  size: 24,
                  color: Color(0xff253F29),
                ):
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("assets/images/ref34.png"),
                      size: 24,
                      color: Color(0xff03045e),
                    ),
                    ImageIcon(
                      AssetImage("assets/images/ref30.png"),
                      size: 48,
                      color: Color(0xff03045e),
                    ),
                  ],
                ),
              ),
            ],


          ),

        ],
      ),

    );
  }
}


class ref_payplan extends StatefulWidget {
  static const routeName = '/ref_payplan';

  @override
  _ref_payplanState createState() => _ref_payplanState();
}

class _ref_payplanState extends State<ref_payplan> {
  @override
  void initState(){
    super.initState();
    print("\n\ninvoice id:$globalInvoiceID");
  }
  void launchViber() async {
    if (!await launch('https://viber.click/421951378595'))
      throw 'Could not launch "Viber"';
  }

  void launchTelegram() async {
    if (!await launch('https://t.me/ZARFstudy'))
      throw 'Could not launch "Telegram"';
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
          AppLocalizations.of(context).yourPayment,
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Interbold'
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      AppLocalizations.of(context).plan,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff6B7280),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Row(
                      children: [
                        Text(
                          'ID:',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        Text(
                          " "+globalInvoiceID,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            color: Color(0xff6B7280),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  globalnumPayments==1?"План великої економії":globalnumPayments==3?"Стандартний план":"План \"заплатіть пізніше\"",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'InterBold',
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1F2937),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context).numberOfPayments,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6B7280),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  globalnumPayments.toString(),
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'InterBold',
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1F2937),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    //padding: EdgeInsets.only(left: 20),
                    child: Container(
                      width: width/7,
                      //color: Colors.grey,
                      child: Center(
                        child: Text(
                          'Номер',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff6B7280),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width/4,
                    //color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Сума',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width/2.7,
                    //color: Colors.red,
                    child: Center(
                      child: Text(
                        'Коли сплачувати',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width/5,
                    //color: Colors.green,
                    child: Center(
                      child: Text(
                        'Статус',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: globalPlan.length-1,
                  itemBuilder: (context,index){
                    return Payment_Card(index: index,Sum: globalPlan[index+1].toString(),Due:Due[index+1],IconImages:IconImages[index+1],
                      );
                  },
                ),
              ),
              SizedBox(
                height: 29,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Є запитання?",style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13.sp,

                  ),),
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, login_page.routeName);
                      showMaterialModalBottomSheet(
                        bounce: true,
                        context: context,
                        builder: (context) => StatefulBuilder(builder:
                            (BuildContext context,
                            StateSetter setsheetState) {
                          return Container(
                              height: 177.h,
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.w, vertical: 42.h),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  //telegram
                                  InkWell(
                                    onTap: () {
                                      launchTelegram();
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            'assets/images/telegram.png',
                                            width: 52.h,
                                            height: 47.h),
                                        SizedBox(
                                          height: 16.sp,
                                        ),
                                        Text(
                                          'Telegram',
                                          style: TextStyle(
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //telephone
                                  // Column(
                                  //   children: [
                                  //     Image.asset(
                                  //         'assets/images/telephone.png'),
                                  //     SizedBox(
                                  //       height: 16.sp,
                                  //     ),
                                  //     Text(
                                  //       'Telephone',
                                  //       style: TextStyle(
                                  //         color: Color(0xff6b7280),
                                  //         fontSize: 14.sp,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  //viber
                                  InkWell(
                                    onTap: () {
                                      launchViber();
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            'assets/images/viber.png'),
                                        SizedBox(
                                          height: 16.sp,
                                        ),
                                        Text(
                                          'Viber',
                                          style: TextStyle(
                                            color: Color(0xff6b7280),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        }),
                      );
                    },
                    child: Text("Зв’яжіться з нами",style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff03045e),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold

                    ),),
                  )

                ],),




            ],
          ),
        ),
      )
    );
  }
}
