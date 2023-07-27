import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class CustomStatusButton extends StatelessWidget {
  const CustomStatusButton({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    required this.statusColor,
  });

  final String title;
  final String value;
  final Color statusColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: null,
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 68.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: grey.withOpacity(0.15),
              ),
              color: bluegrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TypographyStyle.overline.w600.grey,
                ),
                const SizedBox(height: 2.0),
                Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TypographyStyle.st1.w700.white,
                ),
              ],
            ),
          ),
          Container(
            width: 60.0,
            height: 1.0,
            color: statusColor,
          ),
        ],
      ),
    );
  }
}
