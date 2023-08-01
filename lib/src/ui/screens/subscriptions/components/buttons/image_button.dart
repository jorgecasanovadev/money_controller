import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
    required this.image,
    required this.onPressed,
    this.padding,
  });

  final String image;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: null,
      onTap: onPressed,
      child: Container(
        width: 50.0,
        height: 50.0,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: grey.withOpacity(0.15),
          ),
          color: grey200.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          image,
          width: 50.0,
          height: 50.0,
          color: grey50,
        ),
      ),
    );
  }
}
