import 'package:flutter/material.dart';
import 'package:my_app/services/image_picker_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
      ),
      body: Consumer<ImagePickerService>(builder: (context, value, child) {
        return Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ImagePickerService>().selectImage();
                },
                child: const Text("Open image"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(value.selectedFile?.name ?? "Nothing selected"),
            ],
          ),
        );
      }),
    );
  }
}
