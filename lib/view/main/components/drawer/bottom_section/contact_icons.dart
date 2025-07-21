import 'package:fahiz_portfolio/utils/social_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../res/constants.dart'; // Make sure SocialLinks is imported from here or appropriate path

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Handle error, e.g., show snackbar or print error
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () => _launchUrl(SocialLinks.linkedIn),
            icon: SvgPicture.asset('assets/icons/linkedin.svg'),
          ),
          IconButton(
            onPressed: () => _launchUrl(SocialLinks.instagram),
            icon: SvgPicture.asset(
              'assets/icons/instagram.svg',
              color: Colors.grey,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
