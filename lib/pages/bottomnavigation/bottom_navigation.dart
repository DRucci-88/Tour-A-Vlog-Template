import 'dart:io';
import 'package:touravelog/localization/localization_const.dart';
import 'package:touravelog/pages/screens.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  List pages = [
    const HomeScreen(),
    const BookScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  DateTime? backpressTime;

  @override
  Widget build(BuildContext context) {
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
        body: pages.elementAt(selectedIndex),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: whiteColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: secondaryColor,
      unselectedItemColor: const Color(0xffb7b7b7),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w200,
        color: secondaryColor,
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w200,
        color: Color(0xffb7b7b7),
        fontSize: 14,
      ),
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_rounded),
          label: getTranslate(context, 'bottom_navigation.home'),
          activeIcon: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.home_rounded,
              color: whiteColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/bottomavigation/fluent_ticket-diagonal-16-filled.png",
            height: 24,
            width: 24,
          ),
          label: getTranslate(context, 'bottom_navigation.booking'),
          activeIcon: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: Image.asset(
              "assets/bottomavigation/fluent_ticket-diagonal-16-filled.png",
              height: 24,
              width: 24,
              color: whiteColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: getTranslate(context, 'bottom_navigation.favorites'),
          activeIcon: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.favorite,
              color: whiteColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: getTranslate(context, 'bottom_navigation.profile'),
          activeIcon: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.person,
              color: whiteColor,
            ),
          ),
        ),
      ],
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
