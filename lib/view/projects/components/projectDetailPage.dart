import 'package:fahiz_portfolio/model/project_model.dart';
import 'package:fahiz_portfolio/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 28,
          letterSpacing: 1.4,
        ),
      ),
    );
  }

  Widget _buildSubSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          letterSpacing: 1.15,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.white.withOpacity(0.25),
      thickness: 1.5,
      height: 40,
      indent: 0,
      endIndent: 0,
    );
  }

  String? getYoutubeThumbnailUrl(String? youtubeUrl) {
    if (youtubeUrl == null || youtubeUrl.isEmpty) return null;

    try {
      final uri = Uri.parse(youtubeUrl);

      String? videoId;

      if (uri.host.contains('youtu.be')) {
        // Short URL - get the first path segment as videoId
        if (uri.pathSegments.isNotEmpty) {
          videoId = uri.pathSegments[0];
        }
      } else if (uri.host.contains('youtube.com')) {
        // Standard URL - get 'v' param
        videoId = uri.queryParameters['v'];
      }

      if (videoId == null || videoId.isEmpty) return null;

      return 'https://img.youtube.com/vi/$videoId/0.jpg';
    } catch (e) {
      return null;
    }
  }

  Widget _buildYoutubeCard(BuildContext context) {
    if (project.youtubeVideoUrl == null) {
      return const SizedBox.shrink();
    }

    final thumbnailUrl = getYoutubeThumbnailUrl(project.youtubeVideoUrl);

    if (thumbnailUrl == null) {
      return const SizedBox.shrink(); // fallback
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        final thumbnail = InkWell(
          onTap: () => _launchUrl(project.youtubeVideoUrl!),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  thumbnailUrl,
                  width: isMobile ? double.infinity : 500,
                  height: isMobile ? 240 : 250,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
            ],
          ),
        );

        final info = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.videoCardLogo != null) ...[
              SvgPicture.asset(
                project.videoCardLogo!,
                height: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 12),
            ],
            if (project.videoCardTitle != null)
              Text(
                project.videoCardTitle!,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            const SizedBox(height: 8),
            if (project.videoCardSubtitle != null)
              Text(
                project.videoCardSubtitle!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
          ],
        );

        return Card(
          color: Colors.white12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child:
                isMobile
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [thumbnail, const SizedBox(height: 20), info],
                    )
                    : Row(
                      children: [
                        Expanded(child: thumbnail),
                        const SizedBox(width: 20),
                        Expanded(child: info),
                      ],
                    ),
          ),
        );
      },
    );
  }

  Widget _buildContentBlock(ContentBlock block, BuildContext context) {
    switch (block.type) {
      case ContentType.sectionTitle:
        return _buildSectionTitle(context, block.data);
      case ContentType.subSectionTitle:
        return _buildSubSectionTitle(context, block.data);
      case ContentType.text:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            block.data,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: bodyTextColor,
              height: 1.5,
              fontSize: 16,
            ),
          ),
        );
      case ContentType.bulletList:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              block.bullets!
                  .map(
                    (bullet) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check, color: Colors.white, size: 18),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              bullet,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                color: bodyTextColor,
                                height: 1.5,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
        );
      case ContentType.image:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(block.data),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(project.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: darkColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner with rounded corners and subtle shadow
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Hero(
                  tag: 'project_banner_${project.name}',
                  child: Image.asset(
                    project.bannerImage,
                    width: double.infinity,
                    height: isWideScreen ? 300 : 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Project Title
              Text(
                project.name,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  fontSize: 32,
                ),
              ),

              if (project.subTitle != null) ...[
                const SizedBox(height: 6),
                Text(
                  project.subTitle!,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                    fontSize: 20,
                  ),
                ),
              ],

              const SizedBox(height: 18),

              // Overview Section (optional)
              if (project.overview != null && project.overview!.isNotEmpty) ...[
                _buildSectionTitle(context, 'Overview'),
                Text(
                  project.overview!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: bodyTextColor,
                    height: 1.5,
                    fontSize: 17,
                  ),
                ),
                _buildDivider(),
              ],

              if (project.youtubeVideoUrl != null &&
                  project.youtubeVideoUrl!.isNotEmpty) ...[
                _buildYoutubeCard(context),
                const SizedBox(height: 24),
              ],

              // Tech Stack Chips
              if (project.techStack != null &&
                  project.techStack!.isNotEmpty) ...[
                _buildSectionTitle(context, 'Tech Stack'),
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  children:
                      project.techStack!
                          .map(
                            (tech) => Chip(
                              label: Text(tech),
                              backgroundColor: Colors.white12,
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              side: const BorderSide(color: Colors.white24),
                              elevation: 1,
                              shadowColor: Colors.white12,
                            ),
                          )
                          .toList(),
                ),
                _buildDivider(),
              ],

              // Features Section
              if (project.features != null && project.features!.isNotEmpty) ...[
                _buildSectionTitle(context, 'Key Features'),
                ...project.features!.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            feature,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: bodyTextColor,
                              height: 1.5,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildDivider(),
              ],

              // Render content blocks dynamically
              if (project.contentBlocks != null &&
                  project.contentBlocks!.isNotEmpty) ...[
                for (final block in project.contentBlocks!)
                  _buildContentBlock(block, context),
                _buildDivider(),
              ],

              // Completed Year
              if (project.year != null && project.year!.isNotEmpty) ...[
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white70, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '${project.year}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: bodyTextColor.withOpacity(0.5),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],

              // External Links Buttons
              Row(
                children: [
                  if (project.githubLink != null &&
                      project.githubLink!.isNotEmpty)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: darkColor,
                        elevation: 3,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.code),
                      label: const Text(
                        'View GitHub',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => _launchUrl(project.githubLink!),
                    ),
                  if (project.githubLink != null &&
                      project.githubLink!.isNotEmpty &&
                      project.liveDemoLink != null &&
                      project.liveDemoLink!.isNotEmpty)
                    const SizedBox(width: 20),
                  if (project.liveDemoLink != null &&
                      project.liveDemoLink!.isNotEmpty)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: darkColor,
                        elevation: 3,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.open_in_new),
                      label: const Text(
                        'Live Demo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => _launchUrl(project.liveDemoLink!),
                    ),
                ],
              ),

              const SizedBox(height: 40),

              // Footer note or branding if you want
              Center(
                child: Text(
                  '@2024 All rights reserved.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: bodyTextColor.withOpacity(0.3),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
