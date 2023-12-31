import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_kit/media_kit.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? selectedImage;
  XFile? selectedVideo;

  final player = Player();

  // For images
  void selectImage() async {
    final XFile? media = await picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      selectedImage = media;
      notifyListeners();
    }
  }

  void closeImage() {
    selectedImage = null;
    notifyListeners();
  }

  // For videos
  void selectVideo() async {
    final XFile? media = await picker.pickVideo(source: ImageSource.gallery);
    selectedVideo = media;
    final vidPath = selectedVideo?.path;
    if (vidPath != null) {
      await player.open(Media(vidPath));
      notifyListeners();
    }
  }

  void closeVideo() {
    player.stop();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
