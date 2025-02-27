// filepath: /lib/coffee_shop_list.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoffeeShop {
  final String imagePath;
  final String nameshop;
  final String rating;
  final String time;
  final String address;
  final String description;

  CoffeeShop({
    required this.imagePath,
    required this.nameshop,
    required this.rating,
    required this.time,
    required this.address,
    required this.description,
  });

  factory CoffeeShop.fromJson(Map<String, dynamic> json) {
    return CoffeeShop(
      imagePath: json['imagePath'],
      nameshop: json['nameshop'],
      rating: json['rating'],
      time: json['time'],
      address: json['address'],
      description: json['description'],
    );
  }
}

class CoffeeShopList extends StatefulWidget {
  @override
  _CoffeeShopListState createState() => _CoffeeShopListState();
}

class _CoffeeShopListState extends State<CoffeeShopList> {
  late Future<List<CoffeeShop>> coffeeShops;

  Future<List<CoffeeShop>> fetchCoffeeShops() async {
    final response = await http.get(Uri.parse('http://localhost:3000/coffee_shops'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((shop) => CoffeeShop.fromJson(shop)).toList();
    } else {
      throw Exception('Failed to load coffee shops');
    }
  }

  @override
  void initState() {
    super.initState();
    coffeeShops = fetchCoffeeShops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Shops'),
      ),
      body: FutureBuilder<List<CoffeeShop>>(
        future: coffeeShops,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].nameshop),
                  subtitle: Text(snapshot.data![index].description),
                );
              },
            );
          }
        },
      ),
    );
  }
}