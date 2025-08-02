import 'package:fahiz_portfolio/res/constants.dart';
import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.prefix, required this.title});

  final String prefix;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      color: Colors.white,
      fontSize:
          !Responsive.isDesktop(context)
              ? Responsive.isLargeMobile(context)
                  ? 20
                  : 30
              : 50,
      fontWeight: FontWeight.bold,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$prefix ', style: textStyle),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [primaryColor, secondaryColor],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Text(title, style: textStyle),
        ),
      ],
    );
  }
}
