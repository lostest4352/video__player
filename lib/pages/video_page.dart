import 'package:flutter/material.dart';
import 'package:my_app/pages/widgets/video_player_page.dart';
import 'package:my_app/pages/widgets/app_drawer.dart';
import 'package:my_app/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerService>(
      builder: (context, imagePickerValue, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Video Page"),
            actions: [
              IconButton(
                onPressed: () {
                  imagePickerValue.changeAR();
                },
                icon: const Icon(Icons.aspect_ratio),
              ),
              IconButton(
                onPressed: () {
                  imagePickerValue.closeVideo();
                },
                icon: const Icon(Icons.stop),
              ),
              IconButton(
                onPressed: () {
                  imagePickerValue.selectVideo();
                },
                icon: const Icon(Icons.video_library),
              ),
            ],
          ),
          drawer: const AppDrawer(),
          body: Center(
            child: Builder(
              builder: (context) {
                final vidPath = imagePickerValue.selectedVideo?.path;
                if (vidPath == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          imagePickerValue.selectVideo();
                        },
                        icon: const Icon(Icons.video_library),
                      ),
                    ],
                  );
                } else {
                  return VideoPlayerPage(
                    media: vidPath,
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
