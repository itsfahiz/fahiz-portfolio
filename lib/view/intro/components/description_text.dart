import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
    super.key,
    required this.start,
    required this.end,
  });
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final firebaseAiText =
        isMobile
            ? 'Firebase & AI-driven \nstacks.'
            : 'Firebase & AI-driven stacks.';

    final text =
        'I build intelligent cross-platform apps from idea'
        '${isMobile ? '\n' : ' '}to deployment using Flutter'
        '${isMobile ? ',' : ',\n'}'
        '$firebaseAiText';

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
        );
      },
    );
  }
}
