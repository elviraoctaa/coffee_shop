import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'home_page.dart';
import 'login_google_page.dart' as google;
import 'email_password.dart' as email;
import 'saved_page.dart'; // Tambahkan impor ini

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
        '/homepage': (context) => HomePage(userName: 'User'), // Default value
        '/detail': (context) => DetailPage(
              title: 'Default Title',
              imagePath: 'assets/default.jpg',
              rating: '0.0',
              time: '00:00 - 00:00',
              address: 'Default Address',
              description: 'Default Description',
            ),
        '/login': (context) => email.EmailPasswordLogin(),
        '/saved': (context) => SavedPage(), // Tambahkan rute ini
      },
    );
  }
}
