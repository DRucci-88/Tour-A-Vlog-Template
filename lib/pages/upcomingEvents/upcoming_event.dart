import 'package:touravelog/localization/localization_const.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  UpcomingEvents({Key? key}) : super(key: key);

  final upcomingevents = [
    {
      "image": "assets/upcomingEvent/Rectangle 115.png",
      "title": "Kite festival",
      "place": "Jaipur,rajasthan",
      "date": "13 feb-16 feb",
    },
    {
      "image": "assets/upcomingEvent/Rectangle 115 (1).png",
      "title": "Best Dussehara",
      "place": "Bastar,chhattisgarh",
      "date": "27 sep-6 oct",
    },
    {
      "image": "assets/upcomingEvent/Rectangle 115 (2).png",
      "title": "Kathina puja",
      "place": "Bodhgaya, bihar",
      "date": "8 oct-9 oct ",
    },
    {
      "image": "assets/upcomingEvent/Rectangle 115 (3).png",
      "title": "Sharad Navratri",
      "place": "Vadodara,gujrat",
      "date": "20 oct-21oct",
    },
    {
      "image": "assets/upcomingEvent/Rectangle 115 (4).png",
      "title": "Gangaur festival",
      "place": "Jaipur,rajasthan",
      "date": "18 mar-4 apr",
    },
    {
      "image": "assets/upcomingEvent/Rectangle 115 (5).png",
      "title": "Lohri",
      "place": "Panjab ,india",
      "date": "18 oct-19 oct",
    },
    {
      "image": "assets/upcomingEvent/Rectangle 115 (6).png",
      "title": "Durga puja",
      "place": "Kolkata, west bangal",
      "date": "1 oct-6 oct",
    },
    {
      "image": "assets/upcomingEvent/Rectangle 115 (7).png",
      "title": "Govardhan Puja",
      "place": "Jaisalmer, Rajasthan",
      "date": "8 oct-9 oct ",
    },
  ];

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
          icon: const Icon(Icons.arrow_back_ios, size: 22, color: whiteColor),
        ),
        titleSpacing: 0,
        title: Text(
          getTranslate(context, 'upcoming_event.upcoming_events'),
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
      body: GridView.builder(
        padding: const EdgeInsets.all(fixPadding * 2),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: fixPadding * 2,
          crossAxisSpacing: fixPadding * 2,
          childAspectRatio: size.width / (size.height / 1.6),
        ),
        itemCount: upcomingevents.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail');
            },
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: grey94Color.withOpacity(0.5),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      upcomingevents[index]['image'].toString(),
                      height: size.height * 0.15,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(fixPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            upcomingevents[index]['title'].toString(),
                            style: semibold14black.copyWith(fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            upcomingevents[index]['place'].toString(),
                            style: medium12grey94.copyWith(fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            upcomingevents[index]['date'].toString(),
                            style: medium12grey94.copyWith(fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
