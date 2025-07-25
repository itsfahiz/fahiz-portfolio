import 'package:fahiz_portfolio/res/constants.dart';
import 'package:flutter/material.dart';

class AnimatedSubtitleText extends StatelessWidget {
  final double start;
  final double end;
  final String text;
  final bool gradient;
  const AnimatedSubtitleText({
    super.key,
    required this.start,
    required this.end,
    required this.text,
    this.gradient = false,
  });
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            shadows:
                gradient
                    ? [
                      Shadow(
                        color: primaryColor.withOpacity(0.6),
                        offset: Offset(0, 2),
                        blurRadius: 10,
                      ),
                      Shadow(
                        color: secondaryColor.withOpacity(0.6),
                        offset: Offset(0, -2),
                        blurRadius: 10,
                      ),
                    ]
                    : [],
            height: 0,
            fontSize: value,
          ),
        );
      },
    );
  }
}
