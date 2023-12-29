import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:my_app/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  // final Player player = Player();

  // VideoController get controller => VideoController(player);

  late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  late final VideoController controller = VideoController(player);

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playVideo(ImagePickerService imagePickerValue) async {
    await player.open(Media(imagePickerValue.selectedVideo!.path));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerService>(
      builder: (context, imagePickerValue, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                imagePickerValue.closeVideo(); // TODO
                // Navigator.of(context).pop(); // TODO
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text("Video Page"),
            actions: [
              IconButton(
                onPressed: () {
                  imagePickerValue.selectVideo();
                  if (imagePickerValue.selectedVideo != null) {
                    playVideo(imagePickerValue);
                  }
                },
                icon: const Icon(Icons.video_library),
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: [
                // Text(
                //   imagePickerValue.selectedVideo?.name ?? "Nothing selected",
                // ),
                // TODO
                Builder(
                  builder: (context) {
                    if (imagePickerValue.selectedVideo != null) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                        child: Video(
                          controller: controller,
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("No Video selected"),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
