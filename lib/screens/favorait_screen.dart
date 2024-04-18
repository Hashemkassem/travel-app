import 'package:flutter/material.dart';

import '../models/trips.dart';
import '../widget/trip_item.dart';

class FavoraitScreen extends StatelessWidget {
  const FavoraitScreen({super.key, required this.favoteTrips});
  final List<Trip> favoteTrips;
  @override
  Widget build(BuildContext context) {
    if (favoteTrips.isEmpty) {
      return Center(
        child: Text(
          "NO TRIPS YET",
          style: TextStyle(fontSize: 30, color: Colors.grey[700]),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: favoteTrips.length,
          itemBuilder: (context, index) {
            return TripItem(
              id: favoteTrips[index].id,
              title: favoteTrips[index].title,
              imagurl: favoteTrips[index].imageUrl,
              dacoration: favoteTrips[index].duration,
              type: favoteTrips[index].tripType,
              season: favoteTrips[index].season,
              //removeitem: _removefunction,
            );
          });
    }
  }
}
