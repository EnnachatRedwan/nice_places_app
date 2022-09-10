import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_picker.dart';
import '../providers/places_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  static const String routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File? _image;
  final TextEditingController _nameController = TextEditingController();

  void _pickImage(File image) {
    _image = image;
  }

  void _savePlace() {
    if (_nameController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Please provide a name'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          });
      return;
    }
    if (_image == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Please take a picture'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          });
      return;
    }
    Provider.of<PlacesProvider>(context, listen: false)
        .addPlace(_nameController.text, _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImagePickerTool(onImagePicked: _pickImage),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: const Icon(Icons.save),
            label: const Text('Add place'),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.secondary,
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(double.infinity, 60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
