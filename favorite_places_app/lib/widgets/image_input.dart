import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    try {
      final pickedImage = await imagePicker.pickImage(
          source: ImageSource.camera, maxWidth: 600);

      if (pickedImage == null) {
        return;
      }
      setState(() {
        selectedImage = File(pickedImage.path);
      });

      widget.onPickImage(selectedImage!);
    } catch (e) {
      // Handle or log the error
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget contentImage = TextButton.icon(
      onPressed: _takePicture,
      label: const Text('Take Picture'),
      icon: const Icon(Icons.camera),
    );

    if (selectedImage != null) {
      contentImage = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      height: 300,
      width: double.infinity,
      alignment: Alignment.center,
      child: contentImage,
    );
  }
}
