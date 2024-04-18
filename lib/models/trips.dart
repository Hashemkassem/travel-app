enum Season {
  // ignore: constant_identifier_names
  Winter,
  // ignore: constant_identifier_names
  Spring,
  // ignore: constant_identifier_names
  Summer,
  // ignore: constant_identifier_names
  Autumn,
}

enum TripType {
  // ignore: constant_identifier_names
  Exploration,
  // ignore: constant_identifier_names
  Recovery,
  // ignore: constant_identifier_names
  Activities,
  // ignore: constant_identifier_names
  Therapy,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final TripType tripType;
  final Season season;
  final String imageUrl;
  final int duration;
  final List<String> activities;
  final List<String> program;
  final bool isInSummer;
  final bool isForFamilies;
  final bool isInWinter;

  const Trip(
      {required this.id,
      required this.categories,
      required this.title,
      required this.tripType,
      required this.season,
      required this.imageUrl,
      required this.duration,
      required this.activities,
      required this.program,
      required this.isInSummer,
      required this.isForFamilies,
      required this.isInWinter});
}
