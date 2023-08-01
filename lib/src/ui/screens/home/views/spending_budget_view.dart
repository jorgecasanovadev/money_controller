import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_controller/src/ui/screens/home/components/view_tabs/arc_painter_view.dart';
import 'package:money_controller/src/ui/screens/home/components/view_tabs/budget_tab.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class SpendingBudgetView extends StatefulWidget {
  const SpendingBudgetView({super.key});

  @override
  State<SpendingBudgetView> createState() => _SpendingBudgetViewState();
}

class _SpendingBudgetViewState extends State<SpendingBudgetView> {
  double maxExpenses = 0.0;
  double totalLeftAmount = 0.0;
  double totalSpendAmount = 0.0;
  List<ArcModel> arcModels = <ArcModel>[];
  List<Map<String, dynamic>> budgets = [
    {
      'name': 'Auto & Transport',
      'icon': 'assets/imgs/auto_&_transport.png',
      'spend_amount': '136.00',
      'total_budget': '550.00',
      'left_amount': '414.00',
      'color': red400,
    },
    {
      'name': 'Entertaiment',
      'icon': 'assets/imgs/entertainment.png',
      'spend_amount': '386.00',
      'total_budget': '400.00',
      'left_amount': '14.00',
      'color': green400,
    },
    {
      'name': 'Security',
      'icon': 'assets/imgs/security.png',
      'spend_amount': '243.50',
      'total_budget': '350.00',
      'left_amount': '106.50',
      'color': purple100,
    },
    {
      'name': 'Groceries',
      'icon': 'assets/imgs/grocery.png',
      'spend_amount': '580.00',
      'total_budget': '700.00',
      'left_amount': '120.00',
      'color': yellow100,
    },
  ];

  void totalExpensesBudgets() {
    for (var budget in budgets) {
      maxExpenses += double.parse(budget['total_budget']);
      totalLeftAmount += double.parse(budget['left_amount']);
      totalSpendAmount += double.parse(budget['spend_amount']);
    }
  }

  void getArcModelList() {
    for (var budget in budgets) {
      arcModels.add(
        ArcModel(
          color: budget['color'],
          value: maxExpenses - double.parse(budget['spend_amount']),
        ),
      );
    }
  }

  @override
  void initState() {
    totalExpensesBudgets();
    getArcModelList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: grey200.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: media.width * 0.5,
                  height: media.width * 0.3,
                  child: CustomPaint(
                    painter: ArcPainterView(
                      is180Arc: true,
                      width: 12.0,
                      blurWidth: 2.0,
                      end: maxExpenses,
                      drawArcs: arcModels,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '\$$totalLeftAmount',
                      style: TypographyStyle.h5.w700.white,
                    ),
                    Text(
                      'of \$$maxExpenses budget',
                      style: TypographyStyle.st1.w500.grey100,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () {},
                child: Container(
                  height: 64.0,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: grey.withOpacity(0.15),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your budget are on tack 👍🏼',
                        style: TypographyStyle.b2.w600.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgets.length,
              itemBuilder: (context, index) {
                var budgetObject = budgets[index];
                return BudgetTab(
                  onPressed: () {},
                  budgetObject: budgetObject,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [5, 4],
                  strokeWidth: 1.0,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16.0),
                  color: grey.withOpacity(0.15),
                  child: Container(
                    height: 64.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add new category ',
                          style: TypographyStyle.b2.w600.grey50,
                        ),
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grey50,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.plus,
                            color: grey50,
                            size: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
