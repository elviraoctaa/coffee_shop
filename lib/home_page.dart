import 'package:coffee_shop/widget/category.dart';
import 'package:coffee_shop/widget/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/saved_page.dart'; // Pastikan impor ini benar
import 'package:coffee_shop/profil_page.dart'; // Pastikan impor ini benar
import '../models/saved_coffee_shop.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const HomePage({super.key, required this.userName, required this.userEmail});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<SavedCoffeeShop> savedCoffeeShops = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(
        context,
        '/saved',
        arguments: savedCoffeeShops,
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilPage(
            userName: widget.userName,
            userEmail: widget.userEmail,
          ),
        ),
      );
    }
  }

  void _saveCoffeeShop(SavedCoffeeShop coffeeShop) {
    setState(() {
      savedCoffeeShops.add(coffeeShop);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Tersimpan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.brown.shade200,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage("assets/profil.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Hallo ${widget.userName}, Selamat Datang!!! 🙌",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.notifications_active,
                                color: Colors.white, size: 30),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: "Cari Toko Coffee Favoritmu ☕",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Category(imagePath: "assets/coffee.jpg", title: "Coffee"),
                    Category(imagePath: "assets/mesin.jpg", title: "Espresso"),
                    Category(imagePath: "assets/cup.jpg", title: "Latte"),
                    Category(imagePath: "assets/biji.jpg", title: "Beans"),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Tempat Favorit ☕ ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CoffeeShop(
                imagePath: "assets/kopi.jpg",
                nameshop: "Toko Kopi Annchira",
                rating: "5.0",
                time: "10.00 - 22.00 (Setiap Hari)",
                address: "Jl. Raya Salatiga no. 1, Semarang",
                description:
                    "Toko Kopi Annchira menawarkan berbagai macam kopi dengan cita rasa yang khas dan unik. Tempat yang nyaman untuk bersantai dan menikmati kopi.",
                onBookmark: _saveCoffeeShop,
              ),
              CoffeeShop(
                imagePath: "assets/ice.jpg",
                nameshop: "Kopi Sahara",
                rating: "4.7",
                time: "10.00 - 23.00 Senin - Sabtu",
                address: "Jl. Raya Semarang no. 2, Semarang",
                description:
                    "Kopi Sahara menawarkan berbagai macam kopi dengan cita rasa yang khas dan unik. Tempat yang nyaman untuk bersantai dan menikmati kopi.",
                onBookmark: _saveCoffeeShop,
              ),
              CoffeeShop(
                imagePath: "assets/latte.jpg",
                nameshop: "Coffe Latte",
                rating: "4.8",
                time: "11.00 - 00.00 (Senin - Jumat)",
                address: "Jl. Raya Yogyakarta no. 3, Yogyakarta",
                description:
                    "Coffe Latte menyajikan berbagai macam kopi latte dengan rasa yang lezat dan nikmat. Tempat yang cocok untuk berkumpul bersama teman dan keluarga.",
                onBookmark: _saveCoffeeShop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
