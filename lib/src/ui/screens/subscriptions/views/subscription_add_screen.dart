import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_controller/src/ui/components/buttons/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/components/custom_form_fields/custom_text_field.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class SubscriptionAddScreen extends StatefulWidget {
  const SubscriptionAddScreen({super.key});
  static const routeName = '/add_subscription';

  @override
  State<SubscriptionAddScreen> createState() => _SubscriptionAddScreenState();
}

class _SubscriptionAddScreenState extends State<SubscriptionAddScreen> {
  TextEditingController inputTextController = TextEditingController();
  double amountVal = 0.0;
  List<Map<String, String>> subscriptions = [
    {'name': 'Netflix', 'icon': 'assets/imgs/netflix.png'},
    {'name': 'Spotify', 'icon': 'assets/imgs/spotify-logo.png'},
    {
      'name': 'YouTube Premiun',
      'icon': 'assets/imgs/youtube-logo.png',
    },
    {
      'name': 'Google Drive',
      'icon': 'assets/imgs/google-drive-logo.png',
    },
    {
      'name': 'Prime Video',
      'icon': 'assets/imgs/prime-video-logo.png',
    },
    {
      'name': 'Disney +',
      'icon': 'assets/imgs/disneplus.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: grey200.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: bluegrey.withOpacity(0.55),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: grey50,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New',
                              style: TypographyStyle.st1.grey50,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Add new\n subscription',
                        textAlign: TextAlign.center,
                        style: TypographyStyle.h3.white.w700,
                      ),
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.height * 0.25,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          aspectRatio: 1,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.65,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                        itemCount: subscriptions.length,
                        itemBuilder: (context, index, pageViewIndex) {
                          final subscription = subscriptions[index];
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  subscription['icon']!,
                                  width: media.width * 0.4,
                                  height: media.width * 0.4,
                                  fit: BoxFit.fitHeight,
                                ),
                                const Spacer(),
                                Text(
                                  subscription['name']!,
                                  style: TypographyStyle.st1.white,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: CustomTextField(
                title: 'Description',
                textAlign: TextAlign.center,
                controller: inputTextController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      amountVal -= 0.1;
                      if (amountVal < 0) {
                        amountVal = 0;
                      }
                      setState(() {});
                    },
                    icon: const Icon(
                      FontAwesomeIcons.minus,
                      color: white,
                      size: 30.0,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Monthly price',
                        style: TypographyStyle.b1.w600.grey50,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '\$${amountVal.toStringAsFixed(2)}',
                        style: TypographyStyle.h3.w700.white,
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: 150.0,
                        height: 1.0,
                        color: grey70,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      amountVal += 0.1;
                      setState(() {});
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      color: white,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomPrimaryButton(
                title: 'Add this platform',
                titleTextStyle: TypographyStyle.b1,
                backgroundColor: darkBlueGrey,
                foregroundColor: white,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 120.0),
          ],
        ),
      ),
    );
  }
}
