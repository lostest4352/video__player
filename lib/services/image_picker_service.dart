import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? selectedFile;

  // For images
  void selectImage() async {
    final XFile? media = await picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      getImage(media);
    }
  }

  void getImage(XFile media) {
    selectedFile = media;
    notifyListeners();
  }

  // For videos
  void selectVideo() async {
    final XFile? media = await picker.pickVideo(source: ImageSource.gallery);
    if (media != null) {
      getImage(media);
    }
  }

  void getVideo(XFile media) {
    selectedFile = media;
    notifyListeners();
  }
}
