import 'package:fahiz_portfolio/utils/social_links.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../res/constants.dart'; // or wherever ContactInfo class is

import '../header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri.parse('tel:${SocialLinks.phone}');
    if (!await launchUrl(phoneUri)) {
      debugPrint('Could not launch phone dialer');
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: SocialLinks.email);
    if (!await launchUrl(emailUri)) {
      debugPrint('Could not launch email app');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),

        // Phone - tap to dial
        GestureDetector(
          onTap: _launchPhone,
          child: const AreaInfoText(title: 'Contact', text: SocialLinks.phone),
        ),

        // Email - tap to open mail app
        GestureDetector(
          onTap: _launchEmail,
          child: const AreaInfoText(title: 'Email', text: SocialLinks.email),
        ),

        // LinkedIn - tap to open LinkedIn URL
        GestureDetector(
          onTap: () => _launchURL(SocialLinks.linkedIn),
          child: const AreaInfoText(title: 'LinkedIn', text: '@fahiz'),
        ),

        // // Github - tap to open GitHub URL
        // GestureDetector(
        //   onTap: () => _launchURL(SocialLinks.github),
        //   child: const AreaInfoText(title: 'Github', text: '@fahiz'),
        // ),
        const SizedBox(height: defaultPadding),

        // const Text('Skills', style: TextStyle(color: Colors.white)),

        // const SizedBox(height: defaultPadding),
      ],
    );
  }
}
