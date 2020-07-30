import 'package:flutter/foundation.dart';
import 'package:my_cv_app/models/education.dart';
import 'package:my_cv_app/models/nanny.dart';
import 'package:my_cv_app/models/skill.dart';
import 'package:my_cv_app/models/work_experience.dart';

import '../const/dummy_data.dart';

class MyInfoProvider extends ChangeNotifier {
  
  MyInfo _myInfo = MyInfo(
      phoneIso: '+52',
      phoneNo: '4445041207',
      id: 'test',
      averageReviewRating: 5,
      serviceCount: 2,
      approved: true,
      description: 'Hi, I\'m Neil, and I\'m a Flutter developer.',
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
      experiences: {'baby': '1', 'young': '1', 'old': '1'},
      lastName: 'Brown',
      firstName: 'Neil',
      nativeLanguageId: '1ae',
      otherLanguages: {'2ae': 'intermediate'},
      reviews: DUMMY_REVIEWS,
      workExperience: [
        WorkExperience(
            jobTitle: 'Network Management Associate',
            companyName: 'Bell Canada',
            startDate: DateTime(2018, 06, 01),
            endDate: DateTime(2020, 08, 01),
            responsibilities: []),
        WorkExperience(
            jobTitle: 'Data Processing Associate',
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

  MyInfo get nanny {
    return _myInfo;
  }
}
