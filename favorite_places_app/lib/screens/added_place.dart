import 'dart:io';

import 'package:favorite_places_app/model/place.dart';
import 'package:favorite_places_app/providers/user_places.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddedPlaceSceen extends ConsumerStatefulWidget {
  const AddedPlaceSceen({super.key});

  @override
  ConsumerState<AddedPlaceSceen> createState() {
    return _AddedPlaceSceen();
  }
}

class _AddedPlaceSceen extends ConsumerState<AddedPlaceSceen> {
  var titleController = TextEditingController();

  File? selectedImage;

  PlaceLocation? _selectedLocation;

  void _savePlace() {
    final enteredTitle = titleController.text;
    if (enteredTitle.isEmpty || selectedImage == null || _selectedLocation == null) {
      return;
    }

    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, selectedImage!, _selectedLocation!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text(
                  'Title',
                ),
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 16,
            ),
            ImageInput(onPickImage: (image) {
              selectedImage = image;
            }),
            const SizedBox(
              height: 16,
            ),
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            )
          ],
        ),
      ),
    );
  }
}
