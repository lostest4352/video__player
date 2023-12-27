import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_app/services/image_picker_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
      ),
      body: Consumer<ImagePickerService>(
        builder: (context, value, child) {
          return ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                  right: 70,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ImagePickerService>().selectImage();
                  },
                  child: const Text(
                    "Open image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(value.selectedImage?.name ?? "Nothing selected"),
              ),
              const SizedBox(
                height: 10,
              ),
              Builder(
                builder: (context) {
                  if (value.selectedImage?.path != null) {
                    return Center(
                        child: Image.file(File(value.selectedImage!.path)));
                  } else {
                    return const Center();
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
