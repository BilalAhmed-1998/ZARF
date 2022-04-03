// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarf/dummydata.dart';
import 'package:zarf/screens/ref_messages.dart';
import 'package:zarf/screens/ref_passport.dart';
import 'package:zarf/services/auth_service.dart';
import '../dormitory.dart';
import '../school.dart';
import 'app_user.dart';

class DatabaseCollection {
  String uid;

  var fireStore = FirebaseFirestore.instance;
  DatabaseCollection({this.uid});

  //Making firestore collection//

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference faqCollection =
      FirebaseFirestore.instance.collection("FAQs");
  final CollectionReference instituteCollection =
      FirebaseFirestore.instance.collection("Institutes");
  final CollectionReference dormitoryCollection = FirebaseFirestore.instance.collection("Dormitories");
  final CollectionReference ChatCollection =
      FirebaseFirestore.instance.collection("Chats");
  final CollectionReference checkoutCollection =
      FirebaseFirestore.instance.collection("Checkout");
  final CollectionReference invoiceCollection =
      FirebaseFirestore.instance.collection("Invoices");
  final CollectionReference seatsCollection =
      FirebaseFirestore.instance.collection("Seats");
  final CollectionReference DepartureCollection =
      FirebaseFirestore.instance.collection("Departure");

  ///////for checking SEATS available//////

  Future getSeats() async {
    dynamic value = await this.fireStore.collection("Seats").doc("seats").get();

    dynamic filledSeats = value["filled"];
    dynamic totalSeats = value["total"];
    dynamic showInApp = value["showInApp"];

    seatsLeft = totalSeats - filledSeats;
  }
  ///////data for checkout////////

  Future setCheckoutInstitutes(List<Institute> reservedInstitute) async {
    List<String> images = [];
    List<String> imagesAlt = [];
    for (int i = 0;
        i < reservedInstitute[0].institutedetails.images.length;
        i++) {
      images.add(await reservedInstitute[0].institutedetails.images[i]);
      imagesAlt.add(await reservedInstitute[1].institutedetails.images[i]);
    }

    await checkoutCollection.doc(FirebaseAuth.instance.currentUser.uid).set({
      "primarySchool": {
        "title": reservedInstitute[0].title,
        "category": reservedInstitute[0].category,
        "image": await reservedInstitute[0].image,
        "location": reservedInstitute[0].location,
        "public": reservedInstitute[0].public,
        "InstituteDetails": {
          "coordinates": reservedInstitute[0].institutedetails.coordinates,
          "institutetype": reservedInstitute[0].institutedetails.institutetype,
          "rating": reservedInstitute[0].institutedetails.rating,
          "tutionfee": reservedInstitute[0].institutedetails.tutionfee,
          "description": reservedInstitute[0].institutedetails.description,
          "TeachingPrograms": [
            {
              "title": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .title,
              "duration": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .duration,
              "specification": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .specification,
              "description": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .description,
              "careers": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .careers,
            },
          ],
          "images": images,
        },
      },
      "alternativeSchool": {
        "title": reservedInstitute[1].title,
        "category": reservedInstitute[1].category,
        "image": await reservedInstitute[0].image,
        "location": reservedInstitute[1].location,
        "public": reservedInstitute[1].public,
        "InstituteDetails": {
          "coordinates": reservedInstitute[1].institutedetails.coordinates,
          "institutetype": reservedInstitute[1].institutedetails.institutetype,
          "rating": reservedInstitute[1].institutedetails.rating,
          "tutionfee": reservedInstitute[1].institutedetails.tutionfee,
          "description": reservedInstitute[1].institutedetails.description,
          "TeachingPrograms": [
            {
              "title": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .title,
              "duration": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .duration,
              "specification": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .specification,
              "description": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .description,
              "careers": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .careers,
            },
          ],
          "images": imagesAlt,
        },
      },
    });
  }

  Future setCheckoutDorms(List<Dormitory> reservedDormitory) async {
    List<String> images = [];
    List<String> imagesAlt = [];
    for (int i = 0; i < reservedDormitory[0].details.images.length; i++) {
      images.add(await reservedDormitory[0].details.images[i]);
      imagesAlt.add(await reservedDormitory[1].details.images[i]);
    }

    await checkoutCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      "primaryDorm": {
        "title": reservedDormitory[0].title,
        "address": reservedDormitory[0].address,
        "distance": reservedDormitory[0].distance,
        "image": await reservedDormitory[0].image,
        "public": reservedDormitory[0].public,
        "details": {
          "rent": reservedDormitory[0].details.rent,
          "meal": reservedDormitory[0].details.meal,
          "description": reservedDormitory[0].details.description,
          "beds": reservedDormitory[0].details.beds,
          "water": reservedDormitory[0].details.water,
          "electricity": reservedDormitory[0].details.electricity,
          "internet": reservedDormitory[0].details.internet,
          "coordinates": reservedDormitory[0].details.coordinates,
          "images": images,
        }
      },
      "alternativeDorm": {
        "title": reservedDormitory[1].title,
        "address": reservedDormitory[1].address,
        "distance": reservedDormitory[1].distance,
        "image": await reservedDormitory[1].image,
        "public": reservedDormitory[1].public,
        "details": {
          "rent": reservedDormitory[1].details.rent,
          "meal": reservedDormitory[1].details.meal,
          "description": reservedDormitory[1].details.description,
          "beds": reservedDormitory[1].details.beds,
          "water": reservedDormitory[1].details.water,
          "electricity": reservedDormitory[1].details.electricity,
          "internet": reservedDormitory[1].details.internet,
          "coordinates": reservedDormitory[1].details.coordinates,
          "images": imagesAlt,
        }
      },
    });
  }

  Future setCheckoutData(List<Institute> reservedInstitute,
      List<Dormitory> reservedDormitory) async {
    await setCheckoutInstitutes(reservedInstitute);
    await setCheckoutDorms(reservedDormitory);
    await checkoutCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"invoice": null});
  }

  Future getCheckoutData(List<Institute> reservedInstitute,
      List<Dormitory> reservedDormitory) async {
    String s = "primary";
    await checkoutCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  for (int i = 0; i < 2; i++)
                    {
                      if (i > 0) {s = "alternative"},
                      reservedDormitory[i] = Dormitory(
                          title: value["${s}Dorm"]["title"],
                          address: value["${s}Dorm"]["address"],
                          distance: value["${s}Dorm"]["distance"],
                          image: value["${s}Dorm"]["image"],
                          public: value["${s}Dorm"]["public"],
                          details: DormitoryDetails(
                            rent: value["${s}Dorm"]["details"]["rent"],
                            meal: value["${s}Dorm"]["details"]["meal"],
                            description: value["${s}Dorm"]["details"]
                                ["description"],
                            beds: value["${s}Dorm"]["details"]["beds"],
                            water: value["${s}Dorm"]["details"]["water"],
                            electricity: value["${s}Dorm"]["details"]
                                ["electricity"],
                            internet: value["${s}Dorm"]["details"]["internet"],
                            coordinates: value["${s}Dorm"]["details"]
                                ["coordinates"],
                            images: value["${s}Dorm"]["details"]["images"],
                          )),
                      reservedInstitute[i] = Institute(
                          title: value["${s}School"]["title"],
                          category: value["${s}School"]["category"],
                          image: value["${s}School"]["image"],
                          location: value["${s}School"]["location"],
                          public: value["${s}School"]["public"],
                          institutedetails: InstituteDetails(
                            coordinates: value["${s}School"]["InstituteDetails"]
                                ["coordinates"],
                            images: value["${s}School"]["InstituteDetails"]
                                ["images"],
                            institutetype: value["${s}School"]
                                ["InstituteDetails"]["institutetype"],
                            rating: value["${s}School"]["InstituteDetails"]
                                ["rating"],
                            tutionfee: value["${s}School"]["InstituteDetails"]
                                ["tutionfee"],
                            description: value["${s}School"]["InstituteDetails"]
                                ["description"],
                            teachingprograms: [
                              TeachingPrograms(
                                title: value["${s}School"]["InstituteDetails"]
                                    ["TeachingPrograms"][0]["title"],
                                duration: value["${s}School"]
                                        ["InstituteDetails"]["TeachingPrograms"]
                                    [0]["duration"],
                                specification: value["${s}School"]
                                        ["InstituteDetails"]["TeachingPrograms"]
                                    [0]["specification"],
                                description: value["${s}School"]
                                        ["InstituteDetails"]["TeachingPrograms"]
                                    [0]["description"],
                                careers: value["${s}School"]["InstituteDetails"]
                                    ["TeachingPrograms"][0]["careers"],
                              ),
                            ],
                          )),
                    },
                  globalInvoiceID = value["invoice"],
                }
              else
                {}
            });
  }

  Future<double> getDiscount(String code) async {
    double discount;
    await FirebaseFirestore.instance
        .collection("Discounts")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var i = 0; i < value.docs.length; i++) {
          final dis = value.docs[i];
          if (dis["code"] == code &&
              dis["count"] > 0 &&
              dis['validity'].toDate().compareTo(DateTime.now()) > 0) {
            discount = double.parse(dis["sum"]);
          }
        }
      }
    });
    return discount;
  }

  Future decrementDiscountCounter(String code) async {
    String doc;
    await FirebaseFirestore.instance
        .collection("Discounts")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var i = 0; i < value.docs.length; i++) {
          final dis = value.docs[i];
          if (dis["code"] == code) {
            doc = value.docs[i].id;
          }
        }
      }
    });
    await FirebaseFirestore.instance.collection("Discounts").doc(doc).update({
      "count": FieldValue.increment(-1),
    });
  }
  /////////chats///////////////////////////////////

  Future setChats() async {
    final admin = await FirebaseFirestore.instance
        .collection("Admin")
        .get()
        .then((value) => value.docs[0].id);
    await ChatCollection.doc(FirebaseAuth.instance.currentUser.uid)
        .set({
          'Messages': FieldValue.arrayUnion([]),
          'star': false,
          'flag': admin,
        }) // <-- Add data
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
  }

  Future<String> ChatPhotoUpload(var myimage, String s) async {
    var rng = Random();

    final ref = FirebaseStorage.instance.ref().child('userimages').child(
        FirebaseAuth.instance.currentUser.uid +
            '_' +
            rng.nextInt(999999).toString());
    dynamic uploadTask = await ref.putFile(myimage);

    String url = await ref.getDownloadURL();
    dbMain.updateChats(url);
    return url;
  }

  Future updateChats(String msg) async {
    await ChatCollection.doc(FirebaseAuth.instance.currentUser.uid)
        .update({
          'Messages': FieldValue.arrayUnion([
            {
              if (msg.contains("https://firebasestorage.googleapis.com"))
                "user" + DateTime.now().toString() + "file": msg
              else
                "user" + DateTime.now().toString(): msg
            }
          ])
        }) // <-- Add data
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
  }

  Future updateChatsAdmin(String msg) async {
    await ChatCollection.doc(FirebaseAuth.instance.currentUser.uid)
        .update({
          'Messages': FieldValue.arrayUnion([
            {"admin" + DateTime.now().toString(): msg}
          ])
        }) // <-- Add data
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
  }

  Future<String> ChatDocUpload(var doc) async {
    var rng = Random();

    final ref = FirebaseStorage.instance.ref().child('userDocs').child(
        FirebaseAuth.instance.currentUser.uid +
            '_' +
            rng.nextInt(999999).toString());
    dynamic uploadTask = await ref.putFile(doc);

    String url = await ref.getDownloadURL();
    dbMain.updateChats(url);
    return url;
  }

  Future getChats() async {
    var docs =
        await ChatCollection.doc(FirebaseAuth.instance.currentUser.uid).get();

    List<dynamic> chats = docs["Messages"];
    messages.clear();

    for (var i = 0; i < chats.length; i++) {
      if (chats[i].keys.elementAt(0).contains("user")) {
        messages.add(ChatMessage(
            messageContent: chats[i].values.elementAt(0),
            messageType: "sender"));
      } else if (chats[i].keys.elementAt(0).contains("admin")) {
        messages.add(ChatMessage(
            messageContent: chats[i].values.elementAt(0),
            messageType: "receiver"));
      }
    }

    for (var i = 0; i < chats.length; i++) {
      if (chats[i].keys.elementAt(0).contains("user")) {
        if (chats[i].values.elementAt(0).contains("userDocs")) {
          var completePath = await getPath(chats[i].values.elementAt(0));
          var fileName = (completePath.split('/').last);
          messages[i].messagePath = fileName;
        }
      }
    }
  }

  Future getDate() async {
    bool check = true;
    final date = await DepartureCollection.get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var i = 0; i < value.docs.length; i++) {
          final dep = value.docs[i];
          for (var j = 0; j < dep["participants"].length; j++) {
            if (dep["participants"][j]["id"] ==
                FirebaseAuth.instance.currentUser.uid) {
              check = false;
              departureText=dep["text"];
              return dep["date"].toDate();
            }
          }
        }
      } else {
        print("departure docs empty");
      }
    });
    //print("Dateeeeeeeeeeeeee");
    //print(date.toDate());
    final temp = DateTime.now();
    if (check)
      return DateTime(
          temp.year-1, 1, 1);
    else
      return date;
  }

  Future updatePaths(String link, String msg) async {
    await ChatCollection.doc(FirebaseAuth.instance.currentUser.uid)
        .update({
          'Paths': FieldValue.arrayUnion([
            {link: msg}
          ])
        }) // <-- Add data
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
  }

  Future<String> getPath(String link) async {
    var docs =
        await ChatCollection.doc(FirebaseAuth.instance.currentUser.uid).get();

    List<dynamic> chats = docs["Paths"];

    for (var i = 0; i < chats.length; i++) {
      if (chats[i].keys.elementAt(0).contains(link)) {
        return chats[i].values.elementAt(0);
      }
    }
  }

  ///////////////////////Dormitories from firebase//////////////////

  Future updateDormitories() async {
    for (var i = 0; i < dormitories.length; i++) {
      await dormitoryCollection.doc("School Dormitories").update({
        "dormitory${i + 1}": {
          "title": dormitories[i].title,
          "address": dormitories[i].address,
          "distance": dormitories[i].distance,
          "image": "assets/dormitories/dormitory${i + 1}/dorm1.png",
          "public": dormitories[i].public,
          "details": {
            "rent": dormitories[i].details.rent,
            "meal": dormitories[i].details.meal,
            "description": dormitories[i].details.description,
            "beds": dormitories[i].details.beds,
            "water": dormitories[i].details.water,
            "electricity": dormitories[i].details.electricity,
            "internet": dormitories[i].details.internet,
            "coordinates": dormitories[i].details.coordinates,
            "images": [
              "assets/dormitories/dormitory${i + 1}/dorm1.png",
              "assets/dormitories/dormitory${i + 1}/dorm2.png",
              "assets/dormitories/dormitory${i + 1}/dorm3.png",
            ]
          }
        }
      });
    }
  }

  Future getCollegeDormitories() async {
    await this
        .fireStore
        .collection("Dormitories")
        .doc("College Dormitories")
        .get()
        .then((value) => {
              if (value.exists)
                {
                  for (var i = 0; i < value.data().length; i++)
                    {
                      dormitories.add(Dormitory(
                          title: value[value.data().keys.elementAt(i)]["title"],
                          address: value[value.data().keys.elementAt(i)]["address"],
                          distance: value[value.data().keys.elementAt(i)]["distance"],
                          image: value[value.data().keys.elementAt(i)]["image"],
                          public: value[value.data().keys.elementAt(i)]["public"],
                          details: DormitoryDetails(
                            rent: value[value.data().keys.elementAt(i)]["details"]["rent"]
                                        .runtimeType !=
                                    double
                                ? value[value.data().keys.elementAt(i)]["details"]["rent"]
                                    .toDouble()
                                : value[value.data().keys.elementAt(i)]["details"]["rent"],
                            meal: value[value.data().keys.elementAt(i)]["details"]["meal"]
                                        .runtimeType !=
                                    double
                                ? value[value.data().keys.elementAt(i)]["details"]["meal"]
                                    .toDouble()
                                : value[value.data().keys.elementAt(i)]["details"]["meal"],
                            description: value[value.data().keys.elementAt(i)]["details"]
                                ["description"],
                            beds: value[value.data().keys.elementAt(i)]["details"]["beds"]
                                        .runtimeType !=
                                    int
                                ? int.parse(value[value.data().keys.elementAt(i)]
                                    ["details"]["beds"])
                                : value[value.data().keys.elementAt(i)]["details"]["beds"],
                            water: value[value.data().keys.elementAt(i)]["details"]
                                ["water"],
                            electricity: value[value.data().keys.elementAt(i)]["details"]
                                ["electricity"],
                            internet: value[value.data().keys.elementAt(i)]["details"]
                                ["internet"],
                            coordinates: value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"].runtimeType==GeoPoint?value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]:GeoPoint(value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]["Latitude"],value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]["Longitude"]),
                            images: value[value.data().keys.elementAt(i)]["details"]
                                ["images"],
                          ))),
                    }
                }
              else
                {}
            });

    for (var i = 0; i < dormitories.length; i++) {
      for (var j = 0; j < dormitories[i].details.images.length; j++) {
        dormitories[i].details.images[j] =
            downloadURL(dormitories[i].details.images[j]);
      }
      dormitories[i].image = dormitories[i].details.images[0];
    }
  }

  Future getSchoolDormitories() async {
    await this
        .fireStore
        .collection("Dormitories")
        .doc("School Dormitories")
        .get()
        .then((value) => {
              if (value.exists)
                {
                  for (var i = 0; i < value.data().length; i++)
                    {
                      dormitories.add(Dormitory(
                          title: value[value.data().keys.elementAt(i)]["title"],
                          address: value[value.data().keys.elementAt(i)]["address"],
                          distance: value[value.data().keys.elementAt(i)]["distance"],
                          image: value[value.data().keys.elementAt(i)]["image"],
                          public: value[value.data().keys.elementAt(i)]["public"],
                          details: DormitoryDetails(
                            rent: value[value.data().keys.elementAt(i)]["details"]["rent"]
                                        .runtimeType !=
                                    double
                                ? value[value.data().keys.elementAt(i)]["details"]["rent"]
                                    .toDouble()
                                : value[value.data().keys.elementAt(i)]["details"]["rent"],
                            meal: value[value.data().keys.elementAt(i)]["details"]["meal"]
                                        .runtimeType !=
                                    double
                                ? value[value.data().keys.elementAt(i)]["details"]["meal"]
                                    .toDouble()
                                : value[value.data().keys.elementAt(i)]["details"]["meal"],
                            description: value[value.data().keys.elementAt(i)]["details"]
                                ["description"],
                            beds: value[value.data().keys.elementAt(i)]["details"]["beds"]
                                        .runtimeType !=
                                    int
                                ? int.parse(value[value.data().keys.elementAt(i)]
                                    ["details"]["beds"])
                                : value[value.data().keys.elementAt(i)]["details"]["beds"],
                            water: value[value.data().keys.elementAt(i)]["details"]
                                ["water"],
                            electricity: value[value.data().keys.elementAt(i)]["details"]
                                ["electricity"],
                            internet: value[value.data().keys.elementAt(i)]["details"]
                                ["internet"],
                            coordinates: value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"].runtimeType==GeoPoint?value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]:GeoPoint(value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]["Latitude"],value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]["Longitude"]),
                            images: value[value.data().keys.elementAt(i)]["details"]
                                ["images"],
                          ))),
                    }
                }
              else
                {}
            });

    for (var i = 0; i < dormitories.length; i++) {
      for (var j = 0; j < dormitories[i].details.images.length; j++) {
        dormitories[i].details.images[j] =
            downloadURL(dormitories[i].details.images[j]);
      }
      dormitories[i].image = dormitories[i].details.images[0];
    }
  }

  Future getDormitories() async {
    await this
        .fireStore
        .collection("Dormitories")
        .doc("Dormitories")
        .get()
        .then((value) => {
              if (value.exists)
                {
                  for (var i = 0; i < value.data().length; i++)
                    {
                      dormitories.add(Dormitory(
                          title: value[value.data().keys.elementAt(i)]["title"],
                          address: value[value.data().keys.elementAt(i)]["address"],
                          distance: value[value.data().keys.elementAt(i)]["distance"],
                          image: value[value.data().keys.elementAt(i)]["image"],
                          public: value[value.data().keys.elementAt(i)]["public"],
                          details: DormitoryDetails(
                            rent: value[value.data().keys.elementAt(i)]["details"]["rent"]
                                        .runtimeType !=
                                    double
                                ? value[value.data().keys.elementAt(i)]["details"]["rent"]
                                    .toDouble()
                                : value[value.data().keys.elementAt(i)]["details"]["rent"],
                            meal: value[value.data().keys.elementAt(i)]["details"]["meal"]
                                        .runtimeType !=
                                    double
                                ? value[value.data().keys.elementAt(i)]["details"]["meal"]
                                    .toDouble()
                                : value[value.data().keys.elementAt(i)]["details"]["meal"],
                            description: value[value.data().keys.elementAt(i)]["details"]
                                ["description"],
                            beds: value[value.data().keys.elementAt(i)]["details"]["beds"]
                                        .runtimeType !=
                                    int
                                ? int.parse(value[value.data().keys.elementAt(i)]
                                    ["details"]["beds"])
                                : value[value.data().keys.elementAt(i)]["details"]["beds"],
                            water: value[value.data().keys.elementAt(i)]["details"]
                                ["water"],
                            electricity: value[value.data().keys.elementAt(i)]["details"]
                                ["electricity"],
                            internet: value[value.data().keys.elementAt(i)]["details"]
                                ["internet"],
                            coordinates: value[value.data().keys.elementAt(i)]["details"]
                                ["coordinates"].runtimeType==GeoPoint?value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]:GeoPoint(value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]["Latitude"],value[value.data().keys.elementAt(i)]["details"]
                            ["coordinates"]["Longitude"]),
                            images: value[value.data().keys.elementAt(i)]["details"]
                                ["images"],
                          ))),
                    }
                }
              else
                {}
            });

    for (var i = 0; i < dormitories.length; i++) {
      for (var j = 0; j < dormitories[i].details.images.length; j++) {
        dormitories[i].details.images[j] =
            downloadURL(dormitories[i].details.images[j]);
      }
      dormitories[i].image = dormitories[i].details.images[0];
    }
  }

  ////////////////////Institutes from Firebase///////////////////////////
  Future updateInstitutes() async {
    for (var i = 0; i < Allinstitutes.length; i++) {
      await instituteCollection.doc("HighSchools").update({
        "institute${i + 1}": {
          "title": Allinstitutes[i].title,
          "category": Allinstitutes[i].category,
          "image": "assets/institutes/institute${i + 1}/school1.png",
          "location": Allinstitutes[i].location,
          "public": Allinstitutes[i].public,
          "InstituteDetails": {
            "coordinates": Allinstitutes[i].institutedetails.coordinates,
            "institutetype": Allinstitutes[i].institutedetails.institutetype,
            "rating": Allinstitutes[i].institutedetails.rating,
            "tutionfee": Allinstitutes[i].institutedetails.tutionfee,
            "description":
                "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
            "TeachingPrograms": [
              {
                "title": "Nursing",
                "duration": "2",
                "specification": "Medical Science",
                "description":
                    "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                "careers": [
                  {"job": "Dentist", "max": "2000", "min": "1000"},
                  {"job": "Surgery", "max": "3000", "min": "2000"},
                  {"job": "Neurolab", "max": "4000", "min": "3000"},
                ]
              },
              {
                "title": "Technology",
                "duration": "2",
                "specification": "Medical Science",
                "description":
                    "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                // "careers": {
                //   "Dentist": "1000-2000",
                //   "Surgery": "2000-3000",
                //   "Neurolab": "4000-5000",
                // }
                "careers": [
                  {"job": "Dentist", "max": "2000", "min": "1000"},
                  {"job": "Surgery", "max": "3000", "min": "2000"},
                  {"job": "Neurolab", "max": "4000", "min": "3000"},
                ]
              },
              {
                "title": "Banking",
                "duration": "2",
                "specification": "Medical Science",
                "description":
                    "Lorem ipsum dolor sit amet, consectetur adipicing elit. Auctor suspendisse vitae, id risus morbi eget. Ornare habitasse cursus libero vitae dignissim sit velit, erat. Neque tempor, vivamus purus amet orci risus nibh ut donec. Elit lacus. dignissim Ornare habitasse cursus libero",
                "careers": [
                  {"job": "Dentist", "max": "2000", "min": "1000"},
                  {"job": "Surgery", "max": "3000", "min": "2000"},
                  {"job": "Neurolab", "max": "4000", "min": "3000"},
                ]
              }
            ],
            "images": [
              'assets/institutes/institute${i + 1}/school2.png',
              'assets/institutes/institute${i + 1}/school1.png',
              'assets/institutes/institute${i + 1}/school3.png',
            ],
          }
        }
      });
    }
  }

  Future getInstitutes(String str) async {

    
      

    await this
        .fireStore
        .collection("Institutes")
        .doc(str)
        .get()
        .then((value) {
      if (value.exists) {
        for (var i = 0; i < value.data().length; i++) {
          Allinstitutes.add(Institute(
              title: value[value.data().keys.elementAt(i)]["title"],
              category: value[value.data().keys.elementAt(i)]["category"],
              image: value[value.data().keys.elementAt(i)]["image"],
              location: value[value.data().keys.elementAt(i)]["location"],
              public: value[value.data().keys.elementAt(i)]["public"],
              institutedetails: InstituteDetails(
                coordinates: value[value.data().keys.elementAt(i)]
                    ["InstituteDetails"]["coordinates"].runtimeType==GeoPoint?value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["coordinates"]:GeoPoint(value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"],value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"]),
                images: value[value.data().keys.elementAt(i)]
                    ["InstituteDetails"]["images"],
                institutetype: value[value.data().keys.elementAt(i)]
                    ["InstituteDetails"]["institutetype"],
                rating: value[value.data().keys.elementAt(i)]
                    ["InstituteDetails"]["rating"],
                tutionfee: value[value.data().keys.elementAt(i)]
                    ["InstituteDetails"]["tutionfee"],
                description: value[value.data().keys.elementAt(i)]
                    ["InstituteDetails"]["description"],
                teachingprograms: [
                  for (var j = 0;
                      j <
                          value[value.data().keys.elementAt(i)]
                                  ["InstituteDetails"]["TeachingPrograms"]
                              .length;
                      j++)
                    TeachingPrograms(
                      title: value[value.data().keys.elementAt(i)]
                          ["InstituteDetails"]["TeachingPrograms"][j]["title"],
                      duration: value[value.data().keys.elementAt(i)]
                              ["InstituteDetails"]["TeachingPrograms"][j]
                          ["duration"],
                      specification: value[value.data().keys.elementAt(i)]
                              ["InstituteDetails"]["TeachingPrograms"][j]
                          ["specification"],
                      description: value[value.data().keys.elementAt(i)]
                              ["InstituteDetails"]["TeachingPrograms"][j]
                          ["description"],
                      careers: value[value.data().keys.elementAt(i)]
                              ["InstituteDetails"]["TeachingPrograms"][j]
                          ["careers"],
                    ),
                ],
              )));
        }
      } else {
        print("NOPPP!!");
      }
    });

    for (var i = 0; i < Allinstitutes.length; i++) {
      for (var j = 0;
          j < Allinstitutes[i].institutedetails.images.length;
          j++) {
        Allinstitutes[i].institutedetails.images[j] =
            downloadURL(Allinstitutes[i].institutedetails.images[j]);
      }
      Allinstitutes[i].image = Allinstitutes[i].institutedetails.images[0];
    }

    //organizing all data of institutes/////
  }
  Future getPopularandTopInstitutes(String str) async {


    await this
        .fireStore
        .collection("Institutes")
        .doc(str)
        .get()
        .then((value) {
      if (value.exists) {
        for (var i = 0; i < value.data().length; i++) {
         if(str.contains("Popular")){
           PopularSchools.add(Institute(
               title: value[value.data().keys.elementAt(i)]["title"],
               category: value[value.data().keys.elementAt(i)]["category"],
               image: value[value.data().keys.elementAt(i)]["image"],
               location: value[value.data().keys.elementAt(i)]["location"],
               public: value[value.data().keys.elementAt(i)]["public"],
               institutedetails: InstituteDetails(
                 coordinates: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"].runtimeType==GeoPoint?value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"]:GeoPoint(value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"],value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"]),
                 images: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["images"],
                 institutetype: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["institutetype"],
                 rating: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["rating"],
                 tutionfee: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["tutionfee"],
                 description: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["description"],
                 teachingprograms: [
                   for (var j = 0;
                   j <
                       value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"]
                           .length;
                   j++)
                     TeachingPrograms(
                       title: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]["title"],
                       duration: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["duration"],
                       specification: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["specification"],
                       description: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["description"],
                       careers: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["careers"],
                     ),
                 ],
               )));
         }else{
           TopSchools.add(Institute(
               title: value[value.data().keys.elementAt(i)]["title"],
               category: value[value.data().keys.elementAt(i)]["category"],
               image: value[value.data().keys.elementAt(i)]["image"],
               location: value[value.data().keys.elementAt(i)]["location"],
               public: value[value.data().keys.elementAt(i)]["public"],
               institutedetails: InstituteDetails(
                 coordinates: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"].runtimeType==GeoPoint?value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"]:GeoPoint(value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"],value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"]),
                 images: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["images"],
                 institutetype: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["institutetype"],
                 rating: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["rating"],
                 tutionfee: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["tutionfee"],
                 description: value[value.data().keys.elementAt(i)]
                 ["InstituteDetails"]["description"],
                 teachingprograms: [
                   for (var j = 0;
                   j <
                       value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"]
                           .length;
                   j++)
                     TeachingPrograms(
                       title: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]["title"],
                       duration: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["duration"],
                       specification: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["specification"],
                       description: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["description"],
                       careers: value[value.data().keys.elementAt(i)]
                       ["InstituteDetails"]["TeachingPrograms"][j]
                       ["careers"],
                     ),
                 ],
               )));
         }

        }
      } else {
        print("nopp");
      }
    });
    if(str.contains("Popular")){
      for (var i = 0; i < PopularSchools.length; i++) {
        for (var j = 0;
        j < PopularSchools[i].institutedetails.images.length;
        j++) {
          PopularSchools[i].institutedetails.images[j] =
              downloadURL(PopularSchools[i].institutedetails.images[j]);
        }
        PopularSchools[i].image = PopularSchools[i].institutedetails.images[0];
      }
    }else{
      for (var i = 0; i < TopSchools.length; i++) {
        for (var j = 0;
        j < TopSchools[i].institutedetails.images.length;
        j++) {
          TopSchools[i].institutedetails.images[j] =
              downloadURL(TopSchools[i].institutedetails.images[j]);
        }
        TopSchools[i].image = TopSchools[i].institutedetails.images[0];
      }
    }


    //organizing all data of institutes/////
  }
  Future getTopInstitutes() async {
    await this
        .fireStore
        .collection("Institutes")
        .doc("Top Schools")
        .get()
        .then((value) {
      if (value.exists) {
        for (var i = 0; i < value.data().length; i++) {
          Allinstitutes.add(Institute(
              title: value[value.data().keys.elementAt(i)]["title"],
              category: value[value.data().keys.elementAt(i)]["category"],
              image: value[value.data().keys.elementAt(i)]["image"],
              location: value[value.data().keys.elementAt(i)]["location"],
              public: value[value.data().keys.elementAt(i)]["public"],
              institutedetails: InstituteDetails(
                coordinates: value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["coordinates"].runtimeType==GeoPoint?value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["coordinates"]:GeoPoint(value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"],value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["coordinates"]["Latitude"]["Longitude"]),
                images: value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["images"],
                institutetype: value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["institutetype"],
                rating: value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["rating"],
                tutionfee: value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["tutionfee"],
                description: value[value.data().keys.elementAt(i)]
                ["InstituteDetails"]["description"],
                teachingprograms: [
                  for (var j = 0;
                  j <
                      value[value.data().keys.elementAt(i)]
                      ["InstituteDetails"]["TeachingPrograms"]
                          .length;
                  j++)
                    TeachingPrograms(
                      title: value[value.data().keys.elementAt(i)]
                      ["InstituteDetails"]["TeachingPrograms"][j]["title"],
                      duration: value[value.data().keys.elementAt(i)]
                      ["InstituteDetails"]["TeachingPrograms"][j]
                      ["duration"],
                      specification: value[value.data().keys.elementAt(i)]
                      ["InstituteDetails"]["TeachingPrograms"][j]
                      ["specification"],
                      description: value[value.data().keys.elementAt(i)]
                      ["InstituteDetails"]["TeachingPrograms"][j]
                      ["description"],
                      careers: value[value.data().keys.elementAt(i)]
                      ["InstituteDetails"]["TeachingPrograms"][j]
                      ["careers"],
                    ),
                ],
              )));
        }
      } else {
        print("NOPPP!!");
      }
    });

    for (var i = 0; i < Allinstitutes.length; i++) {
      for (var j = 0;
      j < Allinstitutes[i].institutedetails.images.length;
      j++) {
        Allinstitutes[i].institutedetails.images[j] =
            downloadURL(Allinstitutes[i].institutedetails.images[j]);
      }
      Allinstitutes[i].image = Allinstitutes[i].institutedetails.images[0];
    }

    //organizing all data of institutes/////
  }

  //////////////////////Referral/////////////////////////////////
  Future<bool> checkExist(String docID) async {
    bool exist;
    try {
      await userCollection.doc(docID).get().then((doc) {
        exist = doc.exists;
      });
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }

  Future leaderBoard() async {
    QuerySnapshot snapshot = await userCollection
        .orderBy('numFriends', descending: true)
        .limit(5)
        .get();

    snapshot.docs.forEach((document) {
      Map<String, dynamic> data = document.data();
      leaders.add({
        'fullName': data['userData']['fullName'],
        'numFriends': data['numFriends']
      });
      //print(leaders);
      // _rankingResult.sort((a, b) => b.rating.compareTo(a.rating));
    });
  }

  Future updateFriends(String docID) async {
    List<dynamic> friendList;
    await userCollection.doc(docID).get().then((value) {
      friendList = value["friends"];
    });
    print(friendList);
    if (!friendList.contains(globalUser.uid)) {
      await userCollection.doc(docID).update({
        "numFriends": FieldValue.increment(1),
        "friends": FieldValue.arrayUnion([globalUser.uid]),
        "Referrals.referralEarnings": FieldValue.increment(100),
      });
    }
    //remove if refferal works fine
    // await userCollection.doc(docID).update({
    //   'friends': FieldValue.arrayUnion([globalUser.uid]),
    // });
  }

  //also sets friends list
  Future setParentsData(Signee _signee, int payment, double discount,
      double summary, List<double> plan) async {
    await userCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      "parentsData": {
        "name": _signee.name,
        "surname": _signee.surname,
        "birthDate": _signee.birthDate,
        "address": _signee.address,
        "city": _signee.city,
        "country": _signee.country,
        "taxpayerNumber": _signee.taxNumber,
      },
      "Referrals": {
        "referralEarnings": 0,
        "referralCode": globalUser.uid,
      },
      "friends": [],
      "numFriends": 0,
      "numPayments": payment,
      "discount": discount,
      "summaryTotal": summary,
      "payments": plan,
      "primarySchool": {
        "title": reservedInstitute[0].title,
        "category": reservedInstitute[0].category,
        "location": reservedInstitute[0].location,
        "public": reservedInstitute[0].public,
        "InstituteDetails": {
          "coordinates": reservedInstitute[0].institutedetails.coordinates,
          "institutetype": reservedInstitute[0].institutedetails.institutetype,
          "rating": reservedInstitute[0].institutedetails.rating,
          "tutionfee": reservedInstitute[0].institutedetails.tutionfee,
          "description": reservedInstitute[0].institutedetails.description,
          "TeachingPrograms": [
            {
              "title": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .title,
              "duration": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .duration,
              "specification": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .specification,
              "description": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .description,
              "careers": reservedInstitute[0]
                  .institutedetails
                  .teachingprograms[0]
                  .careers,
            },
          ],
        },
      },
      "alternativeSchool": {
        "title": reservedInstitute[1].title,
        "category": reservedInstitute[1].category,
        "location": reservedInstitute[1].location,
        "public": reservedInstitute[1].public,
        "InstituteDetails": {
          "coordinates": reservedInstitute[1].institutedetails.coordinates,
          "institutetype": reservedInstitute[1].institutedetails.institutetype,
          "rating": reservedInstitute[1].institutedetails.rating,
          "tutionfee": reservedInstitute[1].institutedetails.tutionfee,
          "description": reservedInstitute[1].institutedetails.description,
          "TeachingPrograms": [
            {
              "title": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .title,
              "duration": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .duration,
              "specification": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .specification,
              "description": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .description,
              "careers": reservedInstitute[1]
                  .institutedetails
                  .teachingprograms[0]
                  .careers,
            },
          ],
        },
      },
      "primaryDorm": {
        "title": reservedDormitory[0].title,
        "address": reservedDormitory[0].address,
        "distance": reservedDormitory[0].distance,
        "public": reservedDormitory[0].public,
        "details": {
          "rent": reservedDormitory[0].details.rent,
          "meal": reservedDormitory[0].details.meal,
          "description": reservedDormitory[0].details.description,
          "beds": reservedDormitory[0].details.beds,
          "water": reservedDormitory[0].details.water,
          "electricity": reservedDormitory[0].details.electricity,
          "internet": reservedDormitory[0].details.internet,
          "coordinates": reservedDormitory[0].details.coordinates,
        }
      },
      "alternativeDorm": {
        "title": reservedDormitory[1].title,
        "address": reservedDormitory[1].address,
        "distance": reservedDormitory[1].distance,
        "public": reservedDormitory[1].public,
        "details": {
          "rent": reservedDormitory[1].details.rent,
          "meal": reservedDormitory[1].details.meal,
          "description": reservedDormitory[1].details.description,
          "beds": reservedDormitory[1].details.beds,
          "water": reservedDormitory[1].details.water,
          "electricity": reservedDormitory[1].details.electricity,
          "internet": reservedDormitory[1].details.internet,
          "coordinates": reservedDormitory[1].details.coordinates,
        }
      },
    });
  }

  Future<String> getName() async {
    dynamic name;
    //print(await FirebaseMessaging.instance.getToken());
    //print("********");
    await userCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      name = value["userData"]["fullName"];
    });
    return name;
  }

  Future getUserData() async {
    // DateTime parseTime(dynamic date) {
    //   return Platform.isIOS ? (date as Timestamp).toDate() : (date as DateTime);
    // }

    UserSignupData _user = UserSignupData();
    Signee signee = Signee();
    Referral ref = Referral();
    globalUser = app_user();
    dynamic value =
        await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    globalUser.uid = FirebaseAuth.instance.currentUser.uid;

    _user.fullName = value["userData"]["fullName"];
    _user.phone = value["userData"]["phone"];
    _user.email = value["userData"]["email"];
    _user.gender = value["userData"]["gender"];
    _user.address = value["userData"]["address"];
    _user.currentSchool = value["userData"]["currenSchool"];
    _user.birthDate = value["userData"]["birthDate"].toDate();
    _user.password = value["userData"]["password"];
    globalisUniversity = value["userData"]["University"];
    globalUser.userData = _user;
    signee.name = value["parentsData"]["name"];
    signee.surname = value["parentsData"]["surname"];
    signee.birthDate = value["parentsData"]["birthDate"] != null
        ? value["parentsData"]["birthDate"].toDate()
        : null;
    signee.address = value["parentsData"]["address"];
    signee.city = value["parentsData"]["city"];
    signee.country = value["parentsData"]["country"];
    signee.taxNumber = value["parentsData"]["taxpayerNumber"];
    globalUser.signee = signee;
    ref.referralCode = value["Referrals"]["referralCode"];
    ref.refEarnings = value["Referrals"]["referralEarnings"];
    globalUser.ref = ref;
    globalnumPayments = value["numPayments"];
    globalDiscount = value["discount"];
    globalsummary = value["summaryTotal"];
    globalPlan = value["payments"];
    globalPrimarySchool = value["primarySchool"]["title"];
    globalAlternativeSchool = value["alternativeSchool"]["title"];
    globalInvoiceID=value["invoice"];
  }

  ///////////// invoice //////////////////
  Future setInvoice(String id) async {
    globalInvoiceID = id;
    await invoiceCollection.doc(FirebaseAuth.instance.currentUser.uid).set({
      "clientNo": id,
      "date": DateTime.now(),
      "error": "",
      "image": "",
      "verified": false,
    });
    await checkoutCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"invoice": id});
    await userCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"invoice": id});
  }

  Future getInvoiceData() async {
    await invoiceCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      globalInvoiceError = value["error"];
      globalInvoiceImage = value["image"];
      globalInvoiceVerify = value["verified"];
      globalContractDate = value["date"].toDate();

      return;
    });
  }

  Future updateInvoice(var myimage) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('screenshots')
        .child(FirebaseAuth.instance.currentUser.uid + "proof");
    UploadTask task = ref.putFile(myimage);
    TaskSnapshot sn = await task;

    String url = await sn.ref.getDownloadURL();
    await invoiceCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      "image": url,
    });
  }

  Future<double> documentUpload(var myimage, String s) async {
    String url;
    final ref = FirebaseStorage.instance
        .ref()
        .child('userimages')
        .child(FirebaseAuth.instance.currentUser.uid + '_' + s);
    UploadTask task = ref.putFile(myimage);
    TaskSnapshot sn = await task;

    url = await sn.ref.getDownloadURL();
    await userCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      "OnlineDocuments.$s": url,
      "OnlineDocuments.status$s": true,
    });
    await FirebaseFirestore.instance
        .collection("OnlineDocuments")
        .doc(FirebaseAuth.instance.currentUser.uid + s)
        .update({
      "link":url,
      "submitted":true,
    });

    task.snapshotEvents.listen((snapshot) {
      print('Task state: ${snapshot.state}');
      print("Progress:${(snapshot.bytesTransferred)}");
      print(
          'Progress total: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      if (snapshot.bytesTransferred == snapshot.totalBytes) return 1;
    }, onError: (e) {
      // The final snapshot is also available on the task via `.snapshot`,
      // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
      print(task.snapshot);

      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    });
  }

  Future getDocuments() async {
    await userCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      passportImage = value["OnlineDocuments"]["Passport"];
      passportApproved = value["OnlineDocuments"]["passportApproved"];
      reportCard8Image = value["OnlineDocuments"]["reportCard8th"];
      report8Approved = value["OnlineDocuments"]["reportCard8thApproved"];
      HalfReportcard9image = value["OnlineDocuments"]["HalfReportCard9th"];
      HalfReport9Approved =
          value["OnlineDocuments"]["HalfReportCard9thApproved"];

      reportCard9Image = value["OnlineDocuments"]["reportCard9th"];
      report9Approved = value["OnlineDocuments"]["reportCard9thApproved"];
      reportCard10Image = value["OnlineDocuments"]["reportCard10th"];
      report10Approved = value["OnlineDocuments"]["reportCard10thApproved"];
      HalfReportCard11Image = value["OnlineDocuments"]["HalfReportCard11th"];
      HalfReport11Approved =
          value["OnlineDocuments"]["HalfReportCard11thApproved"];

      offlineReport8Approved = value["OfflineDocuments"]["Report8Approved"];
      offlineHalfReport9Approved =
          value["OfflineDocuments"]["HalfReport9Approved"];
      offlineBirthCertificateApproved =
          value["OfflineDocuments"]["BirthCertificateApproved"];
      offlinePRCertificateApproved =
          value["OfflineDocuments"]["PRCertificateApproved"];
      offlineUkrainianPassportApproved =
          value["OfflineDocuments"]["UkrainianPassportApproved"];
      offlineCRCertificateApproved =
          value["OfflineDocuments"]["CRCertificateApproved"];
      offlinePhotosApproved = value["OfflineDocuments"]["PhotosApproved"];
      offlineDiplomaApproved = value["OfflineDocuments"]["DiplomaApproved"];
      offlineComReport9Approved =
          value["OfflineDocuments"]["ComReport9Approved"];

      offlineReport9Approved = value["OfflineDocuments"]["Report9Approved"];
      offlineReport10Approved = value["OfflineDocuments"]["Report10Approved"];
      offlineHalfReport11Approved =
          value["OfflineDocuments"]["HalfReport11Approved"];
      offlineComReport11Approved =
          value["OfflineDocuments"]["ComReport11Approved"];

      offlineReport8Received = value["OfflineDocuments"]["Report8Received"];
      offlineHalfReport9Received =
          value["OfflineDocuments"]["HalfReport9Received"];
      offlineBirthCertificateReceived =
          value["OfflineDocuments"]["BirthCertificateReceived"];
      offlinePRCertificateReceived =
          value["OfflineDocuments"]["PRCertificateReceived"];
      offlineUkrainianPassportReceived =
          value["OfflineDocuments"]["UkrainianPassportReceived"];
      offlineCRCertificateReceived =
          value["OfflineDocuments"]["CRCertificateReceived"];
      offlinePhotosReceived = value["OfflineDocuments"]["PhotosReceived"];
      offlineDiplomaReceived = value["OfflineDocuments"]["DiplomaReceived"];
      offlineComReport9Received =
          value["OfflineDocuments"]["ComReport9Received"];

      offlineReport9Received = value["OfflineDocuments"]["Report9Received"];
      offlineReport10Received = value["OfflineDocuments"]["Report10Received"];
      offlineHalfReport11Received =
          value["OfflineDocuments"]["HalfReport11Received"];
      offlineComReport11Received =
          value["OfflineDocuments"]["ComReport11Received"];

      University = value["userData"]["University"];

      //status=value["documents"]["status$sFP"];
    });
  }

  Future selectInstituteAndDorm() {
    userCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      "primaryInstitute": {
        'schoolName': reservedInstitute[0].title,
        'schoolCategory': reservedInstitute[0].category,
        'teachingProgram':
            reservedInstitute[0].institutedetails.teachingprograms[0].title,
        'dormitory': reservedDormitory[0].title,
      },
      "alternativeInstitute": {
        'schoolName': reservedInstitute[1].title,
        'schoolCategory': reservedInstitute[1].category,
        'teachingProgram':
            reservedInstitute[1].institutedetails.teachingprograms[0].title,
        'dormitory': reservedDormitory[1].title,
      }
    });
  }

  Future setSignupData(UserSignupData _user) async {
    List<String> onlineUni = [
      'Passport',
      'reportCard8th',
      'reportCard9th',
      'reportCard10th',
      'HalfReportCard11th',
    ];
    List<String> offlineUni= [
      'Report8',
      'Report9',
      'Report10',
      'HalfReport11',
      'BirthCertificate',
      'PRCertificate',
      'UkrainianPassport',
      'CRCertificate',
      'Photos',
      'Diploma',
      'Report11'
    ];
    List<String> onlineSchool = [
      'Passport',
      'reportCard8th',
      'HalfReportCard9th',
    ];
    List<String> offlineSchool = [
      'Report8',
      'HalfReport9',
      'BirthCertificate',
      'PRCertificate',
      'UkrainianPassport',
      'CRCertificate',
      'Photos',
      'Diploma',
      'Report9'
    ];
    final token=await FirebaseMessaging.instance.getToken();
    await FirebaseFirestore.instance.collection("FCMTokens").doc(FirebaseAuth.instance.currentUser.uid).set({
      "${FirebaseAuth.instance.currentUser.uid}": token,
    });

    await userCollection.doc(FirebaseAuth.instance.currentUser.uid).set({
      "invoice":null,
      "userData": {
        'fullName': _user.fullName,
        'email': _user.email,
        'phone': _user.phone,
        'gender': _user.gender,
        'address': _user.address,
        'currentSchool': _user.currentSchool,
        'birthDate': _user.birthDate,
        'password': _user.password,
        'paymentStatus': false,
        'University': University,
      },
      "userPassword": {
        'password': _user.password,
      },
      'OnlineDocuments': {
        'Passport': null,
        'reportCard8th': null,
        'HalfReportCard9th': null,
        'reportCard9th': null,
        'reportCard10th': null,
        'HalfReportCard11th': null,
        'statusPassport': false,
        'statusreportCard8th': false,
        'statusHalfReportCard9th': false,
        'statusreportCard9th': false,
        'statusreportCard10th': false,
        'statusHalfReportCard11th': false,
        'passportApproved': false,
        'reportCard8thApproved': false,
        'HalfReportCard9thApproved': false,
        'reportCard9thApproved': false,
        'reportCard10thApproved': false,
        'HalfReportCard11thApproved': false,
      },
      'OfflineDocuments': {
        'Report8Approved': false,
        'HalfReport9Approved': false,
        'ComReport9Approved': false,
        'BirthCertificateApproved': false,
        'PRCertificateApproved': false,
        'UkrainianPassportApproved': false,
        'CRCertificateApproved': false,
        'PhotosApproved': false,
        'DiplomaApproved': false,
        'Report9Approved': false,
        'Report10Approved': false,
        'HalfReport11Approved': false,
        'ComReport11Approved': false,
        'Report8Received': false,
        'HalfReport9Received': false,
        'ComReport9Received': false,
        'BirthCertificateReceived': false,
        'PRCertificateReceived': false,
        'UkrainianPassportReceived': false,
        'CRCertificateReceived': false,
        'PhotosReceived': false,
        'DiplomaReceived': false,
        'Report9Received': false,
        'Report10Received': false,
        'HalfReport11Received': false,
        'ComReport11Received': false,
      },
    });
    Signee _signee = Signee();
    await setParentsData(_signee, 0, 0, 0, []);
    if (globalisUniversity){
      for (int i=0 ;i < onlineUni.length;i++){
        await FirebaseFirestore.instance.collection('OnlineDocuments').doc(FirebaseAuth.instance.currentUser.uid+onlineUni[i]).set({
          'approval':false,
          'comment':"",
          'date':DateTime.now(),
          'guide':"",
          "link":"",
          "name":onlineUni[i],
          'revisionStatus':false,
          'revisions':0,
          'submitted':false,
          'user':FirebaseAuth.instance.currentUser.uid,
        });
      }
      for (int i=0 ;i < offlineUni.length;i++){
        await FirebaseFirestore.instance.collection('OfflineDocuments').doc(FirebaseAuth.instance.currentUser.uid+offlineUni[i]).set({
          'approval':false,
          'date':DateTime.now(),
          "name":offlineUni[i],
          'received':false,
          'user':FirebaseAuth.instance.currentUser.uid,
        });
      }
    }else{
      for (int i=0 ;i < onlineSchool.length;i++){
        await FirebaseFirestore.instance.collection('OnlineDocuments').doc(FirebaseAuth.instance.currentUser.uid+onlineSchool[i]).set({
          'approval':false,
          'comment':"",
          'date':DateTime.now(),
          'guide':"",
          "link":"",
          "name":onlineSchool[i],
          'revisionStatus':false,
          'revisions':0,
          'submitted':false,
          'user':FirebaseAuth.instance.currentUser.uid,
        });
      }
      for (int i=0 ;i < offlineSchool.length;i++){
        await FirebaseFirestore.instance.collection('OfflineDocuments').doc(FirebaseAuth.instance.currentUser.uid+offlineSchool[i]).set({
          'approval':false,
          'date':DateTime.now(),
          "name":offlineSchool[i],
          'received':false,
          'user':FirebaseAuth.instance.currentUser.uid,
        });
      }
    }
  }

  Future updateFAQs() async {
    for (var i = 0; i < FAQ.length; i++) {
      await faqCollection.doc(FAQ.keys.elementAt(i)).set({
        FAQ.keys.elementAt(i): FAQ.values.elementAt(i),
      });
    }
    await faqCollection.doc("General Questions").set({
      "General Questions": FAQ["General Questions"],
    });
  }

  Future<String> downloadURL(String imagePath) async {
    String downloadURL =
        await FirebaseStorage.instance.ref(imagePath).getDownloadURL();
    return downloadURL;
  }

  Future getFAQs() async {
    Map<String, dynamic> Faqs = {};

    // print(this.faqCollection.doc(FAQ.keys.elementAt(0)).get().then((value) => null));

    await this.fireStore.collection("FAQs").get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var i = 0; i < value.docs.length; i++)
          FAQ[value.docs[i].id] = value.docs[i].get(value.docs[i].id);
        print("YUPPPPPPPPPPPPPPP");
      } else {
        print("NULLLLLLLLLLLLLLLLLL!");
      }
    });
  }

  Future<bool> checkPaymentStatus() async {
    return userCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => value["userData"]["paymentStatus"]);
  }

  Future updatePassword(String pass) async {
    await userCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      "userPassword": {
        'password': pass,
      }
    });

    globalUser.userData.password = pass;
  }

  Future setTrackingNumber(String number)async{
    await FirebaseFirestore.instance.collection("TrackingId").doc(FirebaseAuth.instance.currentUser.uid).set({
      "trackingId":number,
      "date":DateTime.now(),
    });
  }
  void OrganizingAllInstitutes() {
    for (var i = 0; i < Allinstitutes.length; i++) {}
  }
}
