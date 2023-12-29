import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/video_page.dart';

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
                  Text("Drawer Header"),
                  Spacer(),
                ],
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const VideoPage();
                    },
                  ));
                },
                child: const Text("Video Page"),
              ),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const ImagePage();
                    },
                  ));
                },
                child: const Text("Image Page"),
              ),
            ),
          ],
        ),
      );
  }
}