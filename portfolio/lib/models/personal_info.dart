class CareerEntry {
  final String title;
  final String company;
  final String period;
  final List<String> achievements;

  const CareerEntry({
    required this.title,
    required this.company,
    required this.period,
    required this.achievements,
  });
}

class EducationEntry {
  final String degree;
  final String institution;
  final String period;
  final String specialization;

  const EducationEntry({
    required this.degree,
    required this.institution,
    required this.period,
    required this.specialization,
  });
}

class CertificationEntry {
  final String title;
  final String year;

  const CertificationEntry({
    required this.title,
    required this.year,
  });
}

class PersonalInfo {
  static const String name = 'Parth Bhangare';
  static const String title = 'Mobile App Developer (Flutter)';
  static const String brandName = 'Parth.dev';
  static const String brandShort = 'PARTH.DEV';

  static const String professionalSummary =
      'Mobile App Developer with 1 year of hands-on experience building scalable and client-focused applications using Flutter. '
      'Currently pursuing a Bachelor of Computer Applications (BCA), graduating in July 2026. '
      'Passionate about building high-performance cross-platform mobile applications and continuously improving technical expertise.';

  static const String professionalSummaryMobile =
      'Mobile App Developer with 1 year of experience building scalable Flutter apps. '
      'Currently pursuing BCA (Graduating July 2026). '
      'Focused on high-performance cross-platform solutions.';

  static const String heroText =
      'Crafting the\nnext generation\nof mobile apps';
  static const String heroTextMobile = 'Building the\nfuture\nof mobile app';

  static const String yearsExperience = '1';
  static const String totalProjects = '8';
  static const String currentStatus = 'BCA Student';

  static const String email = 'parthbhangare@gmail.com';
  static const String linkedIn =
      'https://www.linkedin.com/in/parth-bhangare-1503bb291/';
  static const String gitHub = 'https://github.com/parth180605';
  static const String twitter = 'https://twitter.com/parth_dev';

  static const String availabilityStatus = 'OPEN TO NEW OPPORTUNITIES';
  static const bool isAvailable = true;

  static const List<String> coreSkills = [
    'Flutter',
    'Dart',
    'Firebase',
    'HTML',
    'CSS',
    'Bootstrap',
    'JavaScript',
    'Angular',
    'Tailwind',
    'PrimeNG',
    'Node.js',
    'React',
    'MongoDB',
    'REST APIs',
    'Git',
  ];

  static const List<CareerEntry> careerJourney = [
    CareerEntry(
      title: 'Mobile App Developer',
      company: 'Baap Company',
      period: 'Jan 2025 — Present',
      achievements: [
        'Developed and maintained cross-platform mobile applications using Flutter.',
        'Contributed to 7–8 client-based production projects.',
        'Integrated REST APIs and backend services.',
        'Implemented Firebase services for authentication and data handling.',
        'Collaborated with backend and UI teams for feature delivery.',
      ],
    ),
    CareerEntry(
      title: 'Mobile App Developer Intern',
      company: 'Baap Company',
      period: 'July 2024 — Dec 2024',
      achievements: [
        'Assisted in Flutter-based mobile app development.',
        'Worked on UI implementation and bug fixing.',
        'Learned production-level Git workflow and API integration.',
      ],
    ),
  ];

  static const List<EducationEntry> education = [
    EducationEntry(
      degree: 'Bachelor of Computer Applications (BCA)',
      institution: 'University of Mysore',
      period: '2023 — 2026',
      specialization: 'Expected Graduation: July 2026',
    ),
  ];

  static const List<CertificationEntry> certifications = [
    CertificationEntry(title: 'Flutter & Dart Complete Guide', year: '2023'),
    CertificationEntry(title: 'Firebase for Web & Mobile', year: '2023'),
    CertificationEntry(title: 'Advanced Java Programming', year: '2022'),
  ];

  static const String footerText =
      '© 2026 Parth Bhangare. Building mobile experiences.';
}
