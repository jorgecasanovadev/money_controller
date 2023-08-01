import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class InfoItemRow extends StatelessWidget {
  const InfoItemRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4.0,
        bottom: 8.0,
        left: 16.0,
        right: 4.0,
      ),
      child: Row(
        children: [
          Text(
            '$title:',
            style: TypographyStyle.st1.w600.white,
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TypographyStyle.overline.w500.grey50,
            ),
          ),
          const SizedBox(width: 2.0),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: grey50,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
