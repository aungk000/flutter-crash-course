import '../model/counter.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedCounter extends Model {
  final counter1 = Counter();
  final counter2 = Counter();
  final counter3 = Counter();

  void increment() {
    counter1.count += 3;
    counter2.count += 5;
    counter3.count += 10;

    notifyListeners();
  }
}