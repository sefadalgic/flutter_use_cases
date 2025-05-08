import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseManager {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('restaurants');

  /// Restaurant verisi ekler
  Future<void> setRestaurant() async {
    await _ref.child('santiago').set({
      "name": "Santiago Coffee",
      "location": "Santiago",
    });
  }

  /// Restaurant listesini okur
  Future<void> fetchCoffeeShops() async {
    final snapshot = await _ref.get();
    if (snapshot.exists) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      print('Data: $data');
    } else {
      print('No data available.');
    }
  }

  /// Belirli bir restorana masa (tables) ekler
  Future<void> writeTables() async {
    await _ref.child('santiago').child('tables').set({
      "table1": {"seats": 4, "available": true},
      "table2": {"seats": 2, "available": false},
    });
  }
}
