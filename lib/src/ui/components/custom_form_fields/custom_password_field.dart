import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.title,
    this.obscureText = true,
    required this.onShowPassword,
    this.controller,
    this.keyboardType,
  });

  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function() onShowPassword;
  final bool obscureText;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TypographyStyle.st4.grey100,
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
              controller: widget.controller,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: widget.onShowPassword,
                  child: widget.obscureText
                      ? const Icon(
                          Icons.remove_red_eye,
                          color: darkGreen100,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: darkGreen100,
                        ),
                ),
              ),
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
            ),
          ),
        ),
      ],
    );
  }
}
