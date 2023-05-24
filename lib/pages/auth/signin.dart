// ignore_for_file: must_be_immutable

import 'dart:io';
import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:touravelog/localization/localization_const.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  DateTime? backpressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        backgroundColor: whiteColor,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                imageContainer(size),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightBox(size.height * 0.1),
                      welcomeText(context),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      signinFields(size, context),
                      heightSpace,
                      heightSpace,
                      height5Space,
                      bottomContainer(size, context),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  welcomeText(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'signin.welcome'),
          style: bold20white,
        ),
        Text(
          getTranslate(context, 'signin.sign_continue'),
          style: semibold18white,
        ),
      ],
    );
  }

  bottomContainer(Size size, context) {
    return Column(
      children: [
        arrowButton(size, context),
        heightSpace,
        heightSpace,
        orText(context),
        // heightSpace,
        // heightSpace,
        // socialButtons(size),
        heightSpace,
        heightSpace,
        continueText(context)
      ],
    );
  }

  socialButtons(Size size) {
    return Row(
      children: [
        Expanded(
          child: socialIcon(size, const Color(0xff4A75EB),
              "assets/auth/la_facebook-f.png", "Facebook"),
        ),
        widthSpace,
        widthSpace,
        Expanded(
          child: socialIcon(size, const Color(0xffFB3434),
              "assets/auth/carbon_logo-google.png", "Google"),
        ),
      ],
    );
  }

  socialIcon(Size size, Color color, String icon, String name) {
    return Container(
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: size.height * 0.03,
            width: size.height * 0.03,
            fit: BoxFit.cover,
          ),
          widthSpace,
          Text(name, style: semibold16white)
        ],
      ),
    );
  }

  orText(context) {
    return Text(
      getTranslate(context, 'signin.or_text'),
      style: medium14grey94,
    );
  }

  continueText(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/signup');
      },
      child: const Text(
        " Dont have accaount? SignUp now!",
      ),
    );
  }

  arrowButton(Size size, context) {
    return GestureDetector(
      onTap: () async {
        if (emailController.text.trim() != '' &&
            passwordController.text.trim() != '') {
          try {
            final credential =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            if (credential.user.isNull) {
            } else {
              showSnackBar(context, Icons.done, Colors.greenAccent,
                  "No user found for that email.", Colors.greenAccent);
              Navigator.pushNamed(context, '/bottomNavigation');
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              showSnackBar(context, Icons.cancel_outlined, Colors.red,
                  "No user found for that email.", Colors.red);
            } else if (e.code == 'wrong-password') {
              showSnackBar(context, Icons.cancel_outlined, Colors.red,
                  "Wrong password provided for that user.", Colors.red);
            }
          }
        } else {
          showSnackBar(context, Icons.cancel_outlined, Colors.red,
              "There is empty field!", Colors.red);
        }
      },
      child: Container(
        height: size.height * 0.1,
        width: size.height * 0.1,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Icon(
          Icons.arrow_forward_rounded,
          size: 40,
          color: whiteColor,
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, IconData? icon, Color? iconColor,
      String? message, Color? messageColor) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Text(
                  message!,
                  style: TextStyle(
                    color: messageColor!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      );
  }

  imageContainer(Size size) {
    return Container(
      height: size.height * 0.35,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: primaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const AssetImage("assets/auth/sign.jpg"),
          colorFilter:
              ColorFilter.mode(primaryColor.withOpacity(0.4), BlendMode.dstIn),
        ),
      ),
    );
  }

  signinFields(Size size, context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(fixPadding * 2),
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.6),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            getTranslate(context, 'signup.register'),
            style: semibold22text,
          ),
          heightSpace,
          heightSpace,
          emailField(context),
          heightSpace,
          heightSpace,
          passwordField(context),
        ],
      ),
    );
  }

  emailField(context) {
    return Container(
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
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xff6879DC),
          ),
        ),
        child: TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.email_outlined,
              size: 18,
            ),
            hintText: getTranslate(context, 'signup.email_address'),
            hintStyle: regular14grey,
          ),
        ),
      ),
    );
  }

  passwordField(context) {
    return Container(
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
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xff6879DC),
          ),
        ),
        child: TextField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.password_outlined,
              size: 18,
            ),
            hintText: getTranslate(context, "password"),
            hintStyle: regular14grey,
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
