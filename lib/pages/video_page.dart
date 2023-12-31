import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:my_app/pages/widgets/app_drawer.dart';
import 'package:my_app/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  // final Player player = Player();
  // Player get player => context.read<ImagePickerService>().player;
  // VideoController get controller => VideoController(player);

  late final player = context.read<ImagePickerService>().player;
  late VideoController controller = VideoController(player);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerService>(
      builder: (context, imagePickerValue, child) {
        return Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //   onPressed: () {
            //     imagePickerValue.closeVideo(); // TODO
            //     // Navigator.of(context).pop(); // TODO
            //   },
            //   icon: const Icon(Icons.arrow_back),
            // ),
            title: const Text("Video Page"),
            actions: [
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                    child: Video(
                      controller: controller,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      imagePickerValue.closeVideo();
                    },
                    icon: const Icon(Icons.stop),
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
