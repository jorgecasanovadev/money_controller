import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class SubscriptionTab extends StatelessWidget {
  const SubscriptionTab({
    super.key,
    required this.onPressed,
    required this.subscriptionObject,
  });

  final VoidCallback onPressed;
  final Map<String, dynamic> subscriptionObject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onPressed,
        child: Container(
          height: 64.0,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: grey.withOpacity(0.15),
            ),
            color: grey200.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.0),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Image.asset(
                subscriptionObject['icon'],
                width: 55,
                height: 55,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  subscriptionObject['name'],
                  style: TypographyStyle.b2.w600.white,
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '\$${subscriptionObject['price']}',
                style: TypographyStyle.b2.w600.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
