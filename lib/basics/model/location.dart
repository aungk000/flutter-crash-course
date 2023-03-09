import 'package:json_annotation/json_annotation.dart';
import 'location_fact.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final String userItinerarySummary;
  final String tourPackageName;
  final List<LocationFact>? facts;

  Location(
      {required this.id,
      required this.name,
      required this.url,
      required this.userItinerarySummary,
      required this.tourPackageName,
      this.facts});

  Location.blank()
      : id = 0,
        name = '',
        url = '',
        userItinerarySummary = '',
        tourPackageName = '',
        facts = [];

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

//Map<String, dynamic> toJson() => _$LocationToJson(this);
}
