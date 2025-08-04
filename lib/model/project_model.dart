enum ContentType { sectionTitle, text, image, bulletList, subSectionTitle }

class ContentBlock {
  final ContentType type;
  final String data;
  final List<String>? bullets;

  const ContentBlock({required this.type, required this.data, this.bullets});
}

class Project {
  final String name;
  final String? subTitle;
  final String? year;
  final String? overview;

  final String? youtubeVideoUrl;
  final String? videoCardLogo; // e.g. 'assets/images/mbc/logo.png'
  final String? videoCardTitle; // 'Stay Connected. Anywhere. Anytime.'
  final String? videoCardSubtitle; // e.g. 'subtitle text here'

  final String thumbnail;
  final String bannerImage;

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
    this.youtubeVideoUrl,
    this.videoCardLogo,
    this.videoCardTitle,
    this.videoCardSubtitle,
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
    name: 'Web and Native app',
    subTitle: 'MyBayshoreCare',
    year: '2021',
    overview:
        'A digital platform for supporting users and their family members with essential everyday home and medical services.',

    //youtube card section starts here ********************
    youtubeVideoUrl: 'https://youtu.be/0J4rpSbJjOA',
    videoCardLogo: 'assets/images/mbc/mbc_logo.svg',
    videoCardTitle: 'Stay Connected. Anywhere. Anytime.',
    videoCardSubtitle:
        'It’s never been easier for you and your family to stay connected to your care. Click play and get to know the MyBayshoreCare app.',

    //youtube card section ends here ********************
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
      // ContentBlock(type: ContentType.sectionTitle, data: 'Overview'),
      // ContentBlock(
      //   type: ContentType.text,
      //   data:
      //       'A comprehensive app offering patients access to key healthcare services, ensuring HIPAA-compliant secure communication and care management.',
      // ),
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
    name: 'Web and Native app',
    subTitle: 'MyPath',
    year: '2023',
    overview:
        'Healthcare app allows patients and health practitioners to easily track their progress.',
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
  Project(
    name: 'Web and Native app',
    subTitle: 'Branch Operating System (BOS)',
    year: '2023–2025',
    overview:
        'A healthcare branch management system developed for Bayshore Healthcare, enabling real-time form processing, client and staff management, and streamlined branch operations across web and tablet platforms.',
    thumbnail: 'assets/images/bos/bos.png',
    bannerImage: 'assets/images/bos/bos_bg.png',
    techStack: [
      'Flutter Web & Tablet',
      'Aidbox FHIR',
      'Provider',
      'Clean Architecture',
      'MongoDB',
      'Jira',
      'Postman',
    ],
    features: [
      'Modular UI for employee, client, and expense management',
      'Real-time validation and digital healthcare documentation',
      'FHIR-integrated forms with Aidbox',
      'Secure data workflows and digital signatures',
      'Cross-platform optimization for web and tablet',
    ],
    githubLink: null,
    liveDemoLink: 'https://dev-bos.onebayshore.ca',
    link: 'https://dev-bos.onebayshore.ca',
    contentBlocks: [
      ContentBlock(type: ContentType.sectionTitle, data: 'Objectives'),
      ContentBlock(
        type: ContentType.text,
        data:
            'BOS was created to unify and digitize healthcare branch operations for Bayshore. The system focuses on electronic form creation, client intake, employee and expense management, ensuring compliance and efficiency in real-time.',
      ),

      ContentBlock(type: ContentType.sectionTitle, data: 'Process'),
      ContentBlock(
        type: ContentType.text,
        data:
            'The BOS app was engineered with a scalable UI in Flutter for Web and Tablet use, using real-time form validation and UX-first principles. Collaborated in Agile sprints with cross-functional teams to meet fast-changing healthcare operations and compliance requirements. Modular development and clean architecture were applied for long-term maintainability.',
      ),

      ContentBlock(type: ContentType.sectionTitle, data: 'How Did We Do This?'),
      ContentBlock(
        type: ContentType.bulletList,
        data: '',
        bullets: [
          'Built over 5+ core modules including client intake, employee management, expenses, and exceptions.',
          'Developed modular UI in Flutter Web and Tablet, increasing form accuracy by 40%.',
          'Integrated Aidbox FHIR-compatible form builder to streamline healthcare documentation.',
          'Reduced manual data entry by 60% through structured, reusable components.',
          'Led frontend implementation with Provider & Clean Architecture principles.',
          'Enabled digital signing, secure workflows, and seamless real-time API sync (99%+ accuracy).',
          'Improved onboarding and team velocity with maintainable, testable codebases.',
          'Contributed to 95% Agile sprint goal completion using tools like Jira, Postman, and Git.',
        ],
      ),

      ContentBlock(type: ContentType.image, data: 'assets/images/bos/bos1.png'),

      ContentBlock(type: ContentType.sectionTitle, data: 'Outcomes'),
      ContentBlock(
        type: ContentType.text,
        data:
            'The BOS app empowered multiple healthcare branches to manage operations digitally with high accuracy, reduced data entry, and ensured real-time documentation compliance with FHIR standards. It continues to support ongoing care delivery across branches effectively.',
      ),
      ContentBlock(type: ContentType.image, data: 'assets/images/bos/bos2.png'),
      ContentBlock(type: ContentType.image, data: 'assets/images/bos/bos3.png'),
    ],
  ),
];
