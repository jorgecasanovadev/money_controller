import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class SubscriptionCell extends StatelessWidget {
  const SubscriptionCell({
    super.key,
    required this.onPressed,
    required this.subscription,
  });

  final VoidCallback onPressed;
  final Map<String, dynamic> subscription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: grey.withOpacity(0.1),
            ),
            color: grey200.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.0),
          ),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                subscription['icon'],
                width: 55,
                height: 55,
              ),
              const Spacer(),
              Text(
                subscription['name'],
                style: TypographyStyle.b2.w600.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                '\$${subscription['price']}',
                style: TypographyStyle.st4.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
