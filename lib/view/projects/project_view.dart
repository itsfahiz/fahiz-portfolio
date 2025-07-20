import 'package:fahiz_portfolio/res/constants.dart';
import 'package:fahiz_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:fahiz_portfolio/view%20model/responsive.dart';
import 'package:fahiz_portfolio/view/projects/components/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/projects_grid.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isLargeMobile = Responsive.isLargeMobile(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLargeMobile) const SizedBox(height: defaultPadding),
          const TitleText(prefix: 'Latest', title: 'Projects'),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: ProjectGrid(
              crossAxisCount:
                  isMobile ? 1 : 2, // 👈 Responsive: 1 for mobile, 2 for others
              ratio:
                  isMobile
                      ? 1.5
                      : 1.3, // 👈 Adjust ratio for better height on mobile
              horizontalPadding:
                  isMobile ? 20 : 60, // 👈 Less padding on smaller screens
            ),
          ),
        ],
      ),
    );
  }
}
