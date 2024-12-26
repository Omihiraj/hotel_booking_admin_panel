import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/main.dart';
import 'package:hotel_booking_admin_panel/providers/hotel_form_provider.dart';
import 'package:provider/provider.dart';

class FirebaseStorageService {
  static fileUpload(
    BuildContext context, {
    required Uint8List webImage,
    required String imageName,
    required bool isSingleImageUploading,
  }) async {
    final storageRef = FirebaseStorage.instance.ref();

    if (kIsWeb) {
      final hotelImageRef = storageRef.child("hotel/$imageName");

      //File file = File(imagePath);

      try {
        await hotelImageRef
            .putData(webImage)
            .snapshotEvents
            .listen((taskSnapshot) {
          switch (taskSnapshot.state) {
            case TaskState.running:
              final progress = 100.0 *
                  (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
              print("Upload is $progress% complete.");
              print("Running............");
              if (isSingleImageUploading) {
                context
                    .read<HotelFormProvider>()
                    .updateImageUploadingProgress(value: progress / 100);
              }
              break;
            case TaskState.paused:
              print("Paused");
              break;
            case TaskState.success:
              print("Success");
              hotelImageRef.getDownloadURL().then((value) {
                print("Image URL : $value");

                if (isSingleImageUploading) {
                  context
                      .read<HotelFormProvider>()
                      .addMainImageUrl(mainImageUrl: value);
                } else {
                  context
                      .read<HotelFormProvider>()
                      .addOtherImageUrl(otherImageUrl: value);
                }
              });
              break;
            case TaskState.canceled:
              print("Cancel");
              break;
            case TaskState.error:
              print("Error");
              break;
          }
        });
      } catch (e) {
        print("ERROR :: $e");
      }
    }
  }
}
