import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:my_app/pages/widgets/video_player_page.dart';
import 'package:my_app/pages/widgets/app_drawer.dart';
import 'package:my_app/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  Player get player => context.read<ImagePickerService>().player;
  VideoController get controller => VideoController(player);

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
                  imagePickerValue.closeVideo();
                },
                icon: const Icon(Icons.close),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      final vidPath = imagePickerValue.selectedVideo?.path;
                      if (vidPath == null) {
                        return Center(
                          child: IconButton(
                            onPressed: () {
                              imagePickerValue.selectVideo();
                            },
                            icon: const Icon(Icons.video_library),
                          ),
                        );
                      } else {
                        return VideoPlayerPage(
                          media: vidPath,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
