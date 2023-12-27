import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? selectedImage;
  XFile? selectedVideo;

  // For images
  void selectImage() async {
    final XFile? media = await picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      getImage(media);
    }
  }

  void getImage(XFile media) {
    selectedImage = media;
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
    selectedVideo = media;
    notifyListeners();
  }
}
