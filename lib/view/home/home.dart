import 'package:fahiz_portfolio/view/Achievements/achievements.dart';
import 'package:fahiz_portfolio/view/certifications/certifications.dart';
import 'package:fahiz_portfolio/view/intro/introduction.dart';
import 'package:fahiz_portfolio/view/main/main_view.dart';
import 'package:fahiz_portfolio/view/projects/project_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(
      pages: [
        const Introduction(),
        ProjectsView(),
        Certifications(),
        Achievements(),
      ],
    );
  }
}
