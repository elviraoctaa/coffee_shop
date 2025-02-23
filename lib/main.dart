import 'package:flutter/material.dart';
import 'package:coffee_shop/profil_page.dart';
import 'package:coffee_shop/detail_page.dart';
import 'package:coffee_shop/home_page.dart';
import 'package:coffee_shop/login_google_page.dart' as google;
import 'package:coffee_shop/email_password.dart' as email;
import 'package:coffee_shop/saved_page.dart'; // Pastikan impor ini benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ngopi Dulu',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => google.LoginGooglePage(),
        '/homepage': (context) => HomePage(
            userName: 'User', userEmail: 'email@example.com'), // Default value
        '/detail': (context) => DetailPage(
              title: 'Default Title',
              imagePath: 'assets/default.jpg',
              rating: '',
              time: '',
              address: '',
              description: '',
            ),
        '/login': (context) => email.EmailPasswordLogin(),
        '/saved': (context) => SavedPage(
              savedItem: {
                'imagePath': 'assets/kopi.jpg',
                'nameshop': 'Default Shop',
                'rating': '0.0',
                'time': '00:00 - 00:00',
                'address': 'Default Address',
                'description': 'Default Description',
              },
            ), // Pastikan rute ini benar
        '/profil': (context) => ProfilPage(
            userName: 'User', userEmail: 'email@example.com'), // Default value
      },
    );
  }
}
