import 'package:flutter/material.dart';

class PharmaciesLocationScreen extends StatelessWidget {
  const PharmaciesLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pharmacies Locations'),),
      body: const Text("Pharmacies Locations"),
    );
  }
}
