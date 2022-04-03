

import 'package:localstore/localstore.dart';
import 'package:zarf/dormitory.dart';
import 'package:zarf/school.dart';

class LocalStorage{
  final db = Localstore.instance;
  final instituteId=Localstore.instance.collection('Institute').doc().id;
  final dormId=Localstore.instance.collection('Dormitory').doc().id;

  Future storeInstitute(List<Institute> inst) {

     db.collection('Institute').doc(instituteId).set({
      'inst1': inst[0],
      'inst2': inst[1],
    });

  }
  Future storeDormitory(List<Dormitory> dorm){

    db.collection('Dormitory').doc(dormId).set({
      'dorm1': dorm[0],
      'dorm2': dorm[1],
    });

  }




}