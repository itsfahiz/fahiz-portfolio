import 'package:fahiz_portfolio/view%20model/getx_controllers/achievemnet_controller.dart';
import 'package:fahiz_portfolio/view/Achievements/achievements_list.dart';
import 'package:fahiz_portfolio/view/projects/components/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';

class Achievements extends StatelessWidget {
  final controller = Get.put(AchievementController());

  Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(height: defaultPadding),
          const TitleText(prefix: 'Awards &', title: 'Recognitions'),
          const SizedBox(height: defaultPadding),
          Expanded(child: AchievementList()), // ✅ not CertificateList
        ],
      ),
    );
  }
}
