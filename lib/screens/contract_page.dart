import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zarf/screens/checkout_page.dart';
import 'package:zarf/screens/ref_faq.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zarf/services/api_service.dart';
import 'dart:math';
import '../dummydata.dart';
import 'loadingScreen.dart';

class contract_page extends StatefulWidget {
  static const routeName = '/contract_page';
  String name = "Shaheer";
  DateTime dob;
  String taxNum = "123456";
  String address = "g13/1, isb";
  String phone = "090078601";
  String email = "shaheer@gmail.com";
  String accName = "ali";
  DateTime accDob;
  String accAddress = "g11/4, isb";
  String primary = "fms";
  String alternative = "fgs";
  double summaryTotal = 0;
  int noOfPayments = 3;
  String lastName = "ali";
  List<dynamic> payments = [];
  String city="enter";
  String country="country";
  double discount=0;
  contract_page(
      {this.name,
      this.dob,
      this.taxNum,
      this.address,
      this.phone,
      this.email,
      this.accName,
      this.accDob,
      this.accAddress,
      this.primary,
      this.alternative,
      this.summaryTotal,
      this.noOfPayments,
      this.lastName,
      this.payments,
      this.city,
      this.country,
      this.discount});
  @override
  _contract_pageState createState() => _contract_pageState();
}

class _contract_pageState extends State<contract_page> {
  String currentDate = "1/1/2022";
  List<String> payMessages=[
    'Після підписання Договору',
    'Після прийняття в навчальний заклад',
    'Після нострифікації документів',
    'Після поселення в гуртожиток',
    'Після отримання ВНЖ'
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).contract,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter'),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ref_faq(
                      toshow: "Contract Related Questions",
                      FAQs: FAQs,
                    ),
                  ),
                );
              },
              icon: Icon(
                CupertinoIcons.question_circle,
                color: Color(0xff303030),
                size: 22.sp,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image.asset('assets/images/contract.png'),
                Image.asset("assets/images/zarf_logo.png",
                    color: Colors.black,
                    height: 20,
                    alignment: Alignment.topLeft),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 260,
                    child: ListView(
                      children: [
                        //Text(agreement),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 35.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Договір про надання послуг",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "укладений згідно закону № 64 зводу законів за 1964 рік - Цивільний кодекс, в чинній редакції (далі по тексту - «Договір»)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 25.sp),
                              Text(
                                "Розділ I.\nДоговірні сторони",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 25.sp),
                              Text(
                                "1. Виконавець",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "Назва: ТОВ «ZARF s.r.o.»\n"
                                "Код: 54 161 070\n"
                                "Юридична адреса: вул. Яношікова 40A, м. Прешов, Словацька республіка,\n"
                                "поштовий індекс: 080 01\n"
                                "Компанія зареєстрована в торгово-комерційному реєстрі районного суду в місті Прешов, розділ Sro, запис номер 43109/P\n"
                                "Компанія представлена: Адам Пастірчак\n"
                                "www.zarfstudy.com\n"
                                "zarfstudy@gmail.com",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                "та",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                "2. Клієнт",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Ім’я: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Дата народження: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: DateFormat.yMMMMd('uk_UA')
                                            .format(this.widget.dob),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Податковий ідентифікаційний номер: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.taxNum,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Місце постійного проживання: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.address,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Телефон: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.phone,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "E-mail: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.email,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              SizedBox(height: 10.h),
                              RichText(
                                text: TextSpan(
                                    text: "який представляє: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: "Студента, користувача послуг:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              SizedBox(height: 10.h),
                              RichText(
                                text: TextSpan(
                                    text: "Ім’я та прізвище студента: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.accName,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Дата народження студента: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: DateFormat.yMMMMd('uk_UA')
                                            .format(this.widget.accDob),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                        "Місце постійного проживання студента: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.accAddress,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              SizedBox(height: 20.h),
                              RichText(
                                text: TextSpan(
                                    text: "(Виконавець ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: "ta ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "Клієнт ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "/ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "Студент ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "- разом ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "Договірні сторони, ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "кожен окремо - ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "Договірна сторона)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Розділ II.\nПредмет Договору",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                        "1.	Предметом даного Договору є зобов’язання Виконавця забезпечити «комплексні послуги в області організації навчання українського Студента в освітньому закладі, вибраному ним на території Словацької республіки» (далі по тексту - ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: "Послуги",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text: "), ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text:
                                            "та зобов’язання Клієнта оплатити усю вартість послуг, наданих йому згідно попередньо погоджених договірних умов.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "2.	  В даному Договорі, під освітнім закладом на території Словацької республіки розуміється:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.sp),
                                child: Text(
                                  "a)	  середня школа, яка забезпечує здобуття середньої освіти та складання випускних іспитів,",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Inter'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.sp),
                                child: Text(
                                  "b)	  університет або вищий навчальний заклад, який забезпечує здобуття вищої освіти I. та II. освітнього рівня, складання державного випускного іспиту та  здобуття ступеня бакалавр - BAKALÁR (Bc.), магістр - MAGISTER (Mgr.) або інженер - INŽINIER (Ing.) у відповідності з чинним законодавством.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Inter'),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "3.   ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: "Послуги, ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text:
                                            "які Виконавець забезпечує за умовами даного Договору, складаються з наступних дій, що надаються Клієнтові / Студентові:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 7.sp),
                                child: Table(
                                  columnWidths: {
                                    0: FractionColumnWidth(0.1),
                                    1: FractionColumnWidth(0.9),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Надання доступу до закритої частини застосунку «ZARF study»",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Загальні та детальні поради по окремих питаннях щодо в'їзду та перебування на території Словацької республіки",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Надання консультації з питань вищої освіти на території Словацької республіки та з питань вибору освітнього закладу",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Заповнення заявки для навчання у словацькому освітньому закладі",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Оформлення поселення в гуртожитку у випадку потреби",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Оформлення карти ISIC (International Student Identity Card)",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Допомога із відкриттям банківського рахунку",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Реєстрація для тимчасового перебування у Словацькій республіці",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Забезпечення транспортом в день вступних іспитів для доїзду до навчального закладу, а також при оформленні дозвільних документів у відділенні поліції по роботі з іноземними громадянами та при проходженні обов’язкового медичного огляду",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Нострифікація – юридичне визнання іноземного атестату / диплому",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Подання заявки на отримання довідки про несудимість на території Словацької республіки (виписки з реєстру судимостей)",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Офіційний переклад усіх потрібних документів",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Надання супроводу при проходженні обов’язкового медичного огляду",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Супровід від українсько-словацького кордону і до місця тимчасового проживання",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(left:10.sp),
                              //   child: Text(
                              //       // "-	  Надання доступу до закритої частини застосунку «ZARF study»\n"
                              //       // "-	  Загальні та детальні поради по окремих питаннях щодо в'їзду та перебування на території Словацької республіки\n"
                              //       // "-	  Надання консультації з питань вищої освіти на території Словацької республіки та з питань вибору освітнього закладу\n"
                              //       // "-	  Заповнення заявки для навчання у словацькому освітньому закладі\n"
                              //       // "-	  Оформлення поселення в гуртожитку у випадку потреби\n"
                              //       // "-	  Оформлення карти ISIC (International Student Identity Card)\n"
                              //       // "-	  Допомога із відкриттям банківського рахунку\n"
                              //       // "-	  Реєстрація для тимчасового перебування у Словацькій республіці\n"
                              //       // "-	  Забезпечення транспортом в день вступних іспитів для доїзду до навчального закладу, а також при оформленні дозвільних документів у відділенні поліції по роботі з іноземними громадянами та при проходженні обов’язкового медичного огляду\n"
                              //       // "-	  Нострифікація – юридичне визнання іноземного атестату / диплому\n"
                              //       // "-	  Подання заявки на отримання довідки про несудимість на території Словацької республіки (виписки з реєстру судимостей)\n"
                              //       // "-	  Офіційний переклад усіх потрібних документів\n"
                              //       // "-	  Надання супроводу при проходженні обов’язкового медичного огляду\n"
                              //       // "-	  Супровід від українсько-словацького кордону і до місця тимчасового проживання\n",
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 12.sp,
                              //         fontWeight: FontWeight.normal,
                              //         fontFamily: 'Inter'),),
                              // ),
                              Text(
                                "4.	  Заклад освіти вибраний Клієнтом для цілей даного Договору:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 10.sp),
                              RichText(
                                text: TextSpan(
                                    text: "Пріоритетний вибір: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.primary,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              SizedBox(height: 10.sp),
                              RichText(
                                text: TextSpan(
                                    text: "Альтернативний вибір: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: this.widget.alternative,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      )
                                    ]),
                              ),
                              SizedBox(height: 10.sp),
                              Text(
                                "5. 	  Метою Договору є забезпечення усього процесу прийняття документів Студента та зарахування його на навчання у вибраному ним освітньому закладі (а при потребі і його забезпечення житлом), за умови надання повного сприяння Виконавцем та за умови, що Клієнт належним чином та вчасно оплатить Виконавцеві усю вартість послуг, згідно умов наведених в розділі V. даного Договору.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 10.sp),

                              //Розділ III

                              Text(
                                "Розділ III.\nОбов’язки та права Договірних сторін",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 10.sp),
                              Text(
                                "1.	  Виконавець зобов’язується на професійному рівні, кваліфіковано та вчасно надати Клієнтові та Студентові у повному об’ємі Послуги, наведеному в розділі II. пункті 3. даного Договору.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.sp),
                                child: Table(
                                  columnWidths: {
                                    0: FractionColumnWidth(0.1),
                                    1: FractionColumnWidth(0.9),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        "1.1",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Виконавець повинен:",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "детально ознайомити Клієнта із змістом усіх надаваних ним Послуг",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "проконсультувати Клієнта з усіма варіантами здобуття середньої та/або вищої освіти на території Словацької республіки, рейтингом освітніх закладів, та умовами вступного процесу",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "пояснити Студентові усі вимоги до нього та необхідний рівень його підготовки для вступу, можливість додаткового вивчення окремих предметів (репетиторство), мову навчання, систему навчання, цінову політику, забезпечення житлом, тощо.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "надати консультації щодо заповнення анкет, підготовки документів, потрібних для зарахування на навчання, а при потребі, надати консультації і щодо написання рекомендаційного листа, мотиваційного листа, автобіографії, тощо.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "контактувати з освітніми закладами з усіх питань щодо вступного процесу та щодо зарахування на навчання",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "забезпечити офіційний переклад документів, потрібних для навчання, надати усю медичну документацію та організувати забезпечення житлом",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "надати транспорт для перевезення Студента до освітнього закладу, до поліції у справах іноземних громадян та медичного закладу для проходження обов’язкового медичного огляду",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "відстежувати постійно усю потрібну інформацію та невідкладно контактувати з Клієнтом у випадку будь-яких змін зі сторони освітнього закладу, поліції у справах іноземних громадян, медичного закладу або організації, що забезпечує Студента житлом.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "1.2.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Виконавець не гарантує Студентові його прийом у вибраний ним освітній заклад на території Словацької республіки, так як він не має права і ніяк не може впливати на вступний процес.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "1.3.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Виконавець має право:",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "вимагати надання йому особистих даних та усіх документів, потрібних для вступу, і розпоряджатися ними у відповідності з GDPR (General Data Protection Regulation)",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "співпрацювати з будь-якими третіми особами чи залучати будь-яких третіх осіб для забезпечення належного рівня надання Послуг",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "-	у випадку порушення договірних умов, вимагати компенсації йому усіх його витрат, понесених ним у зв’язку з фактично виконаними Послугами",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "виставляти до оплати додаткові суми за окремі, попередньо погоджені дії, які були ним виконані за рамками Послуг, визначених даним Договором.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "2.    Клієнт / Студент заявляють, що їм відомий об’єм Послуг і що їм відомі усі їхні права та обов’язки, включно матеріально-правових наслідків від їх порушення ними.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.sp),
                                child: Table(
                                  columnWidths: {
                                    0: FractionColumnWidth(0.1),
                                    1: FractionColumnWidth(0.9),
                                  },
                                  children: [
                                    //2.1
                                    TableRow(children: [
                                      Text(
                                        "2.1",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Клієнт повинен:",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "підготувати та надати «Довіреність» із засвідченим його підписом на ній, за якою він уповноважує Виконавця представляти його інтереси у всіх діях, потрібних для виконання предмету Договору",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "у випадку, якщо Клієнт є законним представником Студента (одним з його батьків), він повинен в «Довіреності» вказати свої особисті дані як довірителя та вказати особисті дані Студента, на користь якого Послуги будуть надаватися",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "надати Виконавцеві потрібні документи, які, у свою чергу, повинні бути належним чином підготовлені, а інформація, що в них міститься, повинна бути достовірна та бути у повному об’ємі",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "гарантувати надання достовірної та правдивої інформації для виконання предмету даного Договору ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "дотримуватися встановлених строків та термінів, а також забезпечувати особисту участь Студента у діях, які будуть потрібні для виконання цілей даного Договору",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "дотримуватися усіх інструкцій, рекомендацій, вказівок та процедур, виконання яких вимагатиметься навчальними програмами, надавати дані про  реальні та справжні знання, вміння та навички для цілей успішного проходження вступної процедури в освітніх закладах",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "оплатити Виконавцеві за надані ним консультаційні та посередницькі Послуги усю узгоджену вартість у повному розмірі, способом та за умов, викладених у даному Договорі",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "у випадку порушення умов Договору, оплатити Виконавцеві усю суму понесених ним витрат та компенсувати йому усі збитки, які він зазнав при наданні ним Послуг.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    //2.2
                                    TableRow(children: [
                                      Text(
                                        "2.2",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Клієнт має право:",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "на доступ до застосунку «ZARF Study» та його використання і після закінчення чинності даного Договору",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "вимагати надання йому фотокопій усіх перекладів документів, проведених платежів та/або рішень (постанов, повідомлень, тощо) освітніх закладів, включно рішень (постанов, повідомлень, тощо) організацій, що забезпечують Студента житлом",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "додатково консультуватися з Виконавцем з питань надання Послуг, що виходять за межі чи рамки визначеного об’єму",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "-	вимагати повернення оплачених платежів або компенсації фактичних витрат, якщо Виконавець необґрунтовано порушить свої обов'язки (крім причинно-наслідкових взаємозв'язків згідно розділу VI. даного Договору).",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "2.3",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        "Клієнт бере до відома, що відповідальність за результати проходження «вступних іспитів» в освітньому закладі залежать винятково та тільки від самого Студента.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.sp),
                              //Розділ IV.
                              Text(
                                "Розділ IV.\nКонфіденційна інформація та її нерозголошення",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "1.	  Виконавець зобов’язується, з метою належного виконання даного Договору, усі особисті дані Клієнта або Студента опрацьовувати у відповідності з GDPR (General Data Protection Regulation), та надавати їх лише винятково відповідному освітньому закладу, відповідному відділенню поліції у справах іноземних громадян, відповідному медичному закладу та відповідній організації, що забезпечує студента житлом. Надавати їх будь-якій іншій третій стороні, він може лише за згодою Клієнта або Студента. Інформація стосовно джерел фінансування та майнового стану Клієнта також вважається конфіденційною, яку Виконавець зобов’язується не розголошувати, не поширювати та не надавати її ніяким іншим третім особам під час тривання даного Договору та на протязі наступних 60 місяців після його закінчення.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "2.	  Клієнт зобов’язується, що конфіденційна інформація Виконавця, така як вартість, календар платежів, платіжні умови, виконання окремих дій, не буде надаватися третім сторонам, не буде поширюватися будь-яким іншим способом чи розголошуватися під час тривання даного Договору, а також під час наступних 12 місяців після його закінчення.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "3.   випадку, якщо матиме місце порушення чи невиконання положень даного розділу однією з договірних сторін, тоді договірна сторона, яка допустилася такого порушення, повинна буде відшкодувати іншій договірній стороні усю завдану їй шкоду, за умови, що така шкода буде доведена та підтверджена.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 15.sp),
                              //Розділ V.
                              Text(
                                "Розділ V.\nВартість, виставлення рахунків та платіжні умови",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "1.   Оплата за замовлені Послуги проводиться попередньо у валюті: Євро.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                        "2.	  На основі волі Клієнта, підтвердженої його вибором після закінчення оформлення заявки в застосунку «ZARF Study», в нього виникає зобов’язання оплатити Виконавцеві за надавані Послуги загальну суму в ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text:
                                            "(${this.widget.summaryTotal},- €)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text:
                                            ", на основі виставленої фактури. Виконавець не є платником ПДВ (податку на додану вартість). У випадку надання додаткових послуг, їх вартість буде погоджена індивідуально, в залежності від терміновості та об’єму таких додаткових послуг.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                        "3.	  У вартість Послуг включені усі платежі за оформлення документів на загальну суму в ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: "250,- € ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text:
                                            "за винятком платежу за оформлення закордонного паспорту Клієнта, який він виготовляє самостійно та оплачує власним коштом.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                        "4.   Якщо Клієнт не бажає оплачувати усю вартість одним платежем, він може вибрати в застосунку опцію оплати по частках та підтвердити варіант розділення загальної суми на ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${this.widget.noOfPayments} платежів.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text:
                                            " Клієнт зобов’язується оплачувати кожен платіж згідно наступного календаря платежів:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),

                              //insert table here
                              SizedBox(height: 15.sp),
                              Table(
                                columnWidths: {
                                  0: FractionColumnWidth(0.4),
                                  1: FractionColumnWidth(0.2),
                                  2: FractionColumnWidth(0.4),
                                },
                                border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                                children: [
                                  TableRow(children: [
                                    Text(
                                      'Черговість платежу',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      'Сума',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      'Дія',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                  for(int i=1 ; i<this.widget.noOfPayments+1;i++)
                                    TableRow(children: [
                                      Text(
                                        i==3?'${i+1}-ій платіж' :'${i+1}-ий платіж',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      Text(
                                        this.widget.payments[i].toString()+"€",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                      this.widget.noOfPayments==3 && i==3?
                                      Text(
                                        payMessages[4],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ):
                                      Text(
                                        payMessages[i-1],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                                  TableRow(children: [
                                    Text(
                                      'Всього',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                        this.widget.payments[0].toString()+"€",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),

                                ],
                              ),
                              SizedBox(height: 15.sp),
                              Text(
                                "5.   Клієнт зобов’язується оплачувати кожен платіж згідно календаря платежів та не пізніше як протягом 5 днів від останнього дня, в якому він повинен був його оплатити (про що йому буде повідомлено в застосунку «ZARF study» та надіслано нагадування на його електронну пошту за декілька днів до дати платежу).\n"
                                "6.   У випадку, якщо Клієнт не оплатить будь-який з платежів протягом 5 днів від останнього дня, в якому він повинен був його оплатити, і за умови, що Договірні сторони не домовилися про інший термін для оплати, Виконавець призупиняє надання послуг аж до часу погашення простроченого платежу.\n"
                                "7.   Якщо Клієнт не оплатить прострочений платіж протягом 30 днів від останнього дня, в якому він повинен був його оплатити, зобов’язання Виконавця надати Послуги за даним Договором стають нечинними без виплати будь-якої компенсації Клієнтові з його сторони, так як Клієнт при цьому втрачає право на вимагання повернення йому оплачених ним попередніх платежів.\n",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              //Розділ VI.
                              Text(
                                "Розділ VI.\nОбставини непереборної сили та неможливість виконання предмету Договору",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "1.   Обставини непереборної сили (форс-мажорні обставини) це події, настання яких не є можливим ні передбачити, ні відвернути. Для цілей виконання предмету Договору під форс-мажорними обставинами розуміються наступні події:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Table(
                                columnWidths: {
                                  0: FractionColumnWidth(0.1),
                                  1: FractionColumnWidth(0.9),
                                },
                                children: [
                                  //2.1
                                  TableRow(children: [
                                    Text(
                                      "-",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text:
                                              "стихійні лиха та природні катаклізми чи катастрофи ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter'),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "(наприклад, ураган, шторм, торнадо, повінь, землетрус, пожежа, тощо.)",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      "-",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text:
                                              "бездіяльність третіх сторін внаслідок надзвичайних ситуацій",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter'),
                                          children: [
                                            TextSpan(
                                              text:
                                                  ", незважаючи на волю до дій договірної сторони (наприклад, війна, повстання, терористичний акт, блокада, громадянські заворушення, пандемія, епідемія, тощо.)",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      "-",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text:
                                              "зміни в законодавстві або рішення / постанови органів державної влади та місцевого самоврядування ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter'),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "(наприклад, закриття освітнього закладу, накладення ембарго, закриття доріг, нефункціонування транспортного сполучення, заборона чи обмеження експорту  або імпорту, тощо.)",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Inter'),
                                            ),
                                          ]),
                                    ),
                                  ]),
                                ],
                              ),
                              Text(
                                "2.   Обидві Договірні сторони звільняються від відповідальності за повне або часткове порушення ними своїх зобов’язань за даним Договором, якщо вони доведуть, що таке порушення сталося внаслідок дії форс-мажорних обставин, перелічених вище, за умови, що вони документально доведуть, що неможливість виконання ними своїх зобов’язань за даним Договором настала у прямому причинному зв’язку з настанням таких подій, та за умови, що їх настання було підтверджене згідно відповідних положень даного Договору.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              //Розділ VII.
                              Text(
                                "Розділ VII.\nТривання та закінчення Договору",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "1.   Даний Договір укладається на визначений в часі період, який триватиме від дня акцептування Договору, підтвердженого до 30.11.2022 року Клієнтом в застосунку «ZARF study», і до часу зарахування Студента на навчання в освітньому закладі (за умови його успішної реєстрації у відповідному відділенні поліції по роботі з іноземними громадянами та успішного проходження медичного огляду).",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Table(
                                columnWidths: {
                                  0: FractionColumnWidth(0.1),
                                  1: FractionColumnWidth(0.9),
                                },
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "1.1.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      "У випадку настання особливих ситуацій, Договірними сторонами продовжується час тривання даного Договору, виходячи з часу тривання таких особливих ситуацій.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      "1.2.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      "Застосунок «ZARF study» залишається доступним і після закінчення чинності даним Договором.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "2.   ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text:
                                            "Виконавець може Договір розірвати ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text:
                                            "в односторонньому порядку у випадку, якщо Клієнт надасть неправдиву інформацію, потрібну для досягнення цілей даного Договору, або ж у випадку надання ним фальшивих чи сумнівних документів. У випадку наявності наведених вище підстав, Виконавець надішле Клієнтові повідомлення в електронній формі про розірвання договору, а сам Договір вважатиметься розірваним після 10 днів від дня відправки відповідного повідомлення, і при цьому Клієнт не матиме права на повернення йому вже оплаченої ним вартості Послуг.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "3.   ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text:
                                            "Клієнт може даний Договір розірвати ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                      TextSpan(
                                        text:
                                            "в односторонньому порядку у випадку, якщо Виконавець не надасть вчасно ту чи іншу послугу або необґрунтовано не виконає свої зобов’язання згідно даного Договору. У випадку наявності таких підстав, Клієнт надішле Виконавцеві повідомлення в електронному вигляді про розірвання договору, а сам Договір вважатиметься розірваним після 10 днів від дня відправки відповідного повідомлення, і при цьому Клієнт матиме право на повернення йому вже оплаченої ним вартості Послуг.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),
                              Text(
                                "4.   Договірні сторони погоджуються з тим, що даний Договір може бути розірваний по взаємній домовленості Договірних сторін і під час його тривання, однак, за умови, що Клієнт не матиме права на повернення йому вже оплаченої ним вартості Послуг. Договір вважатиметься розірваним в день електронного підтвердження відповідної домовленості, відправленого іншою Договірною стороною."
                                "5.   Клієнт, за умовами § 7 пункт 1 закону № 102 зводу законів за 2014 рік про охорону споживачів товарів та послуг, що надаються на основі договору, укладеного дистанційно, або що надаються на основі договору, укладеного за межами офісних, торгових чи виробничих приміщень, має право від даного Договору відмовитися на протязі 14 днів від дня укладення даного Договору, надавши Виконавцеві відповідну відмову без наведення причин такої відмови."
                                "6.   У випадку рекламації Послуги, Клієнт повинен без зволікань повідомити про неї Виконавця, детально описавши при цьому конкретну дію Виконавця, щодо якої він висуває рекламацію. Виконавець повинен усунути недоліки максимально протягом періоду в 30 днів. У випадку, якщо забезпечення Послуги зі сторони Виконавця все ж не матиме місце, Клієнт матиме право на компенсацію своїх витрат.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              //Розділ VIII
                              Text(
                                "Розділ VIII.\nПроцедура вирішення спорів",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "1.   Усі розбіжності та суперечки, які можуть виникнути з договірних відносин за даним Договором між Договірними сторонами, першочергово повинні між ними вирішуватися шляхом переговорів та/або взаємного листування, або ж у дружній спосіб із залученням посередника (без судового розгляду)."
                                "2.	  У випадку, якщо договірні сторони не зможуть домовитися між собою, предмет спору повинен вирішуватися у суді місцевої юрисдикції Виконавця у відповідності з чинним законодавством Словацької республіки.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              //Розділ IX
                              Text(
                                "Розділ IX.\nЗаключні положення",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                "1.	  Клієнту відомо, що даний Договір буде виготовлений тільки в електронній формі."
                                "2.	  Договір набирає чинності після кліку на опцію «Погоджуюся з умовами Договору» (Súhlasím s podmienkami Zmluvy) в попередньому перегляді договору в застосунку «ZARF study». "
                                "3.	  Договірні відносини, які випливають з даного Договору та які не врегульовані його положеннями, керуються відповідними положеннями Цивільного кодексу (закон № 40 зводу законів за 1964 рік)."
                                "4.   Зміни в Договорі можна провести лише по взаємній домовленості Договірних сторін у формі додатків до Договору, підтверджених обома договірними сторонами. "
                                "5.	  Клієнт підписанням даного Договору підтверджує, що Посередником були доведені до його відома положення закону № 18 зводу законів за 2018 рік, в останній його редакції, та Директиви Європейського Парламенту та Ради Європи (EÚ) № 2016/679 (General Data Protection Regulation - GDPR) стосовно обробки його персональних даних Посередником - академічний ступінь, ім’я та прізвище, прізвище при народженні, номер закордонного паспорту, дата народження, ідентифікаційний або персональний номер, адреса місця постійного проживання, номер банківського рахунку - які будуть потрібні для наступних цілей:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              Table(
                                columnWidths: {
                                  0: FractionColumnWidth(0.1),
                                  1: FractionColumnWidth(0.9),
                                },
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "-",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      "заповнення заявки для цілей навчання",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      "-",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      "оформлення відповідних документів у поліції по роботі з іноземними громадянами",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      "-",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      "проходження медичного огляду ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      "-",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      "реєстрація тимчасового місця проживання на території Словацької республіки.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                ],
                              ),
                              Text(
                                "6.   Договірні сторони заявляють, що вони є дієздатними та правомочними виконувати юридичні дії, їх свобода на укладення даного Договору нічим не обмежена, що вони даний Договір перечитали, його зміст їм зрозумілий, що вони укладають його на основі їх вільного волевиявлення, із конкретними та серйозними намірами, без примусу чи на невигідних для них умовах, в підтвердження чого вони його власноручно підписують."
                                "\n\nНаселений пункт: Prešov\n\n",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Inter'),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Дата: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                    children: [
                                      TextSpan(
                                        text: DateFormat.yMMMMd('uk_UA')
                                            .format(globalInvoiceID!=null?globalContractDate :DateTime.now()),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 30.h),
                              Table(
                                columnWidths: {
                                  0: FractionColumnWidth(0.35),
                                  1: FractionColumnWidth(0.3),
                                  2: FractionColumnWidth(0.4),
                                },
                                children: [
                                  TableRow(children: [
                                    SizedBox(
                                      child: Image.asset("assets/images/ZarfSignature.png",
                                     )

                                    ),
                                    SizedBox(),
                                    SizedBox(),
                                    
                                  ]),
                                  TableRow(children: [
                                    SizedBox(
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(),
                                    Text(
                                      this.widget.accName+' '+this.widget.lastName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      "Підпис Виконавця",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                    SizedBox(),
                                    Text(
                                      "Підпис Клієнта / Студента",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 9 * (width / 10),
                    child: ElevatedButton(
                        onPressed: paymentStatus?null:() async{
                          InvoiceData inv=InvoiceData();
                          inv.clientName=this.widget.accName;
                          inv.clientAddress=this.widget.accAddress;
                          inv.clientIco="100";
                          inv.clientCity=this.widget.city;
                          inv.clientCountry=this.widget.country;
                          inv.unitPrice=this.widget.summaryTotal;
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context)
                              {
                                return loadingScreen();

                              });
                          String id= await ApiService().createInvoice(inv);

                          await dbMain.setInvoice(id);
                          Navigator.pop(context);
                          Navigator.pop(context, id);
                        },
                        child: Text(
                          AppLocalizations.of(context).contractTerms,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff03045e),
                          //padding: EdgeInsets.fromLTRB(150, 15, 150, 15)
                        )),
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
