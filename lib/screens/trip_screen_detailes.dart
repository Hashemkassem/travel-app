import 'package:flutter/material.dart';
import 'package:new_tic/app_data.dart';

class TripDetailesScreen extends StatelessWidget {
  const TripDetailesScreen(
      {super.key, required this.mangefavorate, required this.isfavorate});

  final Function mangefavorate;
  final Function isfavorate;

  static const screenRout = '/trip_details';
  @override
  Widget build(BuildContext context) {
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip =
        Trips_data.firstWhere((element) => element.id == tripid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // ignore: unnecessary_string_interpolations
        title: Text('${selectedTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    selectedTrip.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // ignore: avoid_unnecessary_containers
              buildSectionTitle(context, "Activities"),
              buildListveiwcontainer(
                ListView.builder(
                    itemCount: selectedTrip.activities.length,
                    itemBuilder: (context, index) => Card(
                          elevation: 0.3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Text(selectedTrip.activities[index]),
                          ),
                        )),
              ),
              const SizedBox(height: 10),
              buildSectionTitle(context, "Daily Programe"),
              buildListveiwcontainer(
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: selectedTrip.program.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                            'Day ${index + 1}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                        title: Text(selectedTrip.program[index]),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          isfavorate(tripid) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
        onPressed: () {
          mangefavorate(tripid);
        },
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String titletext) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topLeft,
      child: Text(
        titletext,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildListveiwcontainer(Widget child) {
    return Container(
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: child);
  }
}
