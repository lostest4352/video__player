import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_kit/media_kit.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? selectedImage;
  XFile? selectedVideo;

  final player = Player();

  int height = 9;
  int width = 16;

  // For videos
  void selectVideo() async {
    final XFile? media = await picker.pickVideo(source: ImageSource.gallery);
    selectedVideo = media;
    if (media != null) {
      await player.open(Media(media.path));
      notifyListeners();
    }
  }

  void closeVideo() {
    player.stop();
    selectedVideo = null;
    notifyListeners();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void changeAR() {
    height = player.state.height ?? 9;
    width = player.state.width ?? 16;
    notifyListeners();
  }

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
}
