import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:provider/provider.dart';
import 'package:my_app/services/image_picker_service.dart';

class VideoPlayerPage extends StatefulWidget {
  final String media;
  const VideoPlayerPage({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  Player get player => context.read<ImagePickerService>().player;
  VideoController get controller => VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.media));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Video(
              controller: controller,
            ),
          );
        } else {
          return AspectRatio(
            aspectRatio: 9 / 16,
            child: Video(
              controller: controller,
            ),
          );
        }
      },
    );
  }
}
