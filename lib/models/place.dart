import 'dart:io';

class Place {
  final String id;
  final String name;
  final File image;
  // final Location placeLocation;

  Place({
    required this.id,
    required this.name,
    required this.image,
    // required this.placeLocation,
  });
}

class Location {
  final double latitude;
  final double longitude;
  final String address;
  Location({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
