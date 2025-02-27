import 'package:flutter/material.dart';
import 'models/saved_coffee_shop.dart';
import 'package:coffee_shop/widget/Coffee_shop.dart';

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<SavedCoffeeShop>? savedCoffeeShops;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    savedCoffeeShops = ModalRoute.of(context)!.settings.arguments as List<SavedCoffeeShop>?;
  }

  void _removeCoffeeShop(int index) {
    setState(() {
      savedCoffeeShops!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tersimpan'),
      ),
      body: savedCoffeeShops != null && savedCoffeeShops!.isNotEmpty
          ? ListView.builder(
              itemCount: savedCoffeeShops!.length,
              itemBuilder: (context, index) {
                final savedCoffeeShop = savedCoffeeShops![index];
                return Dismissible(
                  key: Key(savedCoffeeShop.nameshop),
                  onDismissed: (direction) {
                    _removeCoffeeShop(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${savedCoffeeShop.nameshop} dihapus')),
                    );
                  },
                  background: Container(color: Colors.red),
                  child: CoffeeShop(
                    imagePath: savedCoffeeShop.imagePath,
                    nameshop: savedCoffeeShop.nameshop,
                    rating: savedCoffeeShop.rating,
                    time: savedCoffeeShop.time,
                    address: savedCoffeeShop.address,
                    description: savedCoffeeShop.description,
                    onBookmark: (SavedCoffeeShop coffeeShop) {}, // No-op
                  ),
                );
              },
            )
          : Center(
              child: Text('Tidak ada data tersimpan'),
            ),
    );
  }
}
