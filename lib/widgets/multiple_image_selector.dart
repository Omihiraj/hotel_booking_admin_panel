import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/firebase_storage_service.dart';

class MultipleImageSelector extends StatefulWidget {
  const MultipleImageSelector({
    super.key,
  });

  @override
  State<MultipleImageSelector> createState() => _MultipleImageSelectorState();
}

class _MultipleImageSelectorState extends State<MultipleImageSelector> {
  List<Uint8List> selectedImagesList = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            final ImagePicker picker = ImagePicker();
            final List<XFile> images = await picker.pickMultiImage();
            for (var image in images) {
              var readImage = await image.readAsBytes();
              selectedImagesList.add(readImage);
            }
            setState(() {});
          },
          child: Container(
            width: 600,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Center(
              child: selectedImagesList.isEmpty
                  ? const Text(
                      "Select Other Images",
                    )
                  : GridView.builder(
                      itemCount: selectedImagesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        print(index);
                        return Image.memory(
                          selectedImagesList[index],
                        );
                      },
                    ),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              if (selectedImagesList.isNotEmpty) {
                for (var image in selectedImagesList) {
                  FirebaseStorageService.fileUpload(
                    context,
                    webImage: image,
                    imageName: "hotel_image_${DateTime.now()}",
                    isSingleImageUploading: false,
                  );
                }
              }
            },
            child: const Text("Upload Selected Images"))
      ],
    );
  }
}
