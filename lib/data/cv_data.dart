import '../models/education.dart';
import '../models/experience.dart';
import '../models/skill_group.dart';

const experiences = [
  Experience(
    company: 'Monta',
    position: 'Flutter Engineer',
    location: 'Copenhagen',
    date: 'June 2023 – Dec 2025',
    bullets: [
      'Implemented growth-focused features (subscriptions, custom theming, user journey) for the Hub charge point management system, a B2B Flutter Web App, within deadlines.',
      'Led architectural quality through ADRs (Architecture Decision Records) defining testing standards and package semantic versioning policies.',
      'Ensured code robustness by writing comprehensive unit/widget/integration tests for business-critical logic and actively contributing to the internal design system for UI components.',
      'Collaborated cross-functionally with multiple Hub engineering teams to ensure seamless feature integration.',
    ],
  ),
  Experience(
    company: 'Trifork Smart Enterprise',
    position: 'Mobility Developer',
    location: 'Copenhagen',
    date: 'Apr 2023 – June 2023',
    bullets: [
      'Built key features into an existing B2C native Android application utilizing the SAP ERP SDK.',
    ],
  ),
  Experience(
    company: 'Dawn Health',
    position: 'Flutter Developer',
    location: 'Copenhagen',
    date: 'July 2022 – Apr 2023',
    bullets: [
      'Delivered independent mobile development work within a small, fast-paced incubator team.',
      'Spearheaded the implementation of the WEMA virtual clinic Flutter Mobile App (B2C) from inception until release, including writing a native plugin for video streaming.',
    ],
  ),
  Experience(
    company: 'Monstarlab EMEA',
    position: 'Flutter Developer',
    location: 'Copenhagen',
    date: 'June 2021 – June 2022',
    bullets: [
      'Contributed to app development in an international team, successfully delivering and releasing features across multiple B2C Flutter Mobile App projects (e.g., Hoergiraffe — an interactive audio book app).',
    ],
  ),
  Experience(
    company: 'Adapt Agency',
    position: 'Student App Developer',
    location: 'Copenhagen',
    date: 'June 2019 – May 2021',
    bullets: [
      'Worked as part of a structured development team, including 6 months of full-time internship. Android Native and Flutter Mobile.',
    ],
  ),
];

const educations = [
  Education(
    institution: 'KEA — Copenhagen Business Academy',
    degree: 'B.A.',
    area: 'Software Development',
    date: '2017 – 2021',
    description:
        'Relevant studies included: Databases, Design Patterns, System Integrations, System Design, and building distributed services. Electives focused on iOS, Android, and Python development.',
  ),
];

const skillGroups = [
  SkillGroup(
    name: 'Flutter / Dart',
    tags: [
      'BLoC & Cubit',
      'dio',
      'get_it',
      'injectable',
      'freezed',
      'retrofit',
      'sentry',
      'hive',
      'auth0',
      'Firebase',
      'Flutter Web',
      'accessibility',
    ],
  ),
  SkillGroup(
    name: 'Architecture',
    tags: ['MVVM', 'Clean Architecture', 'Design Patterns'],
  ),
  SkillGroup(name: 'Android (Kotlin)', tags: ['RxJava', 'Jetpack Compose']),
  SkillGroup(name: 'iOS (Swift)', tags: ['Swift', 'UIKit', 'SwiftUI']),
  SkillGroup(
    name: 'Testing',
    tags: ['Unit tests', 'Widget tests', 'Integration tests', 'mocktail'],
  ),
  SkillGroup(name: 'CI / CD', tags: ['Bitrise', 'GitHub Actions', 'Codemagic']),
];
