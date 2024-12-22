import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/main.dart';
import 'package:hotel_booking_admin_panel/providers/hotel_form_provider.dart';
import 'package:hotel_booking_admin_panel/services/firebase_storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainImageSelector extends StatefulWidget {
  const MainImageSelector({
    super.key,
  });

  @override
  State<MainImageSelector> createState() => _MainImageSelectorState();
}

class _MainImageSelectorState extends State<MainImageSelector> {
  File? selectedImage;
  Uint8List webImage = Uint8List(10);

  String selectedImageName = "";
  String selectedImagePath = "";

  bool isPressedUpload = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            final ImagePicker picker = ImagePicker();

            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            var selectedFile = await image!.readAsBytes();

            setState(() {
              isPressedUpload = false;
              selectedImage = File("a");
              webImage = selectedFile;
              selectedImageName = image.name;
              selectedImagePath = image.path;
            });

            print("Name : ${image.name} Path: ${image.path}");
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: selectedImage == null
                ? const Center(
                    child: Text("Choose a picture"),
                  )
                : Image.memory(
                    webImage,
                    width: 100,
                    height: 100,
                  ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              isPressedUpload = true;
            });
            FirebaseStorageService.fileUpload(
              context,
              imageName: selectedImageName,
              webImage: webImage,
              isSingleImageUploading: true,
            );
          },
          child: Column(
            children: [
              const Text("Upload"),
              const SizedBox(
                height: 20,
              ),
              ...[
                if (isPressedUpload)
                  LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 14.0,
                    percent: context.watch<HotelFormProvider>().progress,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
              ]
            ],
          ),
        )
      ],
    );
  }
}
