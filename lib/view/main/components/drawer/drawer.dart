import 'package:fahiz_portfolio/view/main/components/drawer/bottom_section/contact_icons.dart';
import 'package:fahiz_portfolio/view/main/components/drawer/middle_section/personal_info.dart';
import 'package:flutter/material.dart';
import '../../../../res/constants.dart';
import 'uppersection/about.dart';
import 'skills/my_skill.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Container(
              color: bgColor,
              child: const Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonalInfo(),
                    MySkills(),
                    Divider(),
                    SizedBox(height: defaultPadding),
                    ContactIcon(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
