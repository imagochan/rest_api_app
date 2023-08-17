class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.coordinates,
    required this.country,
    required this.postcode,
    required this.state,
    required this.street,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coordinates = LocationCoordinate(
        latitude: json['coordinates']['latitude'],
        longitude: json['coordinates']['longitude']);
    final street = LocationStreet(
        name: json['street']['name'], number: json['street']['number']);
    final timezone = LocationTimezone(
        description: json['timezone']['description'],
        offset: json['timezone']['offset']);
    return UserLocation(
        city: json['city'],
        coordinates: coordinates,
        country: json['country'],
        postcode: json['postcode'].toString(),
        state: json['state'],
        street: street,
        timezone: timezone); //some post codes are strings
  }
}

class LocationCoordinate {
  final String longitude;
  final String latitude;

  LocationCoordinate({required this.latitude, required this.longitude});
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({required this.description, required this.offset});
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.name, required this.number});
}
