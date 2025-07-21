class CertificateModel {
  final String name;
  final String organization;
  final String date;
  final String credentialId;
  final String skills;
  final String credentialUrl;
  final String description;
  final String logoAsset;

  CertificateModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.credentialId,
    required this.skills,
    required this.credentialUrl,
    required this.description,
    required this.logoAsset,
  });
}

List<CertificateModel> certificateList = [
  CertificateModel(
    name: 'Flutter & Dart – The Complete Guide [2025 Edition]',
    organization: 'Udemy',
    date: 'Feb 2022',
    credentialId: 'UC-4f187c7e-eab8-47f1-8dc1-98dc8a3140f9',
    skills:
        'Flutter Mobile App Development, Dart Programming Language, +8 skills',
    credentialUrl:
        'https://www.udemy.com/certificate/UC-4f187c7e-eab8-47f1-8dc1-98dc8a3140f9/',
    description:
        'Completed a 30-hour comprehensive course on Flutter and Dart, covering mobile app development, state management, UI/UX design, backend integration, and deployment. Gained hands-on experience building cross-platform applications using real-world projects.',
    logoAsset: 'assets/certificate/logos/Udemy-Logo.png',
  ),
  CertificateModel(
    name: 'One Million Prompters – Prompt Engineering Certification',
    organization: 'Dubai Future Foundation',
    date: 'May 2025',
    credentialId: 'yCNuqw2XUlGZ',
    skills: 'Prompt Engineering, Artificial Intelligence, +3 skills',
    credentialUrl: 'https://omp.dub.ai/certificate/yCNuqw2XUlGZ',
    description:
        'Successfully completed the One Million Prompters initiative by the Dubai Future Foundation and Dubai Centre for Artificial Intelligence, focused on developing core skills in Prompt Engineering for AI systems. This program empowers participants to thrive in AI-driven industries through hands-on learning in generative AI, prompt design, and AI-powered productivity.',
    logoAsset: 'assets/certificate/logos/dubai_future_foundation.jpg',
  ),
];
