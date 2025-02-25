import 'package:flutter/material.dart';
import '../models/saved_coffee_shop.dart';
import '../widget/coffee_shop.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SavedCoffeeShop? savedCoffeeShop = ModalRoute.of(context)!.settings.arguments as SavedCoffeeShop?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tersimpan'),
      ),
      body: savedCoffeeShop != null
          ? ListView(
              children: [
                CoffeeShop(
                  imagePath: savedCoffeeShop.imagePath,
                  nameshop: savedCoffeeShop.nameshop,
                  rating: savedCoffeeShop.rating,
                  time: savedCoffeeShop.time,
                  address: savedCoffeeShop.address,
                  description: savedCoffeeShop.description,
                ),
              ],
            )
          : Center(
              child: Text('Tidak ada data tersimpan'),
            ),
    );
  }
}
