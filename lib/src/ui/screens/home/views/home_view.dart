import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/screens/home/components/buttons/status_button.dart';
import 'package:money_controller/src/ui/screens/home/components/view_tabs/arc_painter_view.dart';
import 'package:money_controller/src/ui/components/views/logo_view.dart';
import 'package:money_controller/src/ui/screens/home/components/buttons/segment_button.dart';
import 'package:money_controller/src/ui/screens/home/components/view_tabs/subscription_tab.dart';
import 'package:money_controller/src/ui/screens/home/components/view_tabs/upcoming_bill_tab.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      'name': 'Prime Video',
      'icon': 'assets/imgs/prime-video-logo.png',
      'price': '14.00',
    },
  ];

  List<Map<String, dynamic>> bills = [
    {
      'name': 'Spotify',
      'date': DateTime(2023, 07, 25),
      'price': '5.99',
    },
    {
      'name': 'YouTube',
      'date': DateTime(2023, 07, 25),
      'price': '18.99',
    },
    {
      'name': 'Microsoft OneDrive',
      'date': DateTime(2023, 07, 25),
      'price': '29.99',
    },
    {
      'name': 'Prime Video',
      'date': DateTime(2023, 07, 25),
      'price': '14.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    const double maxExpenses = 2000.0;
    const double currentBills = 1358.50;

    return Scaffold(
      backgroundColor: grey200.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                color: bluegrey.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/imgs/home_bg.png'),
                  Container(
                    padding: EdgeInsets.only(bottom: media.width * 0.05),
                    width: media.width * 0.72,
                    height: media.width * 0.72,
                    child: CustomPaint(
                      painter: ArcPainterView(
                        end: maxExpenses,
                        blurWidth: 6,
                        drawArcs: [
                          ArcModel(color: darkBlueGrey, value: currentBills),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: media.width * 0.05),
                      LogoView(
                        width: media.width * 0.13,
                        fontSize: 25,
                      ),
                      SizedBox(height: media.width * 0.05),
                      Text(
                        '\$1,358.50',
                        style: TypographyStyle.h3.white,
                      ),
                      SizedBox(height: media.width * 0.05),
                      Text(
                        'This month bills',
                        style: TypographyStyle.b1.grey100,
                      ),
                      SizedBox(height: media.width * 0.04),
                      InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        splashColor: null,
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grey.withOpacity(0.2),
                            ),
                            color: bluegrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            'See your budget',
                            style: TypographyStyle.b1.w700.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: 'Active \nsubscriptions',
                                value: '12',
                                statusColor: darkBlueGrey,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: StatusButton(
                                title: 'Highest subscriptions',
                                value: '\$19.90',
                                statusColor: orange300,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: StatusButton(
                                title: 'Lowest \nsubscriptions',
                                value: '\$5.70',
                                statusColor: green500,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              height: 50.0,
              decoration: BoxDecoration(
                color: black100.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentButton(
                      title: 'Your subscriptions',
                      isActive: isSubscription,
                      onPressed: () {
                        isSubscription = !isSubscription;
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    child: SegmentButton(
                      title: 'Upcoming bills',
                      isActive: !isSubscription,
                      onPressed: () {
                        isSubscription = !isSubscription;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subscriptions.length,
                itemBuilder: (context, index) {
                  var subscription = subscriptions[index];
                  return SubscriptionTab(
                    onPressed: () {},
                    subscription: subscription,
                  );
                },
              ),
            if (!isSubscription)
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subscriptions.length,
                itemBuilder: (context, index) {
                  var subscription = subscriptions[index];
                  return UpcomingBillTab(
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
