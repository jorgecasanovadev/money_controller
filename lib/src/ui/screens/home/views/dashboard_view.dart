import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'DashboardView',
        style: TypographyStyle.b1.white,
      ),
    );
  }
}
