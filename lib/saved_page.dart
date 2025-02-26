import 'package:flutter/material.dart';
import '../models/saved_coffee_shop.dart';
import '../widget/coffee_shop.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<SavedCoffeeShop>? savedCoffeeShops = ModalRoute.of(context)!.settings.arguments as List<SavedCoffeeShop>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tersimpan'),
      ),
      body: savedCoffeeShops != null && savedCoffeeShops.isNotEmpty
          ? ListView.builder(
              itemCount: savedCoffeeShops.length,
              itemBuilder: (context, index) {
                final savedCoffeeShop = savedCoffeeShops[index];
                return CoffeeShop(
                  imagePath: savedCoffeeShop.imagePath,
                  nameshop: savedCoffeeShop.nameshop,
                  rating: savedCoffeeShop.rating,
                  time: savedCoffeeShop.time,
                  address: savedCoffeeShop.address,
                  description: savedCoffeeShop.description,
                  onBookmark: (SavedCoffeeShop coffeeShop) {}, // No-op
                );
              },
            )
          : Center(
              child: Text('Tidak ada data tersimpan'),
            ),
    );
  }
}
