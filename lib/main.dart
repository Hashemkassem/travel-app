import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:new_tic/app_data.dart';
import 'package:new_tic/screens/catagores_trips.dart';
import 'package:new_tic/screens/filters_screen.dart';
import 'package:new_tic/screens/splash_screen.dart';
import 'package:new_tic/screens/tap_screen.dart';
import 'package:new_tic/screens/trip_screen_detailes.dart';

import 'models/trips.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false
  };

  List<Trip> _avaliabletrips = Trips_data;
  List<Trip> _favoritTrips = [];
  void _changefilers(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avaliabletrips = Trips_data.where(
        //هون الشرطين : الأول اذا كان الزر يلي انضغط اتفعل صار ترو و الشرط الثاني: والعنصر الممر الي من ملف البيانات بساويه حقق الشرط
        (element) {
          if (_filters['summer'] == true && element.isInSummer != true) {
            return false;
          }
          if (_filters['winter'] == true && element.isInWinter != true) {
            return false;
          }
          if (_filters['family'] == true && element.isForFamilies != true) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _mangefavorate(String tripid) {
    final exitindex =
        //وظيفة indexWhere هي بكل بساطةانو يتحقق من رقم العنصر اذا موجود بالقائمة وبساوي العنصر يلي تم تمريره الي انو بس شوفو
        _favoritTrips.indexWhere((element) => element.id == tripid);
    //exitindex >= 0 تعني اذا كان العنصر موجود بالقائمة فحقق الشرط
    if (exitindex >= 0) {
      setState(() {
        _favoritTrips.removeAt(exitindex);
      });
    } else {
      setState(() {
        _favoritTrips
            .add(Trips_data.firstWhere((element) => element.id == tripid));
      });
    }
  }

  bool _isfavorate(String idtrip) {
    return _favoritTrips.any((element) => element.id == idtrip);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ScondScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TapsScreen(favoriteTrips: _favoritTrips),
        CatoTrips.screenrout: (context) => CatoTrips(
              avaliabletrips: _avaliabletrips,
            ),
        TripDetailesScreen.screenRout: (context) => TripDetailesScreen(
            mangefavorate: _mangefavorate, isfavorate: _isfavorate),
        FilterScreen.sereenfilterRout: (context) => FilterScreen(
              currentfilters: _filters,
              savfilter: _changefilers,
            ),
      },
    );
  }
}
