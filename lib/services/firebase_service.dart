import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_admin_panel/models/hotel.dart';
import 'package:hotel_booking_admin_panel/widgets/popup_screen.dart';

class FirebaseService {
  static upladHotelData(context, {required Hotel hotel}) {
    CollectionReference hotelsRef =
        FirebaseFirestore.instance.collection('hotels');

    hotelsRef.add({
      "title": hotel.title,
      "rating": 4.8,
      "amenities": hotel.amenities,
      "prices": hotel.prices,
      "main-image": hotel.mainImage,
      "other-images": hotel.otherImages,
      "google-map": hotel.googleMapLocationUrl,
    }).then((value) {
      print("Upload Success");
      PopupScreen.showMyDialog(context, isSuccess: true);
    }).catchError((e) {
      PopupScreen.showMyDialog(context, isSuccess: false);
      print("Error Occured $e");
    });
  }
}
