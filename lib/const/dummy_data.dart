import 'package:my_cv_app/models/document.dart';
import 'package:my_cv_app/models/experience.dart';
import 'package:my_cv_app/models/language.dart';
import 'package:my_cv_app/models/review.dart';

import '../models/skill.dart';

const DUMMY_SKILLS = const [
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
      skillEs: 'Amigable con Mascotas'),
  Skill(
      id: '4',
      skill: 'Kotlin',
      active: true,
      isNannySelect: true,
      skillEs: 'Certificado de Primeros Auxilios'),
  Skill(
      id: '5',
      skill: 'Swift',
      active: true,
      isNannySelect: true,
      skillEs: 'Certificado en Educación temprana'),
  
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
      id: '6',
      skill: 'Java',
      active: true,
      isNannySelect: true,
      skillEs: 'Enseñanza de idiomas certificada'),
  Skill(
      id: '10',
      skill: 'C#',
      active: true,
      isNannySelect: true,
      skillEs: 'Arte y Manualidades'),
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
      id: '13',
      skill: 'React',
      active: true,
      isNannySelect: true,
      skillEs: 'Arte y Manualidades'),
  Skill(
      id: '15',
      skill: 'VBA',
      active: true,
      isNannySelect: true,
      skillEs: 'Arte y Manualidades')
  // Skill(
  //     id: '18',
  //     skill: 'Music',
  //     active: true,
  //     isNannySelect: true,
  //     skillEs: 'Música'),
  // Skill(id: '10', skill: 'Proactive', active: true, skillEs: 'Proactiva'),
  // Skill(
  //     id: '11',
  //     skill: 'Multi-Language',
  //     active: true,
  //     isNannySelect: false,
  //     skillEs: 'Múltiples lenguas'),
  // Skill(
  //     id: '12',
  //     skill: 'Experienced Childcarer',
  //     active: true,
  //     isNannySelect: false,
  //     skillEs: 'Cuidador de niños experimentado'),
  // Skill(
  //     id: '13',
  //     skill: 'Education in Childcare',
  //     active: true,
  //     isNannySelect: false,
  //     skillEs: 'Educación en cuidado infantil'),
  // Skill(
  //     id: '14',
  //     skill: 'Driver with car',
  //     active: true,
  //     isNannySelect: false,
  //     skillEs: 'Conductor con coche'),
  // Skill(
  //     id: '15',
  //     skill: 'Driving',
  //     active: true,
  //     isNannySelect: false,
  //     skillEs: 'Conducción'),
  // Skill(
  //     id: '16',
  //     skill: 'Swimming',
  //     active: true,
  //     isNannySelect: false,
  //     skillEs: 'Nadando'),
];

var dummyDocs = [
  Document(id: '1aefgh', docTitle: 'cv'),
  Document(
    id: '2ghsyr',
    docTitle: 'background_check',
  ),
  Document(id: '3jgnsuf', docTitle: 'id'),
  Document(id: '4gjtijg', docTitle: 'reference_personal'),
  Document(id: '5jgoth', docTitle: 'reference_professional'),
];

const DUMMY_EXPERIENCE = const [
  Experience(
      id: '1',
      descriptionKey: 'nanny_ob_seven_baby',
      profileNameKey: 'Preescolar',
      imagePath: 'assets/images/children/chicken-icon-1.png',
      order: 0),
  Experience(
      id: '2',
      descriptionKey: 'nanny_ob_seven_young',
      profileNameKey: 'Youth',
      imagePath: 'assets/images/children/chicken-icon-2.png',
      order: 1),
  Experience(
      id: '3',
      descriptionKey: 'nanny_ob_seven_old',
      profileNameKey: 'Older',
      imagePath: 'assets/images/children/chicken-icon-3.png',
      order: 2)
];

const DUMMY_LANGUAGES = [
  Language(id: '1ae', title: 'English', order: 0, lanES: 'Inglés'),
  Language(id: '2ae', title: 'Spanish', order: 1, lanES: 'Español'),
  Language(id: '3ae', title: 'Italian', order: 2, lanES: 'Italiano'),
  Language(id: '4ae', title: 'Portuguese', order: 3, lanES: 'Portugués'),
  Language(id: '4ae', title: 'German', order: 4, lanES: 'Alemán'),
  Language(id: '4ae', title: 'Mandarin', order: 5, lanES: 'Mandarín'),
  Language(id: '4ae', title: 'Korean', order: 6, lanES: 'Coreano'),
];

const DUMMY_REVIEWS = [
  Review(
      id: '1',
      comments: 'Neil did a great job',
      familyId: 'test',
      nannyId: 'test',
      score: 5,
      serviceId: 'test',
      reviewType: 'nanny'),
  Review(
      id: '2',
      comments:
          'Neil created an app that works on iOS and Android, with a well-structured Firedbase database that is easy to understand.',
      familyId: 'test',
      nannyId: 'test',
      score: 5,
      serviceId: 'test',
      reviewType: 'nanny'),
];
