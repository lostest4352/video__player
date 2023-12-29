import 'package:flutter/material.dart';
import 'package:my_app/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
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
                  imagePickerValue.selectVideo();
                },
                icon: const Icon(Icons.video_library),
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: [
                Text(imagePickerValue.selectedVideo?.name ?? "Nothing selected"),
              ],
            ),
          ),
        );
      },
    );
  }
}
