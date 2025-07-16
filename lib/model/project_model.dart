class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'MyBayshoreCare (Mobile App)',
    'Developed for Bayshore HealthCare (Canada), this cross-platform Flutter app provides patients with secure access to assessments, care tracking, chat support, and pharmacy refill requests. Built using Flutter, Firebase, and integrated with HIPAA-compliant workflows.',
    'assets/images/mybayshorecare.png',
    'https://apps.apple.com/in/app/mybayshorecare/id1523675014',
  ),
  Project(
    'MyPATH – MBC Module',
    'Integrated a powerful patient assessment module in the MyBayshoreCare app, increasing completion rates by 30%. Designed using clean architecture principles, seamless UI, and state management with Provider.',
    'assets/images/mypath.png',
    'https://apps.apple.com/in/app/mybayshorecare/id1523675014', // same app, specific module
  ),
  Project(
    'Branch Operating System (BOS) – Web App',
    'Healthcare branch management system developed for Bayshore. Built UI using Flutter Web, integrated Aidbox (FHIR), and delivered modules for client intake, expenses, and staff. Enabled real-time healthcare documentation across branches.',
    'assets/images/bos.png',
    'https://dev-bos.onebayshore.ca', // internal, or you can leave this empty
  ),
  Project(
    'Doctor Connect (Demo UI)',
    'Designed a modern doctor appointment system UI in Flutter. Includes categorized doctors, profile views, booking flows, and smooth navigation. Built to demonstrate scalable healthcare UX components.',
    'assets/images/doctor.png',
    'https://github.com/fahizdev/doctor-connect', // update when ready
  ),
  Project(
    'Flutter Portfolio Website',
    'A responsive, Firebase-hosted personal portfolio built using Flutter Web. Showcases skills, real-world projects, certifications, and contact details. Includes GitHub Actions for CI/CD auto-deploy from master.',
    'assets/images/portfolio.png',
    'https://fahiz-portfolio.web.app', // update after you deploy
  ),
];
