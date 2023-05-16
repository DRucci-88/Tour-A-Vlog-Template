import 'dart:async';

import 'package:touravelog/localization/localization_const.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readmore/readmore.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({Key? key}) : super(key: key);

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  bool isFavorite = false;

  final similarPlaces = [
    {
      "image": "assets/restaurantdetail/similarplace1.png",
      "name": "Laughing Buddha Bar",
      "isfavorite": false
    },
    {
      "image": "assets/restaurantdetail/similarplace2.png",
      "name": "Ku De Ta",
      "isfavorite": false
    },
    {
      "image": "assets/restaurantdetail/similarplace3.png",
      "name": "Hilton food special",
      "isfavorite": false
    },
    {
      "image": "assets/restaurantdetail/similarplace4.png",
      "name": "Mason",
      "isfavorite": false
    },
  ];

  bool? issimilarFavorite;
  Completer<GoogleMapController> mapcontroller = Completer();

  static CameraPosition locationposition =
      const CameraPosition(target: LatLng(51.5072, 0.1276), zoom: 10.46);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            backgroundColor: primaryColor,
            expandedHeight: size.height * 0.3,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: whiteColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      isFavorite = !isFavorite;
                    },
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: blackColor,
                      content: isFavorite == true
                          ? Text(getTranslate(
                              context, 'favorite_add_remove.added_favorites'))
                          : Text(getTranslate(context,
                              'favorite_add_remove.removed_favorites')),
                      duration: const Duration(milliseconds: 1500),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 22,
                  color: whiteColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: whiteColor,
                  size: 22,
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/restaurantdetail/Rectangle 138.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                heightSpace,
                heightSpace,
                detailInfo(),
                heightSpace,
                detailText(),
                heightSpace,
                time(),
                heightSpace,
                location(size),
                heightSpace,
                similarPlacesList(size),
                heightSpace,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslate(context, 'restaurant_detail.review'),
                        style: semibold16black,
                      ),
                      heightSpace,
                      reviewdetail(size, "assets/restaurantdetail/review1.png"),
                      heightSpace,
                      reviewdetail(size, "assets/restaurantdetail/review2.png"),
                    ],
                  ),
                ),
                heightSpace,
                heightSpace,
              ],
            ),
          )
        ],
      ),
    );
  }

  reviewdetail(Size size, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: size.height * 0.06,
                      width: size.height * 0.06,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                    widthSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jeni patel",
                          style: semibold16black,
                        ),
                        height5Space,
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star_sharp,
                                size: 16,
                                color: starColor,
                              )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
        height5Space,
        const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Leo ut in euismod gravida enim aenean. Fermentum, potenti facilisis quis facilisi amet, natoque molestie. Amet leo vitae sed nec, tincidunt adipiscing pretium justo. ",
            style: medium12grey94)
      ],
    );
  }

  similarPlacesList(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          child: Text(
            getTranslate(context, 'restaurant_detail.similar_places'),
            style: semibold16black,
          ),
        ),
        heightSpace,
        SizedBox(
          height: size.height * 0.28,
          child: ListView.builder(
            itemCount: similarPlaces.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: fixPadding),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: fixPadding, vertical: fixPadding / 2),
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: grey94Color.withOpacity(0.5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(fixPadding),
                          ),
                          child: Image.asset(
                            similarPlaces[index]['image'].toString(),
                            height: size.height * 0.175,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                issimilarFavorite =
                                    similarPlaces[index]['isfavorite'] as bool;
                                similarPlaces[index]['isfavorite'] =
                                    !issimilarFavorite!;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: blackColor,
                                  content: similarPlaces[index]['isfavorite'] ==
                                          true
                                      ? Text(getTranslate(context,
                                          'favorite_add_remove.added_favorites'))
                                      : Text(getTranslate(context,
                                          'favorite_add_remove.removed_favorites')),
                                  duration: const Duration(milliseconds: 1500),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            icon: Icon(
                              similarPlaces[index]['isfavorite'] == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding / 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              similarPlaces[index]['name'].toString(),
                              style: medium14black,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 5; i++)
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: starColor,
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  location(size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'restaurant_detail.location'),
            style: semibold16black,
          ),
          height5Space,
          Row(
            children: const [
              Icon(
                Icons.location_on_outlined,
                color: grey94Color,
                size: 22,
              ),
              widthSpace,
              Expanded(
                child: Text(
                  "4517 Washington Ave. Manchester, Kentucky 39495",
                  style: medium14grey94,
                ),
              )
            ],
          ),
          height5Space,
          Stack(
            children: [
              Container(
                height: size.height * 0.27,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    initialCameraPosition: locationposition,
                    onMapCreated: (GoogleMapController controller) {
                      mapcontroller.complete(controller);
                    },
                    markers: {
                      const Marker(
                        markerId: MarkerId("London"),
                        position: LatLng(51.5072, 0.1276),
                      )
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/location');
                },
                child: Container(
                  height: size.height * 0.27,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  time() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'restaurant_detail.opening_time'),
            style: semibold16black,
          ),
          height5Space,
          const Text(
            "10:00 AM to 10:00 PM",
            style: medium14grey94,
          )
        ],
      ),
    );
  }

  detailText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'restaurant_detail.details'),
            style: semibold16black,
          ),
          height5Space,
          const ReadMoreText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque faucibus nullam accumsan cras nunc viverra pharetra. Natoque blandit pretium, molestie enim, vel. Eget donec arcu vitae aliquet. Hac quis tortor erat augue. Et orci, sit enim lectus. Neque sem quis porta id maecenas purus nibh egestas. Dictumst dolor consequat cursus integer sagittis donec sed Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: medium14grey94,
            lessStyle: medium14primary,
            moreStyle: medium14primary,
          )
        ],
      ),
    );
  }

  detailInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Barbacoa food",
            style: semibold18primary,
          ),
          height5Space,
          RichText(
            text: TextSpan(
              text: "Bali",
              style: semibold16black.copyWith(color: grey94Color),
              children: const [
                TextSpan(text: "(Indonesia)", style: regular14grey),
              ],
            ),
          ),
          height5Space,
          Row(
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  Icons.star,
                  size: 18,
                  color: (i < 4) ? starColor : grey94Color,
                )
            ],
          ),
        ],
      ),
    );
  }
}
