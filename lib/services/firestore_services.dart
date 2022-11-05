import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List> getAppliances() async {
    var ref = _db.collection('appliances');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    return data.toList();
  }

  Future<Map<String, dynamic>?> getTomorrowsPrice() async {
    var ref = _db.collection('prices').doc('0GJWNPb5Xa1baSAfvfQt');
    var snapshot = await ref.get();
    var data = snapshot.data();
    return data;
  }
}
