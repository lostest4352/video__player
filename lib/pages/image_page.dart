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
            title: const Text("Media App"),
            actions: [
              IconButton(
                onPressed: () {
                  imagePickerValue.closeImage();
                },
                icon: const Icon(Icons.close),
              ),
              IconButton(
                onPressed: () {
                  imagePickerValue.selectImage();
                },
                icon: const Icon(Icons.image),
              ),
            ],
          ),
          drawer: const AppDrawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Builder(
                builder: (context) {
                  if (imagePickerValue.selectedImage != null) {
                    return Expanded(
                      child: ListView(
                        children: [
                          Center(
                            child: Image.file(
                              File(imagePickerValue.selectedImage!.path),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        onPressed: () {
                          imagePickerValue.selectImage();
                        },
                        icon: const Icon(Icons.open_in_browser),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
