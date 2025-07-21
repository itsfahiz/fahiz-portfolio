import 'package:fahiz_portfolio/utils/social_links.dart';
import 'package:fahiz_portfolio/view/intro/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
          icon: 'assets/icons/linkedin.svg',
          onTap: () => launchUrl(Uri.parse(SocialLinks.linkedIn)),
        ),
        // SocialMediaIcon(
        //   icon: 'assets/icons/github.svg',
        //   onTap: () => launchUrl(Uri.parse(SocialLinks.github)),
        // ),
        SocialMediaIcon(
          icon: 'assets/icons/instagram.svg',
          onTap: () => launchUrl(Uri.parse(SocialLinks.instagram)),
        ),
        // Removed twitter
      ],
    );
  }
}
