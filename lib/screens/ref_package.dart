import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zarf/dummydata.dart';

class ref_package extends StatefulWidget {
  static const routeName = '/ref_package';

  @override
  State<ref_package> createState() => _ref_packageState();
}

class _ref_packageState extends State<ref_package> {
  String compText = "Завершити";

  TextEditingController trackingController = TextEditingController();

  Row docsToSend(String s){
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.grey[200],
          child: Icon(
            Icons.check,
            size: 15,
            color: Color(0xff03045E),
          ),
        ),
        SizedBox(width:5.w),
        Text(
          s,
          style: TextStyle(
              color: Color(0xff6B7280),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500),
        ),
      ],
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
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Перший пакет документів', //'Document Package #1',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'InterBold'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  child: Image.asset(
                    'assets/images/ref20.png',
                  ),
                  radius: 51,
                  backgroundColor: Color(0xffF9FAFB),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Табелі потрібні для подачі заяви в навчальний заклад',
                style: TextStyle(
                    height: 1.7,
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/images/ref21.png',
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Необхідні документи', //documents to pack
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).reportcardfor8th),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).reportcardforhalfof9thgrade),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).birthCertificate),
              SizedBox(
                height: 20,
              ),
             docsToSend(AppLocalizations.of(context).certificateOfResidence),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).ukrainianPassport),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).certificateOfNoCriminalRecord),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).photoscm),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).diploma),
              SizedBox(
                height: 20,
              ),
              docsToSend(AppLocalizations.of(context).reportCardForCompletedGrade9),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/ref22.PNG',
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Як упакувати', //how to pack
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: width - 70,
                    child: Text(
                      'Переконайтеся, що поклали всі необхідні документи.', //Make sure all the documents are correct
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    width: width - 70,
                    child: Text(
                      'Покладіть їх у файл для документів, щоб вони були захищені під час транспортування.', //'Put them into plastic cover, so they are protected during the transportation',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3. ',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: width - 70,
                    child: Text(
                      "Закрийте пакет за допомогою клею. У такий спосіб ви знизите ризик відкриття пакета під час транспортування. ", //'Close the package and use the glue it. This way we eliminate the risk of package opening during the transportation',
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/ref23.png',
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Як відправити пакет документів?\n', //'How to Send The Document?',
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Відправте документи Новою поштою на адресу\nМісто: Мукачево\nВідділення №8\nОтримувач: Гардубей Ярослав\nНомер телефону: +380505510427',
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 106,
              ),
              Text(
                'Ви відправили посилку?', //'Did you send the package?',
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Будь ласка, напишіть тут номер для відстежування посилки:', //'Please, paste the tracking number of the package:',
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width / 1.28,
                child: TextField(
                  controller: trackingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'ZFSDRF568423',
                      hintStyle: TextStyle(
                        color: Color(0xff1F2937),
                        fontSize: 14,
                        fontFamily: ('inter'),
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      )),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  height: 46,
                  width: width - 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff03045E)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    enableFeedback: true,
                    onTap: () async {
                      await dbMain.setTrackingNumber(trackingController.text);
                      setState(() {
                        compText = "Готово"; //"Done";
                      });
                    },
                    child: Center(
                      child: Text(
                        compText, //'Complete',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'InterBold',
                          fontWeight: FontWeight.w800,
                          color: Color(0xff03045E),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
