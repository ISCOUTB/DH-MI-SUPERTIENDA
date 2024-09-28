import 'package:flutter/material.dart';

class SupermarketsScreen extends StatelessWidget {
  const SupermarketsScreen({super.key});

  final List<Map<String, dynamic>> supermarkets = const [
    {
      'name': 'Tienda A',
      'logo': 'assets/ara.png', // Asegúrate de que esta ruta sea correcta
      'color': Colors.lightBlueAccent,
    },
    {
      'name': 'Tienda B',
      'logo': 'assets/', // Reemplaza con la ruta de tu logo
      'color': Colors.lightBlueAccent,
    },
    {
      'name': 'Tienda C',
      'logo': 'assets/images/tienda_c_logo.png', // Reemplaza con la ruta de tu logo
      'color': Colors.lightBlueAccent,
    },
        {
      'name': 'Tienda D',
      'logo': 'assets/images/tienda_d_logo.png', // Reemplaza con la ruta de tu logo
      'color': Colors.lightBlueAccent,
    },
        {
      'name': 'Tienda E',
      'logo': 'assets/images/tienda_e_logo.png', // Reemplaza con la ruta de tu logo
      'color': Colors.lightBlueAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Supermercados'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: supermarkets.length,
        itemBuilder: (ctx, index) {
          return SupermarketItem(
            name: supermarkets[index]['name'],
            logoPath: supermarkets[index]['logo'],
            color: supermarkets[index]['color'],
          );
        },
      ),
    );
  }
}

class SupermarketItem extends StatelessWidget {
  final String name;
  final String logoPath;
  final Color color;

  const SupermarketItem({
    super.key,
    required this.name,
    required this.logoPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            logoPath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10), // Espacio entre logo y nombre
          Text(
            name,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
