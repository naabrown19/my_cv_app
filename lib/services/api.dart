import 'dart:io';

import 'package:my_cv_app/models/address.dart';
import 'package:my_cv_app/models/document.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/models/skill.dart';

class Api {
  Future<String> uploadProfilePic(File image, String uid) async {
    return 'url';
  }

  Future<bool> createNanny(MyInfo nanny) async {
    return true;
  }

  Future<String> uploadDoc(File doc, String docType, String uid) async {
    return 'url';
  }

  Future<bool> updateNannyOne(MyInfo nanny) async {
    return true;
  }

  Future<bool> updateNannyPhone(
      String phoneNo, String phoneIso, String uid) async {
    return true;
  }

  Future<bool> updateNannyAddress(Address address, String uid) async {
    return true;
  }

  Future<bool> updateNannyDescription(String desc, String uid) async {
    return true;
  }

  Future<bool> updateNannySkills(List<Skill> skills, String uid) async {
    return true;
  }

  Future<bool> updateNannyExperience(
      Map<String, String> exp, String uid) async {
    return true;
  }

  Future<bool> updateNannyLanguages(
      String nativeLangId, Map<String, String> otherLangs, String uid) async {
    return true;
  }

  Future<bool> updateNannySpecialCares(
      List<String> specialCares, String uid) async {
    return true;
  }

  Future<bool> updateNannyDocs(List<Document> docs, String uid) async {
    return true;
  }
}
