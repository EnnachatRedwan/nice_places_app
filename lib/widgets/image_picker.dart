import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sys_paths;

class ImagePickerTool extends StatefulWidget {
  const ImagePickerTool({
    Key? key,
    required this.onImagePicked,
  }) : super(key: key);

  final Function onImagePicked;

  @override
  State<ImagePickerTool> createState() => _ImagePickerToolState();
}

class _ImagePickerToolState extends State<ImagePickerTool> {
  XFile? image;

  void _pickImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 400);

    if (pickedImage == null) return;

    setState(() {
      image = pickedImage;
    });

    final imageFileName = path.basename(pickedImage.path);
    final appDir = await sys_paths.getApplicationDocumentsDirectory();

    final storedImage =
        await File(pickedImage.path).copy('${appDir.path}/$imageFileName');
    widget.onImagePicked(storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: image == null
              ? const Text('No image was picked')
              : Image.file(File(image!.path)),
        ),
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.camera),
          label: const Text('Take a picture'),
        ),
      ],
    );
  }
}
