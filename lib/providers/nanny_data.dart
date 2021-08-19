import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_cv_app/models/education.dart';
import 'package:my_cv_app/models/nanny.dart';
import 'package:my_cv_app/models/review.dart';
import 'package:my_cv_app/models/skill.dart';
import 'package:my_cv_app/models/work_experience.dart';

import '../const/dummy_data.dart';

class MyInfoProvider extends ChangeNotifier {
  MyInfo _myInfo = MyInfo(
      phoneIso: '+44',
      phoneNo: '7984885571',
      id: 'test',
      averageReviewRating: 5,
      serviceCount: 2,
      approved: true,
      description: 'my_description',
      documents: dummyDocs,
      education: [
        Education(
            id: '1',
            institute: 'Lancaster University',
            title: 'Management Sciences',
            year: '2012',
            groups: []),
        Education(
            id: '2',
            institute: 'Academind/Udemy',
            title: 'Flutter & Dart - The Complete Guide',
            year: '2020',
            groups: [])
      ],
      selectedSkills: [
        Skill(
            id: '1',
            skill: 'Flutter',
            active: true,
            isNannySelect: true,
            skillEs: 'Flutter'),
        Skill(
            id: '2',
            skill: 'Firebase',
            active: true,
            isNannySelect: true,
            skillEs: 'Firebase'),
        Skill(
            id: '3',
            skill: 'Node.JS',
            active: true,
            isNannySelect: true,
            skillEs: 'Node.JS'),
        Skill(
            id: '7',
            skill: 'Python',
            active: true,
            isNannySelect: true,
            skillEs: 'Experta en alimentación en bebés'),
        Skill(
            id: '8',
            skill: 'SQL',
            active: true,
            isNannySelect: true,
            skillEs: 'Hablilidades en enseñanza'),
        Skill(
            id: '9',
            skill: 'NoSQL',
            active: true,
            isNannySelect: true,
            skillEs: 'Ciencia y Matemáticas'),
        Skill(
            id: '11',
            skill: 'MongoDB',
            active: true,
            isNannySelect: true,
            skillEs: 'Arte y Manualidades'),
        Skill(
            id: '12',
            skill: 'React Native',
            active: true,
            isNannySelect: true,
            skillEs: 'Arte y Manualidades'),
        Skill(
            id: '15',
            skill: 'VBA',
            active: true,
            isNannySelect: true,
            skillEs: 'Arte y Manualidades')
      ],
      email: 'naabrown19@gmail.com',
      experiences: {'baby': '2', 'young': '2', 'old': '2'},
      lastName: 'Brown',
      firstName: 'Neil',
      nativeLanguageId: '1ae',
      otherLanguages: {'2ae': 'intermediate'},
      reviews: [
        Review(
            id: '2',
            comments:
                'Neil created an app that works on iOS, Android, and now Web! with a well-structured Firedbase database that is easy to understand.',
            familyId: 'test',
            nannyId: 'test',
            score: 5,
            serviceId: 'test',
            reviewType: 'nanny'),
            Review(
            id: '2',
            comments: 'Neil did a great job at creating our cross-platform application.',
            familyId: 'test',
            nannyId: 'test',
            score: 5,
            serviceId: 'test',
            reviewType: 'nanny'),
        
      ],
      workExperience: [
         WorkExperience(
            jobTitle: 'Software Developer',
            companyName: 'Cufflink.io',
            startDate: DateTime(2020, 04, 01),
            endDate: DateTime.now(),
            responsibilities: []),
        WorkExperience(
            jobTitle: 'Technical Analyst',
            companyName: 'Southampton City Council',
            startDate: DateTime(2020, 10, 01),
            endDate: DateTime(2021, 03, 31),
            responsibilities: []),
        WorkExperience(
            jobTitle: 'Co-Founder',
            companyName: 'Mama Gallina Sitters',
            startDate: DateTime(2019, 10, 01),
            endDate: DateTime.now(),
            responsibilities: []),
        WorkExperience(
            jobTitle: 'Network Management Associate',
            companyName: 'Bell Canada',
            startDate: DateTime(2018, 06, 01),
            endDate: DateTime(2020, 08, 01),
            responsibilities: []),
        WorkExperience(
            jobTitle: 'Data Management Associate',
            companyName: 'Home Depot Canada',
            startDate: DateTime(2018, 02, 01),
            endDate: DateTime(2018, 06, 01),
            responsibilities: []),
        WorkExperience(
            jobTitle: 'Key Account Manager',
            companyName: 'Schoeller Bleckmann Oilfield Equipment',
            startDate: DateTime(2012, 08, 01),
            endDate: DateTime(2015, 07, 01),
            responsibilities: []),
      ]);
  
  String _currentLang;

  MyInfo get nanny {
    return _myInfo;
  }

  String get currentLang {
    return _currentLang ?? 'EN';
  }

  void setCurrentLang(String lang){
    _currentLang = lang;
    notifyListeners();
  }
}
