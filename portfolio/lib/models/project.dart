class Project {
  final String title;
  final String description;
  final String category;
  final List<String> techStack;
  final String imageTag;

  Project({
    required this.title,
    required this.description,
    required this.category,
    required this.techStack,
    required this.imageTag,
  });
}

final List<Project> dummyProjects = [
  Project(
    title: 'OfficeBook',
    description:
        'Business management application streamlining internal office workflows including employee coordination, task assignment, and operational tracking.',
    category: 'Enterprise',
    techStack: ['Flutter', 'Firebase', 'REST APIs'],
    imageTag: 'CLIENT',
  ),
  Project(
    title: 'Vyapo',
    description:
        'eCommerce shopping platform enabling users to browse products, place orders, and manage transactions through a mobile-first experience.',
    category: 'eCommerce',
    techStack: ['Flutter', 'Firebase', 'Cloud Functions'],
    imageTag: 'LIVE',
  ),
  Project(
    title: 'Jeevan Rider App',
    description:
        'Delivery partner application with real-time order management, live tracking, and optimized rider workflow for on-demand logistics.',
    category: 'Logistics',
    techStack: ['Flutter', 'Firebase', 'Google Maps'],
    imageTag: 'LIVE',
  ),
  Project(
    title: 'RM Drip App',
    description:
        'Brand-focused mobile application enhancing customer engagement, product visibility, and service interaction through streamlined digital experience.',
    category: 'Brand',
    techStack: ['Flutter', 'Firebase'],
    imageTag: 'CLIENT',
  ),
  Project(
    title: 'Good Tutor AI',
    description:
        'AI-powered educational application providing intelligent tutoring assistance through real-time conversational interaction.',
    category: 'AI/EdTech',
    techStack: ['Flutter', 'Firebase', 'AI APIs'],
    imageTag: 'IN DEV',
  ),
  Project(
    title: 'LMS Platform',
    description:
        'Mobile-based learning management system enabling structured course management, content delivery, and student progress tracking.',
    category: 'EdTech',
    techStack: ['Flutter', 'Firebase'],
    imageTag: 'CLIENT',
  ),
  Project(
    title: 'Snapo',
    description:
        'Quick-commerce application for fast product browsing, ordering, and real-time delivery tracking. Built independently from scratch.',
    category: 'Quick Commerce',
    techStack: ['Flutter', 'Firebase'],
    imageTag: 'PERSONAL',
  ),
  Project(
    title: 'Laundrify',
    description:
        'On-demand laundry service application allowing users to schedule pickups, track orders, and manage service requests digitally.',
    category: 'On-Demand',
    techStack: ['Flutter', 'Firebase'],
    imageTag: 'TEAM',
  ),
  Project(
    title: 'Hathbar',
    description:
        'Local commerce marketplace connecting users with nearby vendors and service providers within local communities.',
    category: 'Marketplace',
    techStack: ['Flutter', 'Firebase'],
    imageTag: 'TEAM',
  ),
];
