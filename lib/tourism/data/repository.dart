import '../model/location.dart';
import '../model/location_fact.dart';

class LocationRepository {
  static List<Location> locations = [
    Location(
        id: 1,
        name: 'Arashiyama Bamboo Grove',
        url:
            'https://cdn-images-1.medium.com/max/2000/1*vdJuSUKWl_SA9Lp-32ebnA.jpeg',
        userItinerarySummary: "Day 1: 2PM - 3:30PM",
        tourPackageName: "Premium Package",
        facts: [
          LocationFact(
              title: 'Summary',
              text:
                  'While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm'),
          LocationFact(
              title: 'How to Get There',
              text:
                  'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.')
        ]),
    Location(
        id: 2,
        name: 'Mount Fuji',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/6/63/Views_of_Mount_Fuji_from_%C5%8Cwakudani_20211202.jpg',
        userItinerarySummary: "Day 1: 2PM - 3:30PM",
        tourPackageName: "Standard Package",
        facts: [
          LocationFact(
              title: 'Summary',
              text:
                  'While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm'),
          LocationFact(
              title: 'How to Get There',
              text:
                  'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.')
        ])
  ];

  static Location loadLocation(int id) {
    return locations.singleWhere((location) => location.id == id);
  }
}
