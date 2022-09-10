import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/places_screen.dart';
import './screens/add_place_screen.dart';
import './screens/place_details_screen.dart';

import './providers/places_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        ),
        home: const PlacesOverviewScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen(),
          PlaceDetailsScreen.routeName: (ctx) => const PlaceDetailsScreen(),
        },
      ),
    );
  }
}
