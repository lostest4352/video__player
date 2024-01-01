import 'package:flutter/material.dart';
import 'package:my_app/pages/image_page.dart';
import 'package:my_app/pages/listinsert.dart';
import 'package:my_app/pages/video_page.dart';
import 'package:my_app/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                Spacer(),
                Text("Media App"),
                Spacer(),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              context.read<ImagePickerService>().closeVideo();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const ImagePage();
                },
              ));
            },
            title: const Text("Image Page"),
            leading: const Icon(Icons.image),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const VideoPage();
                },
              ));
            },
            title: const Text("Video Page"),
            leading: const Icon(Icons.video_collection),
          ),
          // TODO Remove later
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const ListInsert();
                },
              ));
            },
            title: const Text("List test"),
            leading: const Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}
