import 'package:touravelog/localization/localization_const.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckinCheckout extends StatefulWidget {
  const CheckinCheckout({Key? key}) : super(key: key);

  @override
  State<CheckinCheckout> createState() => _CheckinCheckoutState();
}

class _CheckinCheckoutState extends State<CheckinCheckout> {
  var checkInDate = DateTime.now();
  var checkoutDate = DateTime.now();

  int noOfRoom = 0;

  int adultNo = 0;

  int kidsNo = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          getTranslate(context, 'checkin_checkout.checkin_checkout'),
          style: semibold18white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2),
        children: [
          checkInDateContainer(context, size),
          heightSpace,
          heightSpace,
          checkOutDateContainer(context, size),
          heightSpace,
          heightSpace,
          numberOfRooms(size),
          heightSpace,
          heightSpace,
          adults(size),
          heightSpace,
          heightSpace,
          kids(size),
        ],
      ),
    );
  }

  kids(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          iconContainer(size, Icons.accessibility_new_rounded),
          widthSpace,
          width5Space,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslate(context, 'checkin_checkout.kids'),
                style: medium14grey94,
              ),
              height5Space,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (kidsNo > 0) {
                          kidsNo--;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(fixPadding / 3),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        color: blackColor,
                        size: 13,
                      ),
                    ),
                  ),
                  widthSpace,
                  Text(
                    kidsNo.toString(),
                    style: semibold14black,
                  ),
                  widthSpace,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        kidsNo++;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(fixPadding / 3),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        color: blackColor,
                        size: 13,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  adults(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          iconContainer(size, Icons.person),
          widthSpace,
          width5Space,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslate(context, 'checkin_checkout.adult'),
                style: medium14grey94,
              ),
              height5Space,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (adultNo > 0) {
                          adultNo--;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(fixPadding / 3),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        color: blackColor,
                        size: 13,
                      ),
                    ),
                  ),
                  widthSpace,
                  Text(
                    adultNo.toString(),
                    style: semibold14black,
                  ),
                  widthSpace,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        adultNo++;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(fixPadding / 3),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        color: blackColor,
                        size: 13,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  numberOfRooms(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          iconContainer(size, Icons.meeting_room_outlined),
          widthSpace,
          width5Space,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslate(context, 'checkin_checkout.Number_room'),
                style: medium14grey94,
              ),
              height5Space,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (noOfRoom > 0) {
                          noOfRoom--;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(fixPadding / 3),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        color: blackColor,
                        size: 13,
                      ),
                    ),
                  ),
                  widthSpace,
                  Text(
                    noOfRoom.toString(),
                    style: semibold14black,
                  ),
                  widthSpace,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        noOfRoom++;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(fixPadding / 3),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: grey94Color.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        color: blackColor,
                        size: 13,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  checkInDateContainer(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () async {
        var pickkedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(primary: primaryColor),
                ),
                child: child!,
              );
            });
        if (pickkedDate != null) {
          setState(() {
            checkInDate = pickkedDate;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: fixPadding, horizontal: fixPadding * 2),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.5),
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          children: [
            iconContainer(size, Icons.date_range_outlined),
            width5Space,
            widthSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTranslate(context, 'checkin_checkout.check_date'),
                    style: medium14grey94,
                  ),
                  height5Space,
                  Text(
                    DateFormat("dd MMM, yyyy ",
                            Localizations.localeOf(context).toString())
                        .format(checkInDate),
                    style: medium14black,
                  )
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: grey94Color,
            )
          ],
        ),
      ),
    );
  }

  checkOutDateContainer(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () async {
        var pickkedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(primary: primaryColor),
                ),
                child: child!,
              );
            });
        if (pickkedDate != null) {
          setState(() {
            checkoutDate = pickkedDate;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: fixPadding, horizontal: fixPadding * 2),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.5),
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          children: [
            iconContainer(
              size,
              Icons.date_range_outlined,
            ),
            width5Space,
            widthSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTranslate(context, 'checkin_checkout.check_date'),
                    style: medium14grey94,
                  ),
                  height5Space,
                  Text(
                    DateFormat("dd MMM, yyyy ",
                            Localizations.localeOf(context).toString())
                        .format(checkoutDate),
                    style: medium14black,
                  )
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: grey94Color,
            )
          ],
        ),
      ),
    );
  }

  iconContainer(Size size, IconData icon) {
    return Container(
      height: size.height * 0.045,
      width: size.height * 0.045,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: whiteColor,
        size: 20,
      ),
    );
  }
}
