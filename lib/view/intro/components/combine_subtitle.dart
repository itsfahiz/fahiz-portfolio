import 'package:fahiz_portfolio/res/constants.dart';
import 'package:fahiz_portfolio/view/intro/components/subtitle_text.dart';
import 'package:flutter/material.dart';
import '../../../view model/responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  Responsive _buildResponsiveSubtitle({
    required String text,
    required bool gradient,
  }) {
    return Responsive(
      desktop: AnimatedSubtitleText(
        start: 30,
        end: 40,
        text: text,
        gradient: gradient,
      ),
      largeMobile: AnimatedSubtitleText(
        start: 30,
        end: 25,
        text: text,
        gradient: gradient,
      ),
      mobile: AnimatedSubtitleText(
        start: 25,
        end: 20,
        text: text,
        gradient: gradient,
      ),
      tablet: AnimatedSubtitleText(
        start: 40,
        end: 30,
        text: text,
        gradient: gradient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final flutterEngineerText = ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [primaryColor, secondaryColor],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: _buildResponsiveSubtitle(
        text: 'Flutter Engineer',
        gradient: false,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildResponsiveSubtitle(text: 'AI-Driven ', gradient: false),
        flutterEngineerText,
      ],
    );
  }
}
