import 'package:flutter/material.dart';
import 'package:new_tic/screens/catagores_trips.dart';

// ignore: camel_case_types
class Catao_item extends StatelessWidget {
  final String id;
  final String title;
  final String imagurl;
  const Catao_item(
      {super.key,
      required this.title,
      required this.imagurl,
      required this.id});

  // ignore: non_constant_identifier_names
  void Selectcatogris(BuildContext context) {
    Navigator.of(context).pushNamed(CatoTrips.screenrout, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Selectcatogris(context),
      splashColor: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imagurl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ))
        ],
      ),
    );
  }
}
