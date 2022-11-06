import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> startAppliance(Map<String, dynamic> appliance) async {
    print("appliance: ");
    print(appliance);
    return await http.post(
      Uri.parse(
          'https://us-central1-pennypinch.cloudfunctions.net/applianceCycleTrigger'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{...appliance}),
    );
  }
}
