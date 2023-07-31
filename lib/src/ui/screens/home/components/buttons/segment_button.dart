import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class SegmentButton extends StatelessWidget {
  const SegmentButton({
    super.key,
    required this.title,
    this.isActive = true,
    required this.onPressed,
    this.padding,
  });

  final String title;
  final bool isActive;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: null,
      onTap: onPressed,
      child: Container(
        padding: padding,
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

class CustomSegmentIconButton extends StatelessWidget {
  const CustomSegmentIconButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.isActive = true,
    this.padding,
  });

  final Icon icon;
  final String title;
  final bool isActive;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: null,
      onTap: onPressed,
      child: Container(
        padding: padding,
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: isActive
                  ? TypographyStyle.b1.w700.white
                  : TypographyStyle.b1.w700.grey100,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
