import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_controller/src/ui/components/buttons/custom_primary_button.dart.dart';
import 'package:money_controller/src/ui/screens/subscriptions/components/view_tabs/info_item_row.dart';

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
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: grey100.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: media.width * 0.9,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: grey100.withOpacity(0.5),
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 30.0,
                        horizontal: 20.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: grey100.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              children: [
                                InfoItemRow(
                                  title: 'Name',
                                  value: widget.subscription['name']!,
                                ),
                                const InfoItemRow(
                                  title: 'Description',
                                  value: 'Music App',
                                ),
                                const InfoItemRow(
                                  title: 'Category',
                                  value: 'Enterteiment',
                                ),
                                const InfoItemRow(
                                  title: 'First payment',
                                  value: '08.07.2023',
                                ),
                                const InfoItemRow(
                                  title: 'Reminder',
                                  value: 'Never',
                                ),
                                const InfoItemRow(
                                  title: 'Currency',
                                  value: 'USD (\$)',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          CustomPrimaryButton(
                            title: 'Save',
                            foregroundColor: white,
                            backgroundColor: grey100.withOpacity(0.4),
                            titleTextStyle: TypographyStyle.b3,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20.0,
                  left: 4.0,
                  right: 4.0,
                ),
                height: media.width * 0.9 + 15,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Expanded(
                      child: DottedBorder(
                        dashPattern: const [5, 10],
                        padding: EdgeInsets.zero,
                        strokeWidth: 1.0,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(16.0),
                        color: black50,
                        child: const SizedBox(height: 0.0),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(30.0),
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
