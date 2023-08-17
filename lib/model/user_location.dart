//import 'package:flutter/material.dart';

class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezoneCoordinate timezone;

  UserLocation({
    required this.city,
    required this.coordinates,
    required this.country,
    required this.postcode,
    required this.state,
    required this.street,
    required this.timezone,
  });
}

class LocationCoordinates {
  final String longitude;
  final String latitude;

  LocationCoordinates({required this.latitude, required this.longitude});
}

class LocationTimezoneCoordinate {
  final String offset;
  final String description;

  LocationTimezoneCoordinate({required this.description, required this.offset});
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.name, required this.number});
}
