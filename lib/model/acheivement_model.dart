class Achievement {
  final String title;
  final String date;
  final String organization;
  final String description;
  final String clientMessage;
  final String iconAsset; // For main award icon
  final String clientImage;

  Achievement({
    required this.title,
    required this.date,
    required this.organization,
    required this.description,
    required this.clientMessage,
    this.iconAsset = '',
    this.clientImage = '',
  });
}

final List<Achievement> achievementList = [
  Achievement(
    title: 'Top Performer Award – Excellence in App Delivery & Team Impact',
    date: 'June 2023',
    organization: 'Bayshore HealthCare',
    description:
        'Awarded for consistently exceeding performance benchmarks while delivering mission-critical healthcare apps. Demonstrated strong accountability, attention to quality, and collaborative spirit across project lifecycles.',
    clientMessage:
        'Fahiz has been a cornerstone of our app development efforts. His ability to deliver with precision, lead initiatives independently, and maintain consistent velocity made him stand out as a true top performer.',
    iconAsset: 'assets/client/award_types/award.jpg',
    clientImage: 'assets/client/logos/bayshore-logo.jpeg',
  ),
  Achievement(
    title:
        'Client Appreciation – Outstanding Collaboration & Solution Delivery',
    date: '2023',
    organization: 'Bayshore HealthCare',
    description:
        'Recognized by the client for exceptional communication, ownership, and delivery standards. Rolled out two high-impact healthcare applications and played a key role in finalizing a third, ensuring quality and continuity.',
    clientMessage:
        'Fahiz has been an invaluable asset to our development efforts. His attention to detail, proactive communication, and commitment to delivery excellence have greatly contributed to our success across multiple healthcare initiatives.',
    iconAsset: 'assets/client/award_types/appreciation.png',
    clientImage: 'assets/client/logos/bayshore-logo.jpeg',
  ),
  Achievement(
    title: 'Employee of the Quarter – Recognition for Leadership & Value',
    date: 'July 2023',
    organization: 'Prism Cloud Consulting Inc.',
    description:
        'Officially recognized as one of the top contributors for 2023. Honored for delivering two high-quality projects and leading a third toward successful wrap-up. Acknowledged for consistently adding value, driving collaboration, and setting high technical standards.',
    clientMessage:
        'Fahiz’s work ethic and technical leadership have been pivotal. His initiative and cross-functional coordination have elevated team outcomes and client satisfaction levels across the board.',
    iconAsset: 'assets/client/award_types/award.jpg',
    clientImage: 'assets/client/logos/prism-logo.png',
  ),
];
