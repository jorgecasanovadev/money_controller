import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.controller,
    this.keyboardType,
    this.textAlign = TextAlign.left,
    this.isVisible = false,
    this.isShowPassword = false,
  });

  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final bool isVisible;
  final bool isShowPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: textAlign,
                style: TypographyStyle.st4.grey100,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Container(
          height: 52,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: grey200.withOpacity(0.2),
            border: Border.all(
              color: grey100.withOpacity(0.6),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              style: TypographyStyle.st165.white.w600.s20,
              controller: controller,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              keyboardType: keyboardType,
            ),
          ),
        ),
      ],
    );
  }
}
