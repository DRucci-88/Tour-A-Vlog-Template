import 'dart:async';
import 'dart:io';

import 'package:touravelog/localization/localization_const.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController firstController = TextEditingController();

  TextEditingController secondController = TextEditingController();

  TextEditingController thirdController = TextEditingController();

  TextEditingController fourController = TextEditingController();

  late AnimationController colorController;

  @override
  void initState() {
    colorController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
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
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: const Color(0xffC4C4C4).withOpacity(0.1),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                    padding: const EdgeInsets.all(fixPadding * 2),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.25),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        verificationText(),
                        heightSpace,
                        verificationFields(size, context),
                        heightSpace,
                        heightSpace,
                        confirmButton(context, size),
                        resendbutton()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  resendbutton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        getTranslate(context, 'otp.resend'),
        style: semibold16primary,
      ),
    );
  }

  confirmButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Timer(const Duration(seconds: 3),
            () => Navigator.pushNamed(context, '/bottomNavigation'));
        pleaseWaitDailog(context, size);
      },
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff5370E7).withOpacity(0.25),
              blurRadius: 5,
            )
          ],
          gradient: const LinearGradient(
            colors: gradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'otp.confirm'),
          style: semibold18white.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  verificationFields(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        firstField(size, context),
        secondField(size, context),
        thirdField(size, context),
        fourthField(size, context)
      ],
    );
  }

  verificationText() {
    return Column(
      children: [
        Text(
          getTranslate(context, 'otp.verification'),
          style: semibold22text.copyWith(color: primaryColor),
        ),
        heightSpace,
        Text(
          getTranslate(context, 'otp.verification_text'),
          style: regular14grey.copyWith(
            color: const Color(0xff8D8D8D),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  fourthField(Size size, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(fixPadding),
      width: size.height * 0.065,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        cursorColor: primaryColor,
        controller: fourController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            Timer(const Duration(seconds: 3),
                () => Navigator.pushNamed(context, '/bottomNavigation'));
            pleaseWaitDailog(context, size);
          }
        },
      ),
    );
  }

  pleaseWaitDailog(BuildContext context, Size size) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: blackColor.withOpacity(0.2),
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
                width: size.height * 0.05,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: secondaryColor,
                  strokeWidth: 3,
                  valueColor: colorController.drive(
                    ColorTween(begin: primaryColor, end: secondaryColor),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(getTranslate(context, 'otp.please_wait'),
                  style: semibold18black)
            ],
          ),
        );
      },
    );
  }

  thirdField(Size size, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(fixPadding),
      width: size.height * 0.065,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        cursorColor: primaryColor,
        controller: thirdController,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  secondField(Size size, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(fixPadding),
      width: size.height * 0.065,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        cursorColor: primaryColor,
        controller: secondController,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  firstField(Size size, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(fixPadding),
      width: size.height * 0.065,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      alignment: Alignment.center,
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          cursorColor: primaryColor,
          controller: firstController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }

  onWillPop() {
    Navigator.popAndPushNamed(context, '/signin');
  }
}
