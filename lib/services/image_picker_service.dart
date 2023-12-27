import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? selectedFile;

  void selectImage() async {
    final XFile? media = await picker.pickMedia();
    if (media != null) {
      getImage(media);
    }
  }

  void getImage(XFile media) {
    selectedFile = media;
    notifyListeners();
  }
}
