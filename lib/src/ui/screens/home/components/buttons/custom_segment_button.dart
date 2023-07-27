import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class CustomSegmentButton extends StatelessWidget {
  const CustomSegmentButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onPressed,
  });

  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: null,
      onTap: onPressed,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(
                  color: grey.withOpacity(0.15),
                ),
                color: grey200.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.0),
              )
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: isActive
              ? TypographyStyle.b1.w700.white
              : TypographyStyle.b1.w700.grey100,
        ),
      ),
    );
  }
}
