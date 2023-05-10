import 'package:crash_course/tourism/app.dart';
import 'package:crash_course/tourism/data/repository.dart';
import 'package:crash_course/tourism/model/location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('test app', (widgetTester) async {
    provideMockedNetworkImages(() async {
      await widgetTester.pumpWidget(TourismApp());
      final location = LocationRepository.loadLocation(1);
      expect(find.text(location.name), findsOneWidget);
      expect(find.text('${location.name}'), findsNothing);
    });
  });
}