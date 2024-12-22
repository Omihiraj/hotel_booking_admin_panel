class Hotel {
  String? title;
  double rating = 5.0;
  List<String>? amenities;
  Map<String, dynamic>? prices;
  String? mainImage;
  List<String>? otherImages;
  String? googleMapLocationUrl;

  Hotel({
    this.title,
    this.amenities,
    this.prices,
    this.mainImage,
    this.otherImages,
    this.googleMapLocationUrl,
  });
}
