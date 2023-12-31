import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/pages/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import 'package:my_app/services/image_picker_service.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerService>(
      builder: (context, imagePickerValue, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Video Player"),
            actions: [
              IconButton(
                onPressed: () {
                  imagePickerValue.selectImage();
                },
                icon: const Icon(Icons.image),
              ),
            ],
          ),
          drawer: const AppDrawer(),
          body: ListView(
            children: [
              Column(
                children: [
                  
                  const SizedBox(
                    height: 10,
                  ),
                  Builder(
                    builder: (context) {
                      if (imagePickerValue.selectedImage != null) {
                        return Center(
                          child: Image.file(
                              File(imagePickerValue.selectedImage!.path)),
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
