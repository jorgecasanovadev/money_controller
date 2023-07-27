import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class LogoView extends StatelessWidget {
  const LogoView({
    super.key,
    this.width,
    this.fontSize,
  });

  final double? width;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logos/money-logo.png',
          width: width ?? (media.width * 0.2),
          fit: BoxFit.contain,
          color: Colors.white.withOpacity(0.8),
          colorBlendMode: BlendMode.modulate,
        ),
        FittedBox(
          fit: BoxFit.fill,
          child: Text(
            'Money \nController',
            textAlign: TextAlign.center,
            style: (width == null)
                ? TypographyStyle.h3.w900.white.copyWith(
                    fontFamily: 'Houston',
                    fontWeight: FontWeight.w700,
                  )
                : TypographyStyle.h3.w900.white.copyWith(
                    fontFamily: 'Houston',
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                  ),
          ),
        ),
      ],
    );
  }
}
