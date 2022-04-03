import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/refhome_page.dart';
import 'ref_package.dart';
import 'ref_passport.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Document_Card extends StatelessWidget {
  String doc;
  String type;
  dynamic doc_image;
  dynamic doc_uploaded;
  bool approvalStatus;
  String image;

  Document_Card({this.doc,this.type, this.doc_image, this.doc_uploaded,this.approvalStatus, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color(0xff8a959e).withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 40,
          offset: Offset(0,8),

        )],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      //height: height / 6,
      width: width,
      padding: EdgeInsets.fromLTRB(23, 0, 20, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //width: width/1.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  //width: width/1.7,
                  child: Row(
                    children: [
                      Text(
                        doc+' ',
                        style: TextStyle(
                          color: Color(0xff03045E),
                          fontSize: 16,
                          fontFamily: ('inter'),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      (doc_image!=null)
                          ?CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xff03045e),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        ),
                      )
                          :ImageIcon(
                        AssetImage("assets/images/ref18.png"),
                        size: 16,
                        color: Color(0xFFD1D5DB),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width-140,
                  child: doc_image!=null?
                  Text(
                    doc+' '+AppLocalizations.of(context).uploadedSuccessfully,
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 12,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500
                    ),
                  ):Text(
                    doc+' '+AppLocalizations.of(context).uploadUnsuccessful,
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 12,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                approvalStatus==true?
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff10B981),
                      size: 14,
                    ),
                    Text(
                      ' '+AppLocalizations.of(context).approvedByStaff,
                      style: TextStyle(
                        color: Color(0xff03045E),
                        fontSize: 11,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
                    :Row(
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 14,
                    ),
                    Text(
                      ' '+AppLocalizations.of(context).notapprovedByStaff,
                      style: TextStyle(
                        color: Color(0xff03045E),
                        fontSize: 11,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Image.asset(image),
          )
        ],
      ),
    );
  }
}
class Document_Card2 extends StatelessWidget {
  String doc;
  String type;
  bool docReceived;
  bool docApproved;
  String image;

  Document_Card2({this.doc,this.type, this.docReceived, this.docApproved, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color(0xff8a959e).withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 40,
          offset: Offset(0,8),

        )],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      //height: height / 6,
      width: width,
      padding: EdgeInsets.fromLTRB(23, 0, 20, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //width: width/1.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  //width: width/1.7,
                  child: Row(
                    children: [
                      Text(
                        doc,
                        style: TextStyle(
                          color: Color(0xff03045E),
                          fontSize: 16,
                          fontFamily: ('inter'),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      (docReceived==true)
                          ?CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xff03045e),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        ),
                      )
                          :ImageIcon(
                        AssetImage("assets/images/ref18.png"),
                        size: 16,
                        color: Color(0xFFD1D5DB),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width-140,
                  child: docReceived==true?
                  Text(
                    doc+' '+AppLocalizations.of(context).uploadedSuccessfully,
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 12,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500
                    ),
                  ):Text(
                    doc+' '+AppLocalizations.of(context).uploadUnsuccessful,
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 12,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                docApproved==true?
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff10B981),
                      size: 14,
                    ),
                    Text(
                      ' '+AppLocalizations.of(context).approvedByStaff,
                      style: TextStyle(
                        color: Color(0xff03045E),
                        fontSize: 11,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
                    :Row(
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 14,
                    ),
                    Text(
                      ' '+AppLocalizations.of(context).notapprovedByStaff,
                      style: TextStyle(
                        color: Color(0xff03045E),
                        fontSize: 11,
                        fontFamily: ('Inter'),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Image.asset(image),
          )
        ],
      ),
    );
  }
}


class ref_documents extends StatelessWidget {
  static const routeName = '/ref_documents';

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
            Navigator.of(context).pushReplacementNamed(refhome_page.routeName);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          AppLocalizations.of(context).documents,
          style: TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'InterBold'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(AppLocalizations.of(context).uploadDocs,
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: ('inter')
                  )),
              SizedBox(
                height: 15,
              ),
              Text(AppLocalizations.of(context).onlineDocs,
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: ('InterBold')
                  )),
              SizedBox(
                height: 8,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ref_passport(docType:AppLocalizations.of(context).passport ,docimg: 'assets/images/ref5.png',),
                      ));
                },
                child: Document_Card(doc: AppLocalizations.of(context).passport,type:"upload",doc_image: passportImage,doc_uploaded: passportUploaded,approvalStatus: passportApproved,image: 'assets/images/ref5.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ref_passport(docType:AppLocalizations.of(context).reportcardfor8th ,docimg: 'assets/images/ref7.png',),
                      ));
                },
                child: Document_Card(doc: AppLocalizations.of(context).reportcardfor8th,type:"upload",doc_image: reportCard8Image,doc_uploaded: reportCard8Uploaded,approvalStatus: report8Approved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ref_passport(docType:AppLocalizations.of(context).reportcardforhalfof9thgrade ,docimg: 'assets/images/ref7.png',),
                      ));
                },
                child: Document_Card(doc: AppLocalizations.of(context).reportcardforhalfof9thgrade,type:"upload",doc_image: HalfReportcard9image,doc_uploaded: HalfReportCard9Uploaded,approvalStatus: HalfReport9Approved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Text(AppLocalizations.of(context).offlineDocs,
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: ('InterBold')
                  )),
              SizedBox(
                height: 8,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).reportcardfor8th,type:"received",docReceived: offlineReport8Received,docApproved: offlineReport8Approved,image: 'assets/images/ref7.png'),
              ),

              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).reportCardFor9thgrade,type:"received",docReceived: offlineHalfReport9Received,docApproved: offlineHalfReport9Approved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).birthCertificate,type:"received",docReceived: offlineBirthCertificateReceived,docApproved: offlineBirthCertificateApproved,image: 'assets/images/ref6.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).certificateOfResidence,type:"received",docReceived: offlinePRCertificateReceived,docApproved: offlinePRCertificateApproved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).ukrainianPassport,type:"received",docReceived: offlineUkrainianPassportReceived,docApproved: offlineUkrainianPassportApproved,image: 'assets/images/ref5.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).certificateOfNoCriminalRecord,type:"received",docReceived: offlineCRCertificateReceived,docApproved: offlineCRCertificateApproved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).photoscm,type:"received",docReceived: offlinePhotosReceived,docApproved: offlinePhotosApproved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).diploma,type:"received",docReceived: offlineDiplomaReceived,docApproved: offlineDiplomaApproved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: (){
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Document_Card2(doc: AppLocalizations.of(context).reportCardForCompletedGrade9,type:"received",docReceived: offlineComReport9Received,docApproved: offlineComReport9Approved,image: 'assets/images/ref7.png'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                enableFeedback: true,
                onTap: () {
                  Navigator.pushNamed(context, ref_package.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Color(0xff8a959e).withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: Offset(0,8),

                    )],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: width,
                  padding: EdgeInsets.fromLTRB(23, 0, 23, 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Перший пакет документів",//'Document Package #1 ',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 16,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ImageIcon(
                                  AssetImage("assets/images/ref18.png"),
                                  size: 16,
                                  color: Color(0xFFD1D5DB),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width-140,
                              child: Text(
                              'Містить: свідоцтво про народження...',//Includes: Birth Certificate, Signed Sheet of..
                                style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontSize: 12,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: 5.5,
                                  child: Icon(
                                    Icons.send,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' Відправлений 10 днів тому',
                                  style: TextStyle(
                                    color: Color(0xff03045E),
                                    fontSize: 11,
                                    fontFamily: ('Inter'),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/ref7.png',
                        fit: BoxFit.fill,),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
