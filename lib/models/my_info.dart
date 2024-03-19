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
  String? secondLastName;
  String email;
  bool approved;
  DateTime? dateOfBirth;
  DateTime? createDate;
  DateTime? lastLogin;
  String? profileImageUrl;
  String? locale;
  String? language;
  String phoneNo;
  String phoneIso;
  Address? address;
  String description;
  List<Skill> selectedSkills = [];
  Map<String, String> experiences = {};
  String nativeLanguageId;
  Map<String, String>? otherLanguages;
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
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.secondLastName,
    this.dateOfBirth,
    this.approved = false,
    this.createDate,
    this.lastLogin,
    this.profileImageUrl,
    this.locale,
    this.address,
    this.answers = const {},
    required this.description,
    required this.documents,
    required this.workExperience,
    required this.experiences,
    this.language,
    required this.nativeLanguageId,
    this.otherLanguages,
    required this.phoneNo,
    required this.phoneIso,
    required this.selectedSkills,
    this.specialCares = const [],
    this.serviceCount = 0,
    this.percentProfileComplete = 0.0,
    this.averageReviewRating = 5,
    required this.reviews,
    required this.education,
  });
}
