import 'package:fahiz_portfolio/model/project_model.dart';
import 'package:fahiz_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:fahiz_portfolio/view/projects/components/projectDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  final double horizontalPadding;

  ProjectGrid({
    super.key,
    this.crossAxisCount = 2,
    this.ratio = 1.3,
    this.horizontalPadding = 30,
  });

  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 3 : 2,
        childAspectRatio: 0.75, // 🔽 Adjusted to make the item taller
      ),
      itemBuilder: (context, index) {
        return Obx(
          () => MouseRegion(
            onEnter: (_) => controller.onHover(index, true),
            onExit: (_) => controller.onHover(index, false),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ProjectDetailPage(project: projectList[index]),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      offset: const Offset(-2, 0),
                      blurRadius: controller.hovers[index] ? 15 : 8,
                    ),
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      offset: const Offset(2, 0),
                      blurRadius: controller.hovers[index] ? 15 : 8,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ProjectStack(index: index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProjectStack extends StatelessWidget {
  final int index;
  const ProjectStack({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final project = projectList[index];

    final screenWidth = MediaQuery.of(context).size.width;
    final double titleFontSize = screenWidth > 900 ? 16 : 14;
    final double stackFontSize = screenWidth > 900 ? 13 : 12;
    final double descFontSize = screenWidth > 900 ? 13 : 11.5;

    final techStackText = (project.techStack ?? []).join(', ');
    final shortDescription =
        (project.features != null && project.features!.isNotEmpty)
            ? project.features!.first
            : ('${project.subTitle?.split('.').first}.');

    // Detect if image is SVG or raster (png, jpg, jpeg)
    final imagePath = project.thumbnail;

    Widget imageWidget;
    if (imagePath.toLowerCase().endsWith('.svg')) {
      imageWidget = SvgPicture.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, size: 40),
          );
        },
      );
    } else {
      imageWidget = Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, size: 40),
          );
        },
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // Image (Top half)
              SizedBox(
                height: constraints.maxHeight * 0.5,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: imageWidget,
                ),
              ),

              // Details (Bottom half)
              SizedBox(
                height: constraints.maxHeight * 0.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project Name Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          project.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Tech Stack
                      if (techStackText.isNotEmpty)
                        Text(
                          techStackText,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: stackFontSize,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 4),

                      // Short Description
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            shortDescription,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: descFontSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
