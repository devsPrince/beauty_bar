import 'package:demandium/common/widgets/web_menu_bar.dart';
import 'package:demandium/feature/tier_journey/upgrade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:rive/rive.dart' as rive;

import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/menu_drawer.dart';
import '../../helper/responsive_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

RxInt rewardIndex = 0.obs;

int currentRewardPoint = 100;

class TierJourneyScreen extends StatelessWidget {
  const TierJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context)
          ? const WebMenuBar()
          : CustomAppBar(
              title: "Tier Journey".tr,
              onBackPressed: () {
                Get.back();
              },
            ),
      endDrawer:
          ResponsiveHelper.isDesktop(context) ? const MenuDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(width: Dimensions.webMaxWidth),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault),
              child: FirstSection(),
            ),
            ResponsiveHelper.isDesktop(context)
                ? const SizedBox(height: Dimensions.pagesBottomPadding)
                : const SizedBox(),
            ResponsiveHelper.isDesktop(context)
                ? const SizedBox(height: Dimensions.pagesBottomPadding)
                : const SizedBox(),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault),
              child: HowItWorksSection(),
            ),
            ResponsiveHelper.isDesktop(context)
                ? const SizedBox(height: Dimensions.pagesBottomPadding)
                : const SizedBox(),
            const WhatArePointsSection(),
            const Gap(30),
            const TapToExploreJourneySection(),
            const Gap(30),
            RewardSection(),
          ],
        ),
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'tier_points_and_levels'.tr,
                    textAlign: TextAlign.center,
                    style: robotoBold.copyWith(
                      fontSize: Dimensions.fontSizeForReview,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Text('tier_points_subtitle'.tr,
                      style: robotoRegular.copyWith(
                        fontSize: Dimensions.fontSizeLarge,
                      )),
                ],
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeExtraLarge),
                child:
                    SvgPicture.asset(Images.mobileScreen, height: Get.height),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeExtraLarge),
                child: SvgPicture.asset(Images.mobileScreen,
                    height: Get.height * 0.6),
              ),
              const SizedBox(
                height: Dimensions.paddingSizeDefault,
              ),
              Text(
                'tier_points_and_levels'.tr,
                textAlign: TextAlign.center,
                style: robotoBold.copyWith(
                  fontSize: Dimensions.fontSizeOverLarge,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
              SizedBox(
                height: Dimensions.paddingSizeSmall,
                width: Get.width,
              ),
              Text('tier_points_subtitle'.tr,
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.fontSizeDefault,
                  )),
              const SizedBox(height: Dimensions.pagesBottomPadding),
            ],
          );
        }
      }),
    );
  }
}

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ResponsiveHelper.isDesktop(context) ? Get.height * 0.6 : null,
        child: Column(
          children: [
            Text(
              'how_it_works'.tr,
              textAlign: TextAlign.center,
              style: robotoBold.copyWith(
                fontSize: Dimensions.fontSizeForReview,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            SizedBox(
              height: Dimensions.paddingSizeLarge,
              width: Get.width,
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (ResponsiveHelper.isDesktop(context)) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // FIRST COLUMN IMAGE
                        SizedBox(
                            height: Get.height * 0.4,
                            child: SvgPicture.asset(Images.earnPoints,
                                width: Get.width * 0.25)),
                        SizedBox(height: Get.height * 0.02),
                        Text('earn_points'.tr,
                            style: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                fontWeight: FontWeight.bold)),
                        Container(
                          width: 190,
                          height: 6,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Text('earn_points_subtitle'.tr,
                            style: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: Get.width * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 64),
                      // FIRST ARROW
                      child: Transform.rotate(
                          angle: -math.pi / 3,
                          child: SvgPicture.asset(Images.arrow,
                              width: Get.width * 0.04)),
                    ),
                    SizedBox(width: Get.width * 0.01),
                    Column(
                      children: [
                        // SECOND COLUMN IMAGE
                        SizedBox(
                            height: Get.height * 0.4,
                            child: SvgPicture.asset(Images.gift,
                                width: Get.width * 0.25)),
                        SizedBox(height: Get.height * 0.02),
                        Text('earn_points_reveal_rewards'.tr,
                            style: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                fontWeight: FontWeight.bold)),
                        Container(
                          width: 430,
                          height: 6,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Text('earn_points_reveal_rewards_subtitle'.tr,
                            style: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: Get.width * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 64),
                      // SECOND ARROW
                      child: Transform.rotate(
                          angle: -math.pi / 3,
                          child: SvgPicture.asset(Images.arrow,
                              width: Get.width * 0.04)),
                    ),
                    Column(
                      children: [
                        // THIRD COLUMN IMAGE
                        SizedBox(
                            height: Get.height * 0.4,
                            child: SvgPicture.asset(Images.points,
                                width: Get.width * 0.25)),
                        SizedBox(height: Get.height * 0.02),
                        Text('rise_through_tiers'.tr,
                            style: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                fontWeight: FontWeight.bold)),
                        Container(
                          width: 280,
                          height: 6,
                          color: Colors.pinkAccent.withOpacity(0.5),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Text('rise_through_tiers_subtitle'.tr,
                            style: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                        height: Get.height * 0.4,
                        child: SvgPicture.asset(Images.earnPoints)),
                    SizedBox(height: Get.height * 0.02),
                    Text('earn_points'.tr,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeOverLarge,
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: 190,
                      height: 6,
                      color: Colors.pinkAccent.withOpacity(0.5),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text('earn_points_subtitle'.tr,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.bold)),
                    Transform.rotate(
                        angle: -math.pi / 3,
                        child: SvgPicture.asset(Images.arrow)),
                    SizedBox(
                        height: Get.height * 0.4,
                        child: SvgPicture.asset(Images.gift)),
                    SizedBox(height: Get.height * 0.02),
                    Text('earn_points_reveal_rewards'.tr,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeOverLarge,
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: 430,
                      height: 6,
                      color: Colors.pinkAccent.withOpacity(0.5),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text('earn_points_reveal_rewards_subtitle'.tr,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.bold)),
                    Transform.rotate(
                        angle: -math.pi / 3,
                        child: SvgPicture.asset(Images.arrow)),
                    SizedBox(
                        height: Get.height * 0.4,
                        child: SvgPicture.asset(Images.points)),
                    SizedBox(height: Get.height * 0.02),
                    Text('rise_through_tiers'.tr,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeOverLarge,
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: 280,
                      height: 6,
                      color: Colors.pinkAccent.withOpacity(0.5),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text('rise_through_tiers_subtitle'.tr,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.bold)),
                  ],
                );
              }
            }),
          ],
        ));
  }
}

class WhatArePointsSection extends StatelessWidget {
  const WhatArePointsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: Colors.grey.withOpacity(0.4),
      height: ResponsiveHelper.isDesktop(context) ? Get.height * 0.4 : null,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 1040) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeTextFieldGap,
                    vertical: Dimensions.paddingForChattingButton),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'what_are_points'.tr,
                      textAlign: TextAlign.center,
                      style: robotoBold.copyWith(
                        fontSize: Dimensions.fontSizeForReview,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                    Container(
                      width: 430,
                      height: 6,
                      color: Colors.pinkAccent.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeExtraLarge,
                    ),
                    Text('what_are_points_subtitle'.tr,
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: Dimensions.paddingSizeExtraLarge,
                    ),
                    const Text('LEARN MORE'),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Column(
            children: [],
          );
        }
      }),
    );
  }
}

class TapToExploreJourneySection extends StatefulWidget {
  const TapToExploreJourneySection({super.key});

  @override
  State<TapToExploreJourneySection> createState() =>
      _TapToExploreJourneySectionState();
}

class _TapToExploreJourneySectionState
    extends State<TapToExploreJourneySection> {
  List<rive.SMIBool?> riveBoolInput = [];

  List<String> rives = [
    'assets/rive/tier_grey.riv',
    'assets/rive/tier_yellow.riv',
    'assets/rive/tier_pink.riv',
    'assets/rive/tier_green.riv',
    'assets/rive/tier_blue.riv',
  ];
  List<Color> colors = [
    Colors.grey,
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.blue
  ];

  List<double> rewardValue = [
    1.0,
    1.0,
    0.3,
    0.4,
    0.5,
  ];

  // Extracting inputs from the StateMachineController
  void _onRiveInit(rive.Artboard artboard, {required int index}) {
    final controller =
        rive.StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    riveBoolInput[index] = controller.getBoolInput('Boolean 1')!;
  }

  void startRive(int index) {
    if (riveBoolInput[index]?.value == false) {
      setState(() {
        riveBoolInput[index]?.value = true;
      });
    } else {
      setState(() {
        index = index;
        riveBoolInput[index]?.value = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    riveBoolInput = List<rive.SMIBool?>.filled(rives.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(rives.length, (index) {
          return Expanded(
            child: GestureDetector(
                onTap: () {
                  startRive(index);
                  rewardIndex.value = index;
                  debugPrint("====> Current reward index $index");
                },
                child: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: rive.RiveAnimation.asset(rives[index],
                            onInit: (artboard) =>
                                _onRiveInit(artboard, index: index))),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LinearProgressIndicator(
                            value: rewardValue[index],
                            backgroundColor: rewardValue[index] == 0.0
                                ? Colors.grey
                                : Colors.grey,
                            color: colors[index],
                          ),
                          if (rewardIndex.value == index)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                    CupertinoIcons.arrowtriangle_up_fill),
                                Text(
                                  "3000 points",
                                  style: TextStyle(
                                      color: colors[index],
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )
                              ]
                                  .animate(
                                      onPlay: (controller) =>
                                          controller.repeat(reverse: true))
                                  .moveY(
                                      duration:
                                          const Duration(milliseconds: 1200),
                                      begin: 5,
                                      end: -5,
                                      curve: Curves.easeInOut),
                            ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        })
      ],
    );
  }
}

class RewardSection extends StatefulWidget {
  const RewardSection({
    super.key,
  });

  @override
  State<RewardSection> createState() => _RewardSectionState();
}

class _RewardSectionState extends State<RewardSection> {
  //
  // ...List.generate(imagesSvg.length, (index) {
  //   return GestureDetector(
  //       onTap: (){},
  //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           SizedBox(
  //               height: 100,
  //               width: 100,
  //               child: SvgPicture.asset(imagesSvg[index], height: 100, width: 100,).animate(
  //                 delay: 1000.ms, // this delay only happens once at the very start
  //                 onPlay: (controller) => controller.repeat(), // loop
  //               ).fadeIn() // uses `Animate.defaultDuration`
  //                   .shimmer( duration: 1000.ms)
  //                   .shake(duration:  500.ms)
  //                   .scaleXY(begin: 0.9, end: 1.3 )),// inherits duration from fadeIn
  //
  //           const Gap(80),
  //           SizedBox(width: 150, child: Text(loremSvg[index],style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),).animate(
  //             delay: 1000.ms, // this delay only happens once at the very start
  //             onPlay: (controller) => controller.repeat(), // loop
  //           ).shimmer(curve: Curves.easeInBack, duration: 2000.ms)
  //           )
  //
  //         ],
  //       ));
  // }),

  List<String> imagesSvg = [
    'assets/tier/14.svg',
    'assets/tier/15.svg',
    'assets/tier/17.svg',
    'assets/tier/EARN POINTS.svg',
    'assets/tier/mobile screen.svg',
    'assets/tier/points.svg',
    'assets/tier/PRE ORDER PERKS!.svg',
    'assets/tier/REWARD on us!.svg',
    'assets/tier/star.svg',
  ];

  List<String> tierImagesPng = [
    'assets/tier/tier_grey.png',
    'assets/tier/tier_yellow.png',
    'assets/tier/tier_pink.png',
    'assets/tier/tier_green.png',
    'assets/tier/tier_blue.png',
  ];

  List<String> loremSvg = [
    "Velit esse cillum dolore eu fugiat.",
    "Non proident sunt in culpa officia.",
    "Mollit anim id est laborum ipsum.",
    "Magna aliqua ut enim ad veniam.",
    "Minim veniam quis nostrud exercitation labore.",
    "Reprehenderit voluptate velit esse cillum dolore.",
    "Cupidatat non proident sunt culpa officia.",
    "Consectetur adipiscing elit sed do tempor.",
    "Ut labore et dolore magna aliqua.",
  ];

  List<String> imagesPng = [
    'assets/tier/1.png', // circle with 1
    'assets/tier/3.png', //skincare video
    'assets/tier/5.png', // testimonials
    'assets/tier/6.png', //joining video
    'assets/tier/7.png', //easy likes
    'assets/tier/4.png', // booking video
    'assets/tier/gift.png', // gift
  ];

  List<List<Map<String, dynamic>>> loremPngRight = [
    [
      {
        'top': 'FIRST TIMER',
        'bot': 'First pre-order',
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': 'A warn welcome',
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Joining announcement video',
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Booking announcement video',
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Testimonial video',
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Skincare video!',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'EASY 9',
        'bot': '3 Likes, 3 comments, 3 share for 30 days',
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'CASH ₹400 UNLOCKED',
        'bot': 'Level up Yellow!',
        'image': "assets/tier/tier_yellow.png",
        'unlocked': false,
      }
    ],
    [
      {
        'top': 'A REWARD FROM BP',
        'bot': '',
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'PRE ORDER',
        'bot': 'Book your favourite service',
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Booking announcement video',
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Reward announcement video',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Genuine review video!',
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Hair care tips video!',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'EASY 9',
        'bot': '3 Likes, 3 comments, 3 share for 30 days',
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'CASH ₹1200 UNLOCKED',
        'bot': 'Level up Pink!',
        'image': "assets/tier/tier_pink.png",
        'unlocked': false,
      }
    ],
    [
      {
        'top': 'A REWARD FROM BP',
        'bot': 'PRE ORDER\nBook your favourite service',
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Booking announcement video',
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Reward announcement video',
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Genuine review video!',
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Selfcare importance video!',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'EASY 9',
        'bot': '3 Likes, 3 comments, 3 share for 30 days',
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, you're Green Star!",
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'PRE ORDER',
        'bot': 'Book your favourite service',
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Booking announcement video',
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Reward announcement video',
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Genuine review video!',
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Selfcare importance video!',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'EASY 9',
        'bot': '3 Likes, 3 comments, 3 share for 30 days',
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'CASH ₹4000 UNLOCKED',
        'bot': 'Level up Green!',
        'image': "assets/tier/tier_green.png",
        'unlocked': false,
      }
    ],
    [
      {
        'top': 'A REWARD FROM BP',
        'bot': 'PRE ORDER\nBook your favourite service',
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Booking announcement video',
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Reward announcement video',
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Genuine review video!',
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Selfcare importance video!',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'EASY 9',
        'bot': '3 Likes, 3 comments, 3 share for 30 days',
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, you're Blue Diamond!",
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'PRE ORDER',
        'bot': 'Book your favourite service',
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Booking announcement video',
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Reward announcement video',
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Genuine review video!',
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Selfcare tips video!',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'EASY 9',
        'bot': '3 Likes, 3 comments, 3 share for 30 days',
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'CASH ₹15000 UNLOCKED',
        'bot': 'Level up Blue!',
        'image': "assets/tier/tier_blue.png",
        'unlocked': false,
      }
    ],
    [
      {
        'top': 'A REWARD FROM BP',
        'bot': 'PRE ORDER\nBook your favourite service',
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'PRE ORDER',
        'bot': 'Book your favourite service',
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Booking announcement video',
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Income proof video',
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Quality service review video',
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'SHARE YOUR',
        'bot': 'Selfcare importance video!',
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'EASY 9',
        'bot': '3 Likes, 3 comments, 3 share for 30 days',
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/gift.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/1.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/3.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/4.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/5.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/6.png",
        'unlocked': false,
      },
      {
        'top': 'A REWARD FROM BP',
        'bot': "Before you know it, Before you know it, you're Blue Star!",
        'image': "assets/tier/7.png",
        'unlocked': false,
      },
    ]
  ];

  List<String> loremPngLeft = [
    "₹1,000 Order",
    "First Pre-Order",
    "Joining video!",
    'Order video',
    "Review video",
    "Awareness video!",
    "Engaging activities",
    "8000 points",
    "₹1,000 Order",
    "First Pre-Order",
    "Joining video!",
    'Order video',
    "Review video",
    "Awareness video!",
    "Engaging activities",
    "8000 points",
    "₹1,000 Order",
    "First Pre-Order",
    "Joining video!",
    'Order video',
    "Review video",
    "Awareness video!",
    "Engaging activities",
    "8000 points",
    "₹1,000 Order",
    "First Pre-Order",
    "Joining video!",
    'Order video',
    "Review video",
    "Awareness video!",
    "Engaging activities",
    "8000 points",
    "₹1,000 Order",
    "First Pre-Order",
    "Joining video!",
    'Order video',
    "Review video",
    "Awareness video!",
    "Engaging activities",
    "8000 points",
    "₹1,000 Order",
    "First Pre-Order",
    "Joining video!",
    'Order video',
    "Review video",
    "Awareness video!",
    "Engaging activities",
    "8000 points",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ...List.generate(loremPngRight[rewardIndex.value].length, (index) {
              print(
                  "====> Index lenght ${loremPngRight[rewardIndex.value].length}");
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left text element
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            "Unlock after",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          Text(
                            loremPngLeft[index],
                            // Accessing left text by index
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ]
                            .animate(onPlay: (controller) => controller.resync)
                            .moveX(
                                duration: const Duration(milliseconds: 900),
                                begin: -250,
                                end: 0),
                      ),
                    ),
                  ),

                  const Gap(50),

                  // Image element
                  Obx(
                    () => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            loremPngRight[rewardIndex.value][index]
                                ['unlocked'] = true;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpgradeTierPage(
                                        image: loremPngRight[rewardIndex.value]
                                            [index]['image'],
                                      )));
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                color: loremPngRight[rewardIndex.value][index]
                                            ['unlocked'] ==
                                        false
                                    ? Colors.grey
                                    : null,
                                loremPngRight[rewardIndex.value][index]
                                    ['image'],
                                // Accessing image for the current index
                                height: 100,
                                width: 100,
                              )
                                  .animate(
                                      delay: 1000.ms, // Animation delay
                                      onPlay: (controller) {
                                        if (loremPngRight[rewardIndex.value]
                                                [index]['unlocked'] ==
                                            true) {
                                          controller.repeat(reverse: true);
                                        }
                                      })
                                  .fadeIn(
                                    begin: 0.8,
                                    duration: const Duration(milliseconds: 500),
                                    delay: const Duration(milliseconds: 2500),
                                  )
                                  .scaleXY(
                                    begin: 1,
                                    end: 1.3,
                                    duration: const Duration(milliseconds: 500),
                                  )
                                  .shimmer(duration: 500.ms)
                                  .shake(duration: 500.ms),
                              if (loremPngRight[rewardIndex.value][index]
                                      ['unlocked'] !=
                                  true)
                                const Icon(
                                  CupertinoIcons.padlock,
                                  size: 40,
                                ),
                            ],
                          ),
                        )
                            .animate(onPlay: (controller) => controller.resync)
                            .moveX(
                                duration: const Duration(milliseconds: 900),
                                begin: -150,
                                end: 0),
                      ),
                    ),
                  ),

                  const Gap(80),

                  // Top text element
                  Obx(
                    () => Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              loremPngRight[rewardIndex.value][index]['top'],
                              // Accessing "top" field for the current index
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ).animate(
                              delay: 2000.ms, // Animation delay
                            ),
                          ),
                          const Gap(20),
                          SizedBox(
                            width: 150,
                            child: Text(
                              loremPngRight[rewardIndex.value][index]['bot'],
                              // Accessing "bot" field for the current index
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.normal),
                            ).animate(
                              delay: 2000.ms, // Animation delay
                            ),
                          ),
                        ].animate(onPlay: (controller) {
                          // if (rewardIndex.value != 6) {
                          //   if(!controller.isAnimating & controller.isCompleted){
                          //     controller.repeat(); // Restart animation on index change
                          //   }
                          //   else{
                          //     controller.stop(canceled: true);
                          //   }
                          //
                          // }
                        }).moveX(
                            duration: const Duration(milliseconds: 900),
                            begin: -150,
                            end: 0),
                      ),
                    ),
                  ),
                ],
              );
            }),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
