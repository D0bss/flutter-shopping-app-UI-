import 'package:flutter/material.dart';
import 'package:shopping_app/item_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> hotOffers = [
    {"image": "assets/apple.jpg", "desc": "Fresh Apples - 20% Off"},
    {"image": "assets/cherry.jpg", "desc": "Sweet Cherries - Buy 1 Get 1"},
    {"image": "assets/orange.jpg", "desc": "Juicy Oranges - 10% Off"},
    {"image": "assets/banana.jpg", "desc": "Bananas - Half Price"},
    {"image": "assets/avocado.jpg", "desc": "Avocados - 25% Off"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Our Products'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset('assets/cherry2.jpg', fit: BoxFit.cover),
                Image.asset('assets/strawberry2.jpg', fit: BoxFit.cover),
                Image.asset('assets/orange2.jpg', fit: BoxFit.cover),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  buildProductCard(context, 'Apple', 'assets/apple.jpg'),
                  buildProductCard(context, 'Cherry', 'assets/cherry.jpg'),
                  buildProductCard(context, 'Orange', 'assets/orange.jpg'),
                  buildProductCard(context, 'Avocado', 'assets/avocado.jpg'),
                  buildProductCard(context, 'Banana', 'assets/banana.jpg'),
                ],
              ),
            ),
          ),
          Text(
            'Hot Offers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: hotOffers.length,
              itemBuilder: (BuildContext context, int index) {
                final offer = hotOffers[index];
                return buildProductCard(
                  context,
                  offer['desc']!,
                  offer['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
