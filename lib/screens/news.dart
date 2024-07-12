import 'package:dana_kedua/models/promo.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messages!'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Promo'),
              Tab(text: 'Notifikasi'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PromoTab(),
            // NotifikasiTab(),
          ],
        ),
      ),
    );
  }
}

class PromoTab extends StatelessWidget {
  const PromoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: promos.map((promo) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(promo.imageUrl),
                ListTile(
                  title: Text(promo.title),
                  subtitle: Text(promo.subtitle),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {},
                      child: const Text(
                        'Lihat',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
