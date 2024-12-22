import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static upladHotelData() {
    CollectionReference hotelsRef =
        FirebaseFirestore.instance.collection('hotels');

    hotelsRef.add({
      "title": "",
      "rating": 4.8,
      "amenities": [],
      "prices": {},
      "main-image": "",
      "other-images": [],
      "google-map": "",
    }).then((value) {
      print("Upload Success");
    });
  }
}
