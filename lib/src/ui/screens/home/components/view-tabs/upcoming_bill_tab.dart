import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class UpcomingBillTab extends StatelessWidget {
  const UpcomingBillTab({
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
              Container(
                height: 40.0,
                width: 40.0,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Jun',
                      style: TypographyStyle.caption.white,
                    ),
                    Text(
                      '25',
                      style: TypographyStyle.b1.white,
                    ),
                  ],
                ),
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
