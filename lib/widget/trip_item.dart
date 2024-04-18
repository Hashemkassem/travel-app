import 'package:flutter/material.dart';
import 'package:new_tic/models/trips.dart';
import 'package:new_tic/screens/trip_screen_detailes.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.title,
    required this.imagurl,
    required this.dacoration,
    required this.type,
    required this.season,
    required this.id,
    //required this.removeitem
  });
  final String id;
  final String title;
  final String imagurl;
  final int dacoration;
  final TripType type;
  final Season season;
  //final Function removeitem;

  String get triptypetext {
    switch (type) {
      case TripType.Activities:
        return "Activities";
        // ignore: dead_code
        break;
      case TripType.Exploration:
        return "Exploration";
        // ignore: dead_code
        break;
      case TripType.Recovery:
        return "Recovery";
        // ignore: dead_code
        break;
      case TripType.Therapy:
        return "Therapy";
        // ignore: dead_code
        break;
      default:
        return "Error";
    }
  }

  String get seasoneText {
    switch (season) {
      case Season.Winter:
        return "Winter";
        // ignore: dead_code
        break;
      case Season.Summer:
        return "Summer";
        // ignore: dead_code
        break;
      case Season.Spring:
        return "Spring";
        // ignore: dead_code
        break;
      case Season.Autumn:
        return "Autumn";
        // ignore: dead_code
        break;
      default:
        return "Error";
    }
  }

  // ignore: non_constant_identifier_names
  void SelectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TripDetailesScreen.screenRout, arguments: id)
        .then((value) {
      if (value != null) {
        // removeitem(value);
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imagurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8)
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 250,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("Days $dacoration")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.sunny,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(seasoneText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(triptypetext)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
