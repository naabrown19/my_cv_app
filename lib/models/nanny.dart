import 'package:my_cv_app/models/address.dart';
import 'package:my_cv_app/models/document.dart';
import 'package:my_cv_app/models/education.dart';
import 'package:my_cv_app/models/review.dart';
import 'package:my_cv_app/models/skill.dart';
import 'package:my_cv_app/models/work_experience.dart';

class MyInfo {
  String id;
  String firstName;
  String lastName;
  String secondLastName;
  String email;
  bool approved;
  DateTime dateOfBirth;
  DateTime createDate;
  DateTime lastLogin;
  String profileImageUrl;
  String locale;
  String language;
  String phoneNo;
  String phoneIso;
  Address address;
  String description;
  List<Skill> selectedSkills = [];
  Map<String, String> experiences = {};
  String nativeLanguageId;
  Map<String, String> otherLanguages = {};
  List<WorkExperience> workExperience = [];
  List<Document> documents = [];
  Map<String, List<String>> answers = {};
  List<String> specialCares = [];
  int serviceCount;
  double percentProfileComplete;
  double averageReviewRating;
  List<Review> reviews;
  List<Education> education = [];

  MyInfo({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.secondLastName,
    this.dateOfBirth,
    this.approved = false,
    this.createDate,
    this.lastLogin,
    this.profileImageUrl,
    this.locale,
    this.address,
    this.answers,
    this.description,
    this.documents,
    this.workExperience,
    this.experiences,
    this.language,
    this.nativeLanguageId,
    this.otherLanguages,
    this.phoneNo,
    this.phoneIso,
    this.selectedSkills,
    this.specialCares,
    this.serviceCount = 0,
    this.percentProfileComplete = 0.0,
    this.averageReviewRating = 5,
    this.reviews,
    this.education,
  });
}
