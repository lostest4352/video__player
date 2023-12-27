import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? selectedFile;

  Future<XFile?> selectImage() async {
    final XFile? media = await picker.pickMedia();

    if (media == null) {
      return null;
    } else {
      getImage(media);
      return media;
    }
  }

  void getImage(XFile? media) {
    selectedFile = media;
    notifyListeners();
  }
}
