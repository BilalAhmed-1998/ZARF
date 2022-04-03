import 'package:flutter/material.dart';
class UserSignupData {
  String fullName;
  String phone;
  String email;
  String gender;
  String address;
  String currentSchool;
  DateTime birthDate;
  String password;
}

class Signee {
  String name;
  String surname;
  DateTime birthDate;
  String address;
  String city;
  String country;
  String taxNumber;
}
class Referral{
  String referralCode;
  int refEarnings;
}
class app_user{

  String uid;
  UserSignupData userData;
  Signee signee;
  Referral ref;


  app_user({this.uid});


}