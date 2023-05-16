import 'dart:io';

import 'package:touravelog/localization/localization_const.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnboaringScreen extends StatefulWidget {
  const OnboaringScreen({Key? key}) : super(key: key);

  @override
  State<OnboaringScreen> createState() => _OnboaringScreenState();
}

class _OnboaringScreenState extends State<OnboaringScreen> {
  int selectedPage = 0;

  DateTime? backpressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<PageModel> onboardingpagelist = [
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  getTranslate(context, 'onboarding.find_destination'),
                  style: bold20white,
                ),
              ),
              heightSpace,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies velit eget mattis dolor parturient scelerisque. Duis velit egestas facilisis at euismod. Pellentesque . Ultricies velit eget mattis dolor parturient ",
                  style: regular14white,
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/onboarding/plane.webp",
                height: size.height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  getTranslate(context, 'onboarding.book_ticket'),
                  style: bold20white,
                ),
              ),
              heightSpace,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies velit eget mattis dolor parturient scelerisque. Duis velit egestas facilisis at euismod. Pellentesque . Ultricies velit eget mattis dolor parturient ",
                  style: regular14white,
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/onboarding/booking.jpg",
                height: size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  getTranslate(context, 'onboarding.enjoy_holiday'),
                  style: bold20white,
                ),
              ),
              heightSpace,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies velit eget mattis dolor parturient scelerisque. Duis velit egestas facilisis at euismod. Pellentesque . Ultricies velit eget mattis dolor parturient ",
                  style: regular14white,
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/onboarding/holiday.jpg",
                height: size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      )
    ];

    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop(context);
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: const Color(0xffC4C4C4).withOpacity(0.1),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          selectedPage == onboardingpagelist.length - 1
                              ? TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    getTranslate(context, 'onboarding.skip'),
                                    style: medium14white.copyWith(
                                        color: Colors.transparent),
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signin');
                                  },
                                  child: Text(
                                    getTranslate(context, 'onboarding.skip'),
                                    style: medium14white,
                                  ),
                                ),
                          IconButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: fixPadding * 4),
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  if (selectedPage ==
                                      onboardingpagelist.length - 1) {
                                    Navigator.pushNamed(context, '/signin');
                                  } else {
                                    selectedPage++;
                                  }
                                });
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_circle_right_sharp,
                              size: 50,
                              color: whiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Onboarding(
                        startPageIndex: selectedPage,
                        onPageChange: (index) {
                          setState(() {
                            selectedPage = index;
                          });
                        },
                        pages: onboardingpagelist,
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

  onWillPop(context) {
    DateTime now = DateTime.now();

    if (backpressTime == null ||
        now.difference(backpressTime!) > const Duration(seconds: 2)) {
      backpressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: blackColor,
            content: Text(
              getTranslate(context, 'app_exit.exit_text'),
              style: const TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating),
      );
      return false;
    } else {
      return true;
    }
  }
}
