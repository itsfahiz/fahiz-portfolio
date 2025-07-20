import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});

  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open URL: $url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final project = projectList[index];
    final githubUrl = project.githubLink;
    final readMoreUrl = project.link ?? project.liveDemoLink;

    return Row(
      children: [
        if (githubUrl != null && githubUrl.isNotEmpty) ...[
          const Text(
            'Check on Github',
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(
            onPressed: () => _launchUrl(context, githubUrl),
            icon: SvgPicture.asset('assets/icons/github.svg'),
          ),
        ],
        const Spacer(),
        if (readMoreUrl != null && readMoreUrl.isNotEmpty)
          TextButton(
            onPressed: () => _launchUrl(context, readMoreUrl),
            child: const Text(
              'Read More >>',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
