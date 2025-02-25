import 'package:flutter/material.dart';
import 'package:coffee_shop/profil_page.dart' as profil;
import 'package:coffee_shop/detail_page.dart';
import 'package:coffee_shop/home_page.dart';
import 'package:coffee_shop/login_google_page.dart' as google;
import 'package:coffee_shop/email_password.dart' as email;
import 'package:coffee_shop/saved_page.dart';
import 'package:coffee_shop/edit_profil_page.dart' as editProfil;

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
        '/saved': (context) => SavedPage(),
        '/profil': (context) => profil.ProfilPage(
            userName: 'User', userEmail: 'email@example.com'), // Default value
        '/edit_profil': (context) => editProfil.EditProfilPage(
            userName: 'User', userEmail: 'email@example.com'), // Default value
      },
    );
  }
}
