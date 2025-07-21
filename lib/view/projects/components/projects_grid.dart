import 'package:fahiz_portfolio/model/project_model.dart';
import 'package:fahiz_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:fahiz_portfolio/view/projects/components/projectDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  final double horizontalPadding;

  ProjectGrid({
    super.key,
    this.crossAxisCount = 2,
    this.ratio = 0.75,
    this.horizontalPadding = 40,
  });

  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width < 900;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 40 : 170,
            vertical: 24,
          ),
          child: GridView.builder(
            itemCount: projectList.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 1 : crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: ratio,
            ),
            itemBuilder: (context, index) {
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) =>
                                ProjectDetailPage(project: projectList[index]),
                      ),
                    );
                  },
                  child: MouseRegion(
                    onEnter: (_) => controller.onHover(index, true),
                    onExit: (_) => controller.onHover(index, false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          colors:
                              controller.hovers[index]
                                  ? [
                                    Colors.blueAccent.shade200,
                                    Colors.purpleAccent.shade100,
                                  ]
                                  : [
                                    Colors.indigo.shade400,
                                    Colors.deepPurple.shade300,
                                  ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: controller.hovers[index] ? 18 : 8,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: ProjectStack(index: index),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProjectStack extends StatelessWidget {
  final int index;
  const ProjectStack({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final project = projectList[index];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔵 Image Section - Now Larger
            Expanded(
              flex: 6, // Increased from 5 to 6
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Image.asset(
                  project.thumbnail,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),

            // 🔵 Text Section - Slightly Reduced
            Expanded(
              flex: 3, // Reduced from 4 to 3
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        project.overview ?? '',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
