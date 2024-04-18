// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:new_tic/widget/trip_item.dart';

import '../models/trips.dart';

class CatoTrips extends StatefulWidget {
  const CatoTrips({super.key, required this.avaliabletrips});
  static const screenrout = '/cato_trips';

  final List<Trip> avaliabletrips;

  @override
  State<CatoTrips> createState() => _CatoTripsState();
}

class _CatoTripsState extends State<CatoTrips> {
  late String catotitle;
  late List<Trip> display;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final roudargumant =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catoid = roudargumant['id'];
    catotitle = roudargumant['title']!;
    display = widget.avaliabletrips.where(
      (trip) {
        return trip.categories.contains(catoid);
      },
    ).toList();
    super.didChangeDependencies();
  }

  void _removefunction(String tripid) {
    setState(() {
      display.removeWhere((element) => element.id == tripid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          catotitle,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: display.length,
          itemBuilder: (context, index) {
            return TripItem(
              id: display[index].id,
              title: display[index].title,
              imagurl: display[index].imageUrl,
              dacoration: display[index].duration,
              type: display[index].tripType,
              season: display[index].season,
              //removeitem: _removefunction,
            );
          }),
    );
  }
}
