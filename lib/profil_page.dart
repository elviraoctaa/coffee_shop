import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const ProfilPage(
      {super.key, required this.userName, required this.userEmail});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 5),
                    shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profil.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(height: 16),
            Text(
              widget.userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.userEmail,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
