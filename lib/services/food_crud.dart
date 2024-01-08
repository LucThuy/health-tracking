import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('food');

class FoodCrud {
  static Stream<QuerySnapshot> readFoodData() {
    CollectionReference newsItemCollection = _Collection;
    Stream<QuerySnapshot> stream = newsItemCollection.snapshots();
    return stream;
  }
}
