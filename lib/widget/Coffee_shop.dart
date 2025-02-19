import 'package:flutter/material.dart';
import '../detail_page.dart'; // Pastikan impor ini benar

class CoffeeShop extends StatelessWidget {
  final String imagePath;
  final String nameshop;
  final String rating;
  final String time;
  final String address;
  final String description;

  const CoffeeShop({
    required this.imagePath,
    required this.nameshop,
    required this.rating,
    required this.time,
    required this.address,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Toko Kopi
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Toko Kopi
                Text(
                  nameshop,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                // Rating dan Jam Buka
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(rating),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16),
                        SizedBox(width: 4),
                        Text(time),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Tombol Lihat Detail
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: nameshop,
                          imagePath: imagePath,
                          rating: rating,
                          time: time,
                          address: address,
                          description: description,
                        ),
                      ),
                    );
                  },
                  child: Text("Lihat Detail"),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.bookmark),
                      onPressed: () {
                        Navigator.pushNamed(context, '/saved');
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
