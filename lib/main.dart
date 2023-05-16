import 'package:touravelog/localization/localization.dart';

import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touravelog/pages/screens.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'localization/localization_const.dart';

import 'pages/review/review.dart';

void main() {
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/onboarding':
            return PageTransition(
                child: const OnboaringScreen(), type: PageTransitionType.fade);
          case '/signin':
            return PageTransition(
                child: SignInScreen(), type: PageTransitionType.rightToLeft);
          case '/signup':
            return PageTransition(
                child: SignUpScreen(), type: PageTransitionType.rightToLeft);
          case '/otp':
            return PageTransition(
                child: const OTPScreen(), type: PageTransitionType.rightToLeft);
          case '/bottomNavigation':
            return PageTransition(
                child: const BottomNavigationScreen(),
                type: PageTransitionType.rightToLeft);
          case '/latestCollection':
            return PageTransition(
                child: LetestCollection(),
                type: PageTransitionType.rightToLeft);
          case '/internationalDestination':
            return PageTransition(
                child: const InternationalDestination(),
                type: PageTransitionType.rightToLeft);
          case '/detail':
            return PageTransition(
                child: const DetailScreen(),
                type: PageTransitionType.rightToLeft);
          case '/thingstodo':
            return PageTransition(
              child: ThingsToDo(),
              type: PageTransitionType.rightToLeft,
            );
          case '/packages':
            return PageTransition(
              child: const Packages(),
              type: PageTransitionType.rightToLeft,
            );
          case '/packagedetail':
            return PageTransition(
              child: const PackageDetail(),
              type: PageTransitionType.rightToLeft,
            );
          case '/restaurantdetail':
            return PageTransition(
              child: const RestaurantDetail(),
              type: PageTransitionType.rightToLeft,
            );
          case '/placedetail':
            return PageTransition(
              child: const PlaceDetail(),
              type: PageTransitionType.rightToLeft,
            );
          case '/search':
            return PageTransition(
              child: const SearchScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/topInternationalDestination':
            return PageTransition(
              child: TopInternationalDestination(),
              type: PageTransitionType.rightToLeft,
            );
          case '/topIndianDestination':
            return PageTransition(
              child: TopIndianDestination(),
              type: PageTransitionType.rightToLeft,
            );
          case '/review':
            return PageTransition(
              child: ReViewScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/similarplace':
            return PageTransition(
              child: const SimilarPlace(),
              type: PageTransitionType.rightToLeft,
            );
          case '/upcomingEvent':
            return PageTransition(
              child: UpcomingEvents(),
              type: PageTransitionType.rightToLeft,
            );
          case '/hoteldetail':
            return PageTransition(
              child: const HotelDetail(),
              type: PageTransitionType.rightToLeft,
            );
          case '/traveldetail':
            return PageTransition(
              child: const TravelDetail(),
              type: PageTransitionType.rightToLeft,
            );
          case '/flights':
            return PageTransition(
              child: const Flights(),
              type: PageTransitionType.rightToLeft,
            );
          case '/selectflights':
            return PageTransition(
              child: const SelectFlights(),
              type: PageTransitionType.rightToLeft,
            );
          case '/flightdetails':
            return PageTransition(
              child: const FlightDetails(),
              type: PageTransitionType.rightToLeft,
            );
          case '/flightTravellarsDetails':
            return PageTransition(
              child: const FlightTravellarsDetails(),
              type: PageTransitionType.rightToLeft,
            );
          case '/creditCard':
            return PageTransition(
              child: const CreditCard(),
              type: PageTransitionType.rightToLeft,
            );
          case '/success':
            return PageTransition(
              child: const SuccessScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/checkinCheckout':
            return PageTransition(
              child: const CheckinCheckout(),
              type: PageTransitionType.rightToLeft,
            );
          case '/notifications':
            return PageTransition(
              child: const NotificationScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/hotel':
            return PageTransition(
              child: const HotelScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/hotelfind':
            return PageTransition(
              child: const HotelFind(),
              type: PageTransitionType.rightToLeft,
            );
          case '/selectroom':
            return PageTransition(
              child: const SelectRoom(),
              type: PageTransitionType.rightToLeft,
            );
          case '/holidayPackages':
            return PageTransition(
              child: HolidayPackages(),
              type: PageTransitionType.rightToLeft,
            );
          case '/editProfile':
            return PageTransition(
              child: const EditProfile(),
              type: PageTransitionType.rightToLeft,
            );
          case '/booking':
            return PageTransition(
              child: const BookingScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/flightTicketOngoing':
            return PageTransition(
              child: const FlightTicketOngoing(),
              type: PageTransitionType.rightToLeft,
            );
          case '/flightTicketHistroy':
            return PageTransition(
              child: const FlightTicketHistory(),
              type: PageTransitionType.rightToLeft,
            );

          case '/hotelBookingOngoing':
            return PageTransition(
              child: const HotelBookingOngoning(),
              type: PageTransitionType.rightToLeft,
            );
          case '/hotelBookingHistory':
            return PageTransition(
              child: const HotelBookingHistory(),
              type: PageTransitionType.rightToLeft,
            );
          case '/holidayOngoing':
            return PageTransition(
              child: const HolidayOngoning(),
              type: PageTransitionType.rightToLeft,
            );
          case '/holidayHistory':
            return PageTransition(
              child: const HolidayHistory(),
              type: PageTransitionType.rightToLeft,
            );
          case '/settings':
            return PageTransition(
              child: const SettingScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/legalInformation':
            return PageTransition(
              child: const LegalInformation(),
              type: PageTransitionType.rightToLeft,
            );
          case '/aboutus':
            return PageTransition(
              child: const AboutUs(),
              type: PageTransitionType.rightToLeft,
            );
          case '/feedback':
            return PageTransition(
              child: const FeedbackScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/languages':
            return PageTransition(
              child: const LanguagesScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/writeMessage':
            return PageTransition(
              child: const WriteMessageScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/location':
            return PageTransition(
              child: const LocationScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/pickLocation':
            return PageTransition(
              child: const PickLocation(),
              type: PageTransitionType.rightToLeft,
            );
          default:
            return null;
        }
      },
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('id'),
        Locale('zh'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale?.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
