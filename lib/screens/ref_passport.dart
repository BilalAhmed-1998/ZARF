import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zarf/screens/ref_documents.dart';
import 'package:zarf/screens/ref_documents2.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dummydata.dart';


bool _loading;
double _progressValue;
bool upload=false;
bool complete=false;




class ref_passport extends StatefulWidget {
  static const routeName = '/ref_passport';

  final String docType;
  final String docimg;
  ref_passport({Key key, @required this.docType, @required this.docimg}) : super(key: key);

  @override
  _ref_passportState createState() => _ref_passportState();
}

class _ref_passportState extends State<ref_passport> {

  final ImagePicker _picker = ImagePicker();
  dynamic myimage;

  _imageCamera() async {
    final XFile photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(()  {
        myimage = File(photo.path);

        if(widget.docType==AppLocalizations.of(context).passport)
          passportUploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportcardfor8th)
          reportCard8Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportCardFor9thgrade)
          reportCard9Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportCardFor10thgrade)
          reportCard10Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportcardforhalfof9thgrade)
          HalfReportCard9Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportCardForhalfofthe11thgrade)
          HalfReportCard11Uploaded=true;
      });
    }
  }

  _imageGallery() async {
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        myimage = File(image.path);
        if(widget.docType==AppLocalizations.of(context).passport)
          passportUploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportcardfor8th)
          reportCard8Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportCardFor9thgrade)
          reportCard9Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportCardFor10thgrade)
          reportCard10Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportcardforhalfof9thgrade)
          HalfReportCard9Uploaded=true;
        if(widget.docType==AppLocalizations.of(context).reportCardForhalfofthe11thgrade)
          HalfReportCard11Uploaded=true;
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: Text(AppLocalizations.of(context).chooseFromLibrary),
                      onTap: () {
                        _imageGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text(AppLocalizations.of(context).camera),
                    onTap: () {
                      _imageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }



  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String getWidget(){
      if(widget.docType==AppLocalizations.of(context).passport)
        return passportImage;
      if(widget.docType==AppLocalizations.of(context).reportcardfor8th)
        return reportCard8Image;
      if(widget.docType==AppLocalizations.of(context).reportCardFor9thgrade)
        return reportCard9Image;
      if(widget.docType==AppLocalizations.of(context).reportCardFor10thgrade)
        return reportCard10Image;
      if(widget.docType==AppLocalizations.of(context).reportcardforhalfof9thgrade)
        return HalfReportcard9image;
      if(widget.docType==AppLocalizations.of(context).reportCardForhalfofthe11thgrade)
        return HalfReportCard11Image;
    }

    Widget getWidget2(){
      if(widget.docType==AppLocalizations.of(context).passport)
        return Image.network(
          passportImage,
          //height: 100,
          fit: BoxFit.fill,
        );
      if(widget.docType==AppLocalizations.of(context).reportcardfor8th)
        return Image.network(
          reportCard8Image,
          //height: 100,
          fit: BoxFit.fill,
        );
      if(widget.docType==AppLocalizations.of(context).reportCardFor9thgrade)
        return Image.network(
          reportCard9Image,
          //height: 100,
          fit: BoxFit.fill,
        );
      if(widget.docType==AppLocalizations.of(context).reportCardFor10thgrade)
        return Image.network(
          reportCard10Image,
          //height: 100,
          fit: BoxFit.fill,
        );
      if(widget.docType==AppLocalizations.of(context).reportcardforhalfof9thgrade)
        return Image.network(
          HalfReportcard9image,
          //height: 100,
          fit: BoxFit.fill,
        );
      if(widget.docType==AppLocalizations.of(context).reportCardForhalfofthe11thgrade)
        return Image.network(
          HalfReportCard11Image,
          //height: 100,
          fit: BoxFit.fill,
        );
    }

    Widget getWidget3(){
      if(widget.docType==AppLocalizations.of(context).passport && passportImage!=null)
        return Container(
          height: 46,
          width: 157,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: Text(
              "Завершувати",//'Complete',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'InterBold',
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),

        );
      if(widget.docType==AppLocalizations.of(context).reportcardfor8th && reportCard8Image!=null)
        return Container(
          height: 46,
          width: 157,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: Text(
              'Завершувати',//'Complete',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'InterBold',
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),

        );
      if(widget.docType==AppLocalizations.of(context).reportCardFor9thgrade && reportCard9Image!=null)
        return Container(
          height: 46,
          width: 157,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: Text(
              'Завершувати',//'Complete',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'InterBold',
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),

        );
      if(widget.docType==AppLocalizations.of(context).reportCardFor10thgrade && reportCard10Image!=null)
        return Container(
          height: 46,
          width: 157,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: Text(
              'Завершувати',//'Complete',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'InterBold',
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),

        );
      if(widget.docType==AppLocalizations.of(context).reportcardforhalfof9thgrade && HalfReportcard9image!=null)
        return Container(
          height: 46,
          width: 157,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: Text(
              'Завершувати',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'InterBold',
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),

        );
      if(widget.docType==AppLocalizations.of(context).reportCardForhalfofthe11thgrade && HalfReportCard11Image!=null)
        return Container(
          height: 46,
          width: 157,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: Text(
              'Завершувати',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'InterBold',
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),

        );

      else
        return Container(
            height: 46,
            width: 147,
            decoration: BoxDecoration(
                color: Color(0xff03045E),
                borderRadius: BorderRadius.circular(5.0)
            ),
            child: InkWell(
              onTap: ()  async{
                setState(() {
                  upload=true;
                });

                if(widget.docType==AppLocalizations.of(context).passport) {
                  double prog=await dbMain.documentUpload(myimage, 'Passport');
                  if(prog==1)
                    _updateProgress();
                  await dbMain.getDocuments();
                  if (passportUploaded != false) {
                    setState(() {
                      _loading = !_loading;
                      _updateProgress();
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        upload=false;
                        complete=true;
                      });

                    });
                  }
                }
                else if(widget.docType==AppLocalizations.of(context).reportcardfor8th){
                  await dbMain.documentUpload(myimage, 'reportCard8th');
                  await dbMain.getDocuments();
                  if (reportCard8Uploaded != false) {
                    setState(() {
                      _loading = !_loading;
                      _updateProgress();
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        upload=false;
                        complete=true;
                      });

                    });
                  }
                }
                else if(widget.docType==AppLocalizations.of(context).reportCardFor9thgrade){
                  await dbMain.documentUpload(myimage, 'reportCard9th');
                  await dbMain.getDocuments();
                  if (reportCard9Uploaded != false) {
                    setState(() {
                      _loading = !_loading;
                      _updateProgress();
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        upload=false;
                        complete=true;
                      });

                    });
                  }
                }
                else if(widget.docType==AppLocalizations.of(context).reportCardFor10thgrade){
                  await dbMain.documentUpload(myimage, 'reportCard10th');
                  await dbMain.getDocuments();
                  if (reportCard10Uploaded != false) {
                    setState(() {
                      _loading = !_loading;
                      _updateProgress();
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        upload=false;
                        complete=true;
                      });

                    });
                  }
                }
                else if(widget.docType==AppLocalizations.of(context).reportcardforhalfof9thgrade){
                  await dbMain.documentUpload(myimage, 'HalfReportCard9th');
                  await dbMain.getDocuments();
                  if (HalfReportCard9Uploaded != false) {
                    setState(() {
                      _loading = !_loading;
                      _updateProgress();
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        upload=false;
                        complete=true;
                      });

                    });
                  }
                }
                else if(widget.docType==AppLocalizations.of(context).reportCardForhalfofthe11thgrade){
                  await dbMain.documentUpload(myimage, 'HalfReportCard11th');
                  await dbMain.getDocuments();
                  if (HalfReportCard11Uploaded != false) {
                    setState(() {
                      _loading = !_loading;
                      _updateProgress();
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        upload=false;
                        complete=true;
                      });

                    });
                  }
                }
              },

              child: Center(
                child: Text(
                  'Завантажити',//'Upload',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'InterBold',
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            )
        );

    }




    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if(University==false) {
              Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, ref_documents.routeName);
            }
            else if(University==true)
              {
                Navigator.of(context).pop();
                Navigator.popAndPushNamed(context, ref_documents2.routeName);
              }
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.docType,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'InterBold'
          ),
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
                  child: Image.asset(widget.docimg,),
                  radius: 51,
                  backgroundColor: Color(0xffF9FAFB),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Без закордонного паспорта не можливо подати заяву на поступлення',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'How to Upload',
                style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  Row(
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
                      Text(
                        ' Зробіть скан копію документу ',
                        style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
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
                      Text(
                        ' Знайдіть в галереї та завантажте.',
                        style: TextStyle(
                          color: Color(0xff6B7280),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: getWidget()!=null?
                      Container(

                        // width: width,
                        // height: height/4,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(15.0),
                        // ),

                        child: getWidget2()
                      )
                      :myimage!=null?
                      Container(
                        //margin: EdgeInsets.symmetric(horizontal: 40),
                        // width: width,
                        // height: height/4,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(15.0),
                        //     border: Border.all(color: Colors.grey[500]),
                        // ),
                        child: Image.file(
                          myimage,
                          // height: 100,
                          fit: BoxFit.fill,
                        )

                      ):
                      Container(
                    //margin: EdgeInsets.symmetric(horizontal: 40),
                    width: width,
                    height: height/4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.grey[500]),
                    ),
                    child:
                    Column(
                    children: [
                    SizedBox(
                    height: 55,
                  ),
                  Transform.rotate(
                    angle: 270 * 3.14 / 180,
                    child: Icon(
                      Icons.logout,
                      size: 41,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Click to upload your '+widget.docType,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  )
                ],
              ),


        ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  upload?Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[200],
                            child: Icon(
                              Icons.description_outlined,
                              size: 20,
                              color: Color(0xff03045E),
                            ),
                          ),
                          Text(
                            ' Upload Progress',
                            style: TextStyle(
                                color: Color(0xff03045E),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width-50,
                        child: ProgressBar2(),

                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ):
                      SizedBox(
                        height: 1,
                      ),

                  getWidget3(),
                  SizedBox(
                    height: 30,
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue =1;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue: 0.0;
          return;
        }
      });
    });
  }
}



class ProgressBar2 extends StatefulWidget {
  @override
  State createState() {
    return ProgressBar2State();
  }
}

class ProgressBar2State extends State<ProgressBar2>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _progressValue=0;
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this,);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),

      child: Container(
          width: width / 1.85,

          child: LinearProgressIndicator(
            value: _progressValue,
            backgroundColor: Color(0xffF3F4F6),
            color: Color(0xff03045E),
            minHeight: 12,
          )),
    );
  }
}


