import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  final Map<String, String> savedItem;

  const SavedPage({super.key, required this.savedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Tersimpan'),
      ),
      
    );
  }
}
