enum ContentType { sectionTitle, text, image, bulletList, subSectionTitle }

class ContentBlock {
  final ContentType type;
  final String data;
  final List<String>? bullets;

  const ContentBlock({required this.type, required this.data, this.bullets});
}

class Project {
  final String name;
  final String? subTitle; // e.g., 'Web and Native App'
  final String? year;
  final String? overview;

  final String thumbnail; // Required image for preview/card
  final String bannerImage; // Required image for hero/detail

  final List<String>? techStack;
  final List<String>? features;

  final String? githubLink;
  final String? liveDemoLink;
  final String? link;

  final List<ContentBlock>? contentBlocks;

  const Project({
    required this.name,
    required this.thumbnail,
    required this.bannerImage,
    this.subTitle,
    this.year,
    this.overview,
    this.techStack,
    this.features,
    this.githubLink,
    this.liveDemoLink,
    this.link,
    this.contentBlocks,
  });
}

List<Project> projectList = [
  Project(
    name: 'MyBayshoreCare (Mobile App)',
    subTitle: 'Mobile App',
    year: '2021',
    overview:
        'Developed for Bayshore HealthCare (Canada), this cross-platform Flutter app provides patients with secure access to assessments, care tracking, chat support, and pharmacy refill requests. Built with Flutter, Firebase, and integrated HIPAA compliance.',
    thumbnail: 'assets/images/mbc/mbc.png',
    bannerImage: 'assets/images/mbc/mbc_bg.png',
    techStack: ['Flutter', 'Firebase', 'HIPAA Compliance', 'Provider'],
    features: [
      'Patient assessments & care tracking',
      'Chat support with healthcare providers',
      'Pharmacy refill requests',
      'Secure and compliant with healthcare standards',
    ],
    githubLink: null,
    liveDemoLink: 'https://www.bayshore.ca/mybayshorecare/',
    link: 'https://www.bayshore.ca/mybayshorecare/',
    contentBlocks: [
      ContentBlock(type: ContentType.sectionTitle, data: 'Overview'),
      ContentBlock(
        type: ContentType.text,
        data:
            'A comprehensive app offering patients access to key healthcare services, ensuring HIPAA-compliant secure communication and care management.',
      ),

      ContentBlock(type: ContentType.sectionTitle, data: 'Objectives'),

      ContentBlock(type: ContentType.subSectionTitle, data: 'Problem'),
      ContentBlock(
        type: ContentType.text,
        data:
            'Lack of overview and management of users\' everyday essential home and medical needs and their care plan.',
      ),

      ContentBlock(type: ContentType.subSectionTitle, data: 'Solution'),
      ContentBlock(
        type: ContentType.text,
        data:
            'A digital platform created with the help of medical professionals and existing users to support schedules, booking, and managing all essential home or medical needs.',
      ),

      ContentBlock(type: ContentType.sectionTitle, data: 'Process'),
      ContentBlock(
        type: ContentType.text,
        data:
            'Gathered business and user insights on existing clients that fit the user demographic and how they currently interact with the existing applications. Using mental models as an anchor in decisions, developed user journey and tested flow internally and externally with user and stakeholder insights. Enabled moving forward to connect features and optimize the overall user experience.',
      ),

      ContentBlock(type: ContentType.sectionTitle, data: 'How Did We Do This?'),
      ContentBlock(
        type: ContentType.bulletList,
        data: '',
        bullets: [
          'Developed Over 200 APIs Across 30+ Microservices.',
          'Hosted on AWS with Serverless technology including API Gateway, Lambda, AWS Cognito, etc.',
          'Implemented a Plug n’ Play architecture by integrating with scheduling systems, EMRs, EHRs, CRMs.',
          'Integrated Zoom SDK for Virtual Calls and Chat using WebRTC capabilities.',
          'Utilized Google Firebase for effective in-app push notifications.',
          'Advanced Customer Identity Management with AWS Cognito featuring Multi-Factor Authentication (MFA).',
          'Continuous Delivery with AWS CodePipeline for streamlined deployments.',
          'Continuous Integration Using GitHub Actions.',
          'Automated testing with Appium for integration and Flutter unit tests for software quality.',
        ],
      ),

      ContentBlock(type: ContentType.image, data: 'assets/images/mbc/mbc1.png'),

      ContentBlock(type: ContentType.sectionTitle, data: 'Outcomes'),
      ContentBlock(
        type: ContentType.text,
        data:
            'Our solution offers a personalized care plan, centralizing management of home care schedules, caregiver visit updates, virtual consultations, and home support in one location. It also includes detailed health monitoring for peace of mind.',
      ),
      ContentBlock(type: ContentType.image, data: 'assets/images/mbc/mbc2.png'),
    ],
  ),

  Project(
    name: 'MyPath – MBC Module',
    subTitle: 'Mobile App',
    year: '2023',
    overview:
        'Healthcare app, created with a goal to help people with the autoimmune neurological condition called Myasthenia Gravis.',
    thumbnail: 'assets/images/mypath/mypath.png',
    bannerImage: 'assets/images/mypath/mypath_bg.png',
    techStack: ['Flutter', 'Firebase', 'Bayshore Design System'],
    features: [
      'Accessible daily quizzes for progress tracking',
      'Graph-based symptom and progress visualization',
      'Baseline and latest score comparison',
      'Designed with accessibility for patient needs',
    ],
    githubLink: null,
    liveDemoLink: 'https://apps.apple.com/in/app/mybayshorecare/id1523675014',
    link: 'https://www.bayshore.ca/',
    contentBlocks: [
      ContentBlock(type: ContentType.sectionTitle, data: 'Objectives'),
      ContentBlock(
        type: ContentType.text,
        data:
            'MyPath is Bayshore Healthcare powered app, created with a goal to help people with the autoimmune neurological condition called Myasthenia Gravis. It is known to affect motor skills and daily function so part of the treatment requires diligent progress tracking. MyPath allows patients and health practitioners to easily track their progress via accessible daily quizzes and graph reports.',
      ),
      ContentBlock(type: ContentType.sectionTitle, data: 'Process'),
      ContentBlock(
        type: ContentType.text,
        data:
            'The assessment process was designed through using mental models of existing UX applications like MBC, and was created with emphasis on accessibility to accommodate the patients’ needs.',
      ),
      ContentBlock(
        type: ContentType.image,
        data: 'assets/images/mypath/mypath1.png',
      ),
      ContentBlock(
        type: ContentType.text,
        data:
            'The scoring system is showcased after the questionnaire is complete: the requirement was to show the base score (from the very first assessment) and the latest score, that has just been submitted. The graph view helps to visualize and understand the progression better for both healthcare professionals and the patients. The Bayshore Design System components were largely used to compile the app, which helped to achieve quick successful launch. MyPath branding was important to implement as a necessary distinction from the native Bayshore App, so splash screens were created with the logo provided.',
      ),
      ContentBlock(type: ContentType.sectionTitle, data: 'Outcomes'),
      ContentBlock(
        type: ContentType.text,
        data: 'MyPath has been developed and had launched in Fall 2023.',
      ),

      ContentBlock(
        type: ContentType.image,
        data: 'assets/images/mypath/mypath2.png',
      ),
    ],
  ),

  // Project(
  //   name: 'Branch Operating System (BOS) – Web App',
  //   description:
  //       'Healthcare branch management system developed for Bayshore. Built UI using Flutter Web, integrated Aidbox (FHIR), and delivered modules for client intake, expenses, and staff. Enabled real-time healthcare documentation across branches.',
  //   thumbnail: 'assets/images/bos.png',
  //   backgroundImage: 'assets/backgrounds/bos_bg.png',
  //   link: 'https://dev-bos.onebayshore.ca',
  //   techStack: ['Flutter Web', 'Aidbox FHIR', 'Real-time sync', 'MongoDB'],
  //   features: [
  //     'Client intake & expense management',
  //     'Staff management modules',
  //     'Real-time documentation across branches',
  //   ],
  //   date: '2023',
  //   githubLink: null,
  //   liveDemoLink: 'https://dev-bos.onebayshore.ca',
  // ),
];
