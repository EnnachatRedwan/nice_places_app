import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({Key? key}) : super(key: key);

  static const String routeName ='/place-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Place details')),
      body: Container(),
    );
  }
}