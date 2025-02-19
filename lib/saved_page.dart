import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Halaman Tersimpan'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman tersimpan.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
