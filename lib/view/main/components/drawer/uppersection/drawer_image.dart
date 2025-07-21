import 'package:fahiz_portfolio/utils/social_links.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../res/constants.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({super.key});

  Future<void> _launchLinkedIn() async {
    final Uri url = Uri.parse(SocialLinks.linkedIn);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchLinkedIn,
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.all(defaultPadding / 6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Colors.black, // solid black background
              primaryColor.withOpacity(0.15), // very subtle light shade inside
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: primaryColor.withOpacity(0.8), // primary color border
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.25), // soft subtle glow
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: ClipOval(
          // use ClipOval for circle clipping
          child: Transform.rotate(
            angle: 0.1,
            child: Image.asset('assets/images/Fahiz.png', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
