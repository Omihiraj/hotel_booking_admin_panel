import 'package:flutter/material.dart';

class HotelFormProvider extends ChangeNotifier {
  List<String> _amenities = [];
  double _ipmageUploadingProgress = 0;
  Map<String, dynamic> _priceList = {};

  addNewAmenity({required String amenity}) {
    _amenities.add(amenity);
    notifyListeners();
  }

  removeAmenity({required String amenity}) {
    _amenities.remove(amenity);
    notifyListeners();
  }

  updateImageUploadingProgress({required double value}) {
    _ipmageUploadingProgress = value;
    notifyListeners();
  }

  addPrice(Map<String, dynamic> price) {
    _priceList.addAll(price);
    notifyListeners();
  }

  removePrice(String key) {
    _priceList.remove(key);
    notifyListeners();
  }

  List<String> get allSelectedAmenities => _amenities;

  double get progress => _ipmageUploadingProgress;

  Map<String, dynamic> get allPackagePrice => _priceList;
}
