import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/screens/home/views/home_view.dart';
import 'package:money_controller/src/ui/screens/home/views/calendar_view.dart';
import 'package:money_controller/src/ui/screens/home/views/page3.dart';
import 'package:money_controller/src/ui/screens/home/views/spending_budget_view.dart';

import '../../themes/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomeView(),
    const SpendingBudgetView(),
    const CalendarView(),
    const Page3(),
  ];

  Widget currentScreen = const HomeView();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey200.withOpacity(0.5),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: darkBlueGrey,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom App Bar
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: bluegrey.withOpacity(0.3),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: IconButton(
                        iconSize: currentTab == 0 ? 30 : 25,
                        onPressed: () {
                          currentScreen = const HomeView();
                          currentTab = 0;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.home_outlined,
                          color: currentTab == 0
                              ? white
                              : grey300.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        iconSize: currentTab == 1 ? 30 : 25,
                        onPressed: () {
                          currentScreen = const SpendingBudgetView();
                          currentTab = 1;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.dashboard_customize_outlined,
                          color: currentTab == 1
                              ? white
                              : grey300.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: IconButton(
                        iconSize: currentTab == 2 ? 30 : 25,
                        onPressed: () {
                          currentScreen = const CalendarView();
                          currentTab = 2;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.calendar_month_outlined,
                          color: currentTab == 2
                              ? white
                              : grey300.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: IconButton(
                        iconSize: currentTab == 3 ? 30 : 25,
                        onPressed: () {
                          currentScreen = const Page3();
                          currentTab = 3;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.credit_card_outlined,
                          color: currentTab == 3
                              ? white
                              : grey300.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
