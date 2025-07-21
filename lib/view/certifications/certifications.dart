import 'package:fahiz_portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:fahiz_portfolio/view/projects/components/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/certification_list.dart';

class Certifications extends StatelessWidget {
  final controller = Get.put(CertificationController());

  Certifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(height: defaultPadding),
          const TitleText(prefix: 'Certifications & ', title: 'License'),
          const SizedBox(height: defaultPadding),
          Expanded(child: CertificateList()),
        ],
      ),
    );
  }
}
