import 'dart:convert';
import 'dart:math';

import 'package:crash_course/tourism/data/repository.dart';
import 'package:crash_course/tourism/model/location.dart';
import 'package:crash_course/tourism/network/location_api.dart';
import 'package:test/test.dart';

void main() {
  test('test load location', () {
    var location = LocationRepository.loadLocation(1);
    expect(location, isNotNull);
    expect(location.url, isNotEmpty);
  });

  test('test locations', () {
    var locations = LocationRepository.locations;
    expect(locations, isNotEmpty);
    expect(locations.length, greaterThan(3));
  });

  test('test sample json', () {
    const locationJson = '{'
        '"id": 1,'
        '"name": "Arashiyama Bamboo Grove",'
        '"url": "https://cdn-images-1.medium.com/max/2000/1*vdJuSUKWl_SA9Lp-32ebnA.jpeg",'
        '"facts": [{'
        '"title": "Summary",'
        '"text":"While we could go on about the ethereal glow and seemingly '
        'endless heights of this bamboo grove on the outskirts of Kyoto, '
        'the sight\'s pleasures extend beyond the visual realm"'
        '}]}';

    final locationMap = json.decode(locationJson) as Map<String, dynamic>;
    //expect("Arashiyama Bamboo Grove", equals(locationMap['name']));

    final location = Location.fromJson(locationMap);
    expect(location.name, equals(locationMap['name']));
    expect(location.url, equals(locationMap['url']));
  });

  test('test json', () async {
    final locations = await LocationApi.getAll();
    for(var i in locations) {
      expect(i.userItinerarySummary, isNotNull);
      expect(i.tourPackageName, isNotNull);

      final location = await LocationApi.getLocation(i.id);
      expect(location.name, equals(i.name));
      expect(location.facts, hasLength(greaterThan(0)));
    }
  });
}