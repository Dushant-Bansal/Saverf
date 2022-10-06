// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class FirestoreController {
  static Future<DocumentReference<Map<String, dynamic>>> addSellOrder(
          Map<String, String> map) =>
      db
          .collection('sell_orders')
          .add(map)
          .timeout(const Duration(seconds: 10));

  static Stream<QuerySnapshot> getStream() => db
      .collection('sell_orders')
      .orderBy('time', descending: true)
      .snapshots();

  static Stream<QuerySnapshot> searchQuery(String search) => db
      .collection('sell_orders')
      .where('Restaurant Address', isGreaterThanOrEqualTo: search)
      .where('Restaurant Address', isLessThanOrEqualTo: '$search\uf7ff')
      .snapshots();
}
