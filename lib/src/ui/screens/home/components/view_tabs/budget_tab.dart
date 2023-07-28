import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class BudgetTab extends StatelessWidget {
  const BudgetTab({
    super.key,
    required this.onPressed,
    required this.budgetObject,
  });

  final VoidCallback onPressed;
  final Map<String, dynamic> budgetObject;

  @override
  Widget build(BuildContext context) {
    var linearValue = (double.parse(budgetObject['left_amount']) /
        double.parse(budgetObject['total_budget']));
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onPressed,
        child: Container(
          // height: 74.0,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: grey.withOpacity(0.15),
            ),
            color: grey200.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16.0),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      budgetObject['icon'],
                      width: 40,
                      height: 40,
                      color: grey50,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budgetObject['name'],
                          style: TypographyStyle.b2.w600.white,
                        ),
                        Text(
                          '\$${budgetObject['left_amount']} left to spend',
                          style: TypographyStyle.b1.grey100,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${budgetObject['spend_amount']}',
                        style: TypographyStyle.b2.w600.white,
                      ),
                      Text(
                        'of \$${budgetObject['total_budget']}',
                        style: TypographyStyle.b1.grey100,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: LinearProgressIndicator(
                  backgroundColor: grey200,
                  valueColor: AlwaysStoppedAnimation(budgetObject['color']),
                  minHeight: 3.5,
                  value: linearValue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
