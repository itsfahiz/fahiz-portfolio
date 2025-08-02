import 'package:fahiz_portfolio/utils/social_links.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class ConnectButtons extends StatelessWidget {
  const ConnectButtons({super.key});

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('Could not launch $urlString');
    }
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color iconColor,
    required String url,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(defaultPadding + 10),
      child: Container(
        height: 20,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [primaryColor, secondaryColor]),

          boxShadow: const [
            BoxShadow(
              color: primaryColor,
              offset: Offset(0, -1),
              blurRadius: defaultPadding / 4,
            ),
            BoxShadow(
              color: secondaryColor,
              offset: Offset(0, 1),
              blurRadius: defaultPadding / 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 15),
            const SizedBox(width: defaultPadding / 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.white,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(
            context: context,
            label: 'LinkedIn',
            icon: FontAwesomeIcons.linkedinIn,
            iconColor: Colors.white,
            url: SocialLinks.linkedIn,
          ),
          const SizedBox(height: 10),
          _buildButton(
            context: context,
            label: 'WhatsApp',
            icon: FontAwesomeIcons.whatsapp,
            iconColor: Colors.white,
            url: SocialLinks.whatsapp,
          ),
        ],
      ),
    );
  }
}
