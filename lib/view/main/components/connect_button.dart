import 'package:fahiz_portfolio/utils/social_links.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

  Future<void> _launchWhatsApp() async {
    final url = Uri.parse(SocialLinks.whatsapp);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('Could not launch WhatsApp link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: _launchWhatsApp,
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
          height: 60,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.greenAccent,
                size: 15,
              ),
              const SizedBox(width: defaultPadding / 4),
              Text(
                'Whatsapp',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
