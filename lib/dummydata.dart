// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarf/dormitory.dart';
import 'package:zarf/school.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zarf/screens/ref_messages.dart';
import 'package:zarf/services/DatabaseCollection.dart';
import 'package:zarf/services/app_user.dart';
import 'package:zarf/services/localStorage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



/////agreemnet///
int globalnumPayments;
double globalDiscount;
double globalsummary;
List<dynamic>globalPlan;
String globalPrimarySchool;
String globalAlternativeSchool;
bool globalisUniversity=false;
DateTime globalContractDate=DateTime.now();

////Seats left variable//////
dynamic seatsLeft = 0;
////////////
String departureText="";
dynamic Date=DateTime.now();
List<ChatMessage> messages = [];
bool paymentStatus=false;
void resetAll() {
  passportImage = null;
  reportCard8Image = null;
  HalfReportcard9image = null;
  dbMain.uid = null;
  hideCheckOut = false;
  fromCheckout = false;
  checkFirst = true;
  checkChange = 0;
  reservedInstitute = List.filled(2, null);
  reservedDormitory = List.filled(2, null);
  primaryDistanceCalculatedDormitories.clear();
  alternativeDistanceCalculatedDormitories.clear();
  Allinstitutes.clear();
  TopSchools.clear();
  PopularSchools.clear();
  dormitories.clear();
  globalTestingVariable=0;
  globalUser = app_user();
  globalInvoiceID;
  globalInvoiceError="";
  globalInvoiceImage="";
  globalInvoiceVerify=false;
}
////////main user////////////
int globalTestingVariable=0;
app_user globalUser = app_user();
String globalInvoiceID;
String globalInvoiceError="";
String globalInvoiceImage="";
bool globalInvoiceVerify=false;
////////referral ///////////////////////

List<Map<String, dynamic>> leaders = [];

////////////////// high school or uni /////////////

bool University = false;

///////////////////// ONLINE DOCUMENTS ///////////////////////////

dynamic passportImage = null;
bool passportUploaded = false;
dynamic reportCard8Image = null;
bool reportCard8Uploaded = false;
dynamic HalfReportcard9image = null;
bool HalfReportCard9Uploaded = false;

dynamic reportCard9Image = null;
bool reportCard9Uploaded = false;
dynamic reportCard10Image = null;
bool reportCard10Uploaded = false;
dynamic HalfReportCard11Image = null;
bool HalfReportCard11Uploaded = false;

dynamic certificateImage = null;
dynamic reportImage = null;

bool passportApproved = false;
bool report8Approved = false;
bool HalfReport9Approved = false;

bool report9Approved = false;
bool report10Approved = false;
bool HalfReport11Approved = false;

////////////////////////////////// OFFLINE DOCUMENTS //////////////////////////////////////

bool offlineReport8Approved = false;
bool offlineHalfReport9Approved = false;
bool offlineBirthCertificateApproved = false;
bool offlinePRCertificateApproved = false;
bool offlineUkrainianPassportApproved = false;
bool offlineCRCertificateApproved = false;
bool offlinePhotosApproved = false;
bool offlineDiplomaApproved = false;
bool offlineComReport9Approved = false;

bool offlineReport9Approved = false;
bool offlineReport10Approved = false;
bool offlineHalfReport11Approved = false;
bool offlineComReport11Approved = false;

bool offlineReport8Received = false;
bool offlineHalfReport9Received = false;
bool offlineBirthCertificateReceived = false;
bool offlinePRCertificateReceived = false;
bool offlineUkrainianPassportReceived = false;
bool offlineCRCertificateReceived = false;
bool offlinePhotosReceived = false;
bool offlineDiplomaReceived = false;
bool offlineComReport9Received = false;

bool offlineReport9Received = false;
bool offlineReport10Received = false;
bool offlineHalfReport11Received = false;
bool offlineComReport11Received = false;

////////////////local storage //////////
LocalStorage dbLocal = LocalStorage();

////////////////FireStore Database////////////
DatabaseCollection dbMain = DatabaseCollection();
///////////Selected lists////////////////

bool hideCheckOut = false;
bool fromCheckout = false;
bool checkFirst = true;
int checkChange = 0;
List<Institute> reservedInstitute = List.filled(2, null);
List<Dormitory> reservedDormitory = List.filled(2, null);

////Geo locator calculated distances of dormitories lists////

List<Dormitory> primaryDistanceCalculatedDormitories = [];
List<Dormitory> alternativeDistanceCalculatedDormitories = [];

/////////////FAQ/////////////////////////

Map<String, Map<String, dynamic>> FAQ = {
  "Account Related Questions": {},
  "Dormitory Detailed Questions": {},
  "Dormitory Questions": {},
  "School Detailed Questions": {},
  "School Level Questions": {},
  "School Questions": {},
  "General Questions": {},
};
Map<String, dynamic> FAQs = {
  "Why do I have to choose 2 schools?":
      "The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
  "Can I change the school later on?":
      "The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
  "I need more information about the school. Who can I talk to?":
      "The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
  "How to search for dormitory?":
      "The alternative school functions as a safety net. In case you don’t get into your primary school, this is the second option. \n\nOr, if you’re admitted to both schools, you’ll be able to choose where do you want to study.",
};

////////////////////////////////////////////////////////////////////////////////////
List<Institute> favts = [];

List<Institute> TopSchools = [
  // Allinstitutes[0],
  // Allinstitutes[1],
  // Allinstitutes[2],
];
List<Institute> PopularSchools = [
  // Allinstitutes[0],
  // Allinstitutes[1],
  // Allinstitutes[2],
];

List<Institute> Allinstitutes = [
  // Institute(
  //     title: "Brafford Lincon School",
  //     category: ["Engineering"],
  //     image: "assets/images/school3.png",
  //     location: "Poprad",
  //     public: true,
  //     institutedetails: InstituteDetails(
  //       coordinates: GeoPoint(33.6565, 73.0154),
  //         institutetype: "HIGH SCHOOL",
  //         rating: 4.2,
  //         tutionfee: 1000,
  //         description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //         teachingprograms: [
  //           TeachingPrograms(
  //               title: "Nursing",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ],
  //           ),
  //           TeachingPrograms(
  //               title: "Technology",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ],
  //           ),
  //           TeachingPrograms(
  //               title: "Banking",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ]
  //           ),
  //         ],
  //         images: [
  //           'assets/images/school3.png',
  //           'assets/images/school2.png',
  //           'assets/images/school1.png',
  //
  //
  //         ]
  //     )
  //
  // ),
  // Institute(
  //     title: "Samson's Harly School",
  //     category: ["Business"],
  //     image: "assets/images/school1.png",
  //     location: "Poprad",
  //     public: true,
  //     institutedetails: InstituteDetails(
  //         coordinates: GeoPoint(33.6425, 72.9930),
  //         institutetype: "HIGH SCHOOL",
  //         rating: 4.2,
  //         tutionfee: 1000,
  //         description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //         teachingprograms: [
  //           TeachingPrograms(
  //               title: "Nursing",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ]
  //           ),
  //           TeachingPrograms(
  //               title: "Technology",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ]
  //           ),
  //           TeachingPrograms(
  //               title: "Banking",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ]
  //           ),
  //         ],
  //         images: [
  //           'assets/images/school1.png',
  //           'assets/images/school2.png',
  //           'assets/images/school3.png',
  //         ]
  //     )
  //
  // ),
  // Institute(
  //     title: "Houston Basked School",
  //     category: ["IT"],
  //     image: "assets/images/school2.png",
  //     location: "Poprad",
  //     public: true,
  //     institutedetails: InstituteDetails(
  //         coordinates: GeoPoint(33.7156, 73.0288),
  //         institutetype: "HIGH SCHOOL",
  //         rating: 4.2,
  //         tutionfee: 1000,
  //         description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //         teachingprograms: [
  //           TeachingPrograms(
  //               title: "Nursing",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ]
  //           ),
  //           TeachingPrograms(
  //               title: "Technology",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ]
  //           ),
  //           TeachingPrograms(
  //               title: "Banking",
  //               duration: "2",
  //               specification: "Medical Science",
  //               description: "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
  //               careers: [
  //                 {
  //                   "job":"Dentist",
  //                   "max":"2000",
  //                   "min":"1000"
  //                 },
  //                 {
  //                   "job":"Surgery",
  //                   "max":"3000",
  //                   "min":"2000"
  //                 },
  //                 {
  //                   "job":"Neurolab",
  //                   "max":"4000",
  //                   "min":"3000"
  //                 },
  //               ],
  //           ),
  //         ],
  //         images: [
  //           'assets/images/school2.png',
  //           'assets/images/school1.png',
  //           'assets/images/school3.png',
  //         ]
  //     )
  //
  // ),
];

/////////////////////////////////////Dormitoriess///////////////////////////

List<Dormitory> collegeDormitories = [

];

List<Dormitory> schoolDormitories = [

];

List<Dormitory> dormitories = [
  // Dormitory(
  //     title: 'Sassy',
  //     address: "Poprad Sakir Abo Street",
  //     distance: 11,
  //     image: 'assets/images/dorm1.png',
  //     public: true,
  //     details: DormitoryDetails(
  //         rent: 1000,
  //         meal: 794,
  //         description:
  //         "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae ",
  //         beds: 4,
  //         water: true,
  //         electricity: true,
  //         internet: true,
  //         coordinates: GeoPoint(33.722, 73.057),
  //         images: [
  //           'assets/images/dorm1.png',
  //           'assets/images/dorm2.png',
  //           'assets/images/dorm3.png'
  //         ]
  //     )
  // ),
  // Dormitory(
  //   title: 'Kessy',
  //   address: "Poprad Sakir Abo Street",
  //   distance: 11,
  //   image: 'assets/images/dorm2.png',
  //   public: false,
  //   details: DormitoryDetails(
  //       rent: 1000,
  //       meal: 794,
  //       description:
  //       "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae ",
  //       beds: 4,
  //       water: true,
  //       electricity: true,
  //       internet: true,
  //       coordinates: GeoPoint(33.6824, 72.9909),
  //       images: [
  //         'assets/images/dorm2.png',
  //         'assets/images/dorm1.png',
  //         'assets/images/dorm3.png'
  //       ]
  //   ),
  // ),
  // Dormitory(
  //     title: 'Lasaseds',
  //     address: "Poprad Sakir Abo Street",
  //     distance: 11,
  //     image: 'assets/images/dorm3.png',
  //     public: true,
  //     details: DormitoryDetails(
  //         rent: 1000,
  //         meal: 794,
  //         description:
  //         "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae ",
  //         beds: 4,
  //         water: true,
  //         electricity: true,
  //         internet: true,
  //         coordinates: GeoPoint(33.722, 73.057),
  //         images: [
  //           'assets/images/dorm3.png',
  //           'assets/images/dorm2.png',
  //           'assets/images/dorm1.png'
  //         ]
  //     ))
];
