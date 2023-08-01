import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/themes.dart';

class SubscriptionInfoScreen extends StatefulWidget {
  const SubscriptionInfoScreen({
    super.key,
    required this.subscription,
  });

  final Map<String, String> subscription;

  @override
  State<SubscriptionInfoScreen> createState() => _SubscriptionInfoScreenState();
}

class _SubscriptionInfoScreenState extends State<SubscriptionInfoScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: grey200.withOpacity(0),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: grey50.withOpacity(0.3),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: media.width * 0.9,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: grey50.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: grey50,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                'Subscription info',
                                style: TypographyStyle.st1.grey50,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.trashCan,
                                  color: grey50,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            widget.subscription['icon'] ?? '',
                            width: media.width * 0.25,
                            height: media.width * 0.25,
                          ),
                          const SizedBox(width: 20.0),
                          Text(
                            widget.subscription['name'] ?? '',
                            style: TypographyStyle.h4.white,
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            '\$${widget.subscription['price']}',
                            style: TypographyStyle.h6.w700.grey50,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      height: media.width * 1,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: media.width * 0.89,
                            decoration: BoxDecoration(
                              color: grey50.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 20.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name: ',
                                        style: TypographyStyle.st1.w600.white,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Name de producto',
                                          textAlign: TextAlign.right,
                                          style: TypographyStyle
                                              .overline.w500.grey50,
                                        ),
                                      ),
                                      // const SizedBox(width: 8.0),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: grey50,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
