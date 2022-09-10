import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/places_provider.dart';

class PlacesOverviewScreen extends StatelessWidget {
  const PlacesOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<PlacesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, AddPlaceScreen.routeName),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: places.items.isEmpty
          ? const Center(child: Text('No places was found'))
          : ListView.builder(
              itemCount: places.items.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(places.items[i].image),
                ),
                title: Text(places.items[i].name),
              ),
            ),
    );
  }
}
