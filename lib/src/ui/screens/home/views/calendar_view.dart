import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_controller/src/ui/screens/home/components/buttons/custom_segment_button.dart';
import 'package:money_controller/src/ui/screens/home/components/view_tabs/subscription_cell.dart';
import 'package:money_controller/src/ui/themes/themes.dart';
import 'package:money_controller/src/ui/utils/calendar_package/calendar_package.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  // Calendar Package
  final CalendarController calendarController = CalendarController();
  late DateTime selectedDate;
  Random random = Random();

  // Subscriptions variables
  bool isSubscription = true;
  List<Map<String, String>> subscriptions = [
    {
      'name': 'Spotify',
      'icon': 'assets/imgs/spotify-logo.png',
      'price': '5.99',
    },
    {
      'name': 'YouTube Premiun',
      'icon': 'assets/imgs/youtube-logo.png',
      'price': '18.99',
    },
    {
      'name': 'Google Drive',
      'icon': 'assets/imgs/google-drive-logo.png',
      'price': '29.99',
    },
    {
      'name': 'Amazon Prime',
      'icon': 'assets/imgs/prime-video-logo.png',
      'price': '14.00',
    },
  ];

  @override
  void initState() {
    selectedDate = DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: grey200.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: media.width,
              decoration: BoxDecoration(
                color: bluegrey.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Calendar',
                                style: TypographyStyle.st1.grey70,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            'Subscriptions\nSchedule',
                            style: TypographyStyle.h3.white,
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '3 subscriptions for today',
                                style: TypographyStyle.st3.w600.grey70,
                              ),
                              CustomSegmentIconButton(
                                title: 'July',
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                                icon: const Icon(
                                  Icons.expand_more,
                                  color: white,
                                  size: 16.0,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomCalendar(
                      backgroundColor: transparent,
                      controller: calendarController,
                      weekDay: WeekDay.short,
                      fullCalendarDay: WeekDay.short,
                      selectedDateColor: darkBlueGrey,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 90)),
                      lastDate: DateTime.now().add(const Duration(days: 120)),
                      events: List.generate(
                        100,
                        (index) => DateTime.now().subtract(
                          Duration(days: index * random.nextInt(5)),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grey.withOpacity(0.15),
                        ),
                        color: grey200.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      selectedDayLogo: Container(
                        width: 6.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          color: red50,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.calendarCheck,
                          color: red,
                        ),
                      ),
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'July',
                        style: TypographyStyle.st4.white,
                      ),
                      Text(
                        '\$24.98',
                        style: TypographyStyle.st4.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '28.07.2023',
                        style: TypographyStyle.b1.grey50,
                      ),
                      Text(
                        'in upcoming bills',
                        style: TypographyStyle.b1.grey50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                crossAxisCount: 2,
              ),
              itemCount: subscriptions.length,
              itemBuilder: (context, index) {
                final subscription = subscriptions[index];
                return SubscriptionCell(
                  onPressed: () {},
                  subscription: subscription,
                );
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
